import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:broody/core/extensions/blur_hash.x.dart';
import 'package:broody/core/extensions/image.x.dart';
import 'package:broody/model/entry/entry.dart';
import 'package:broody/model/project/project.dart';
import 'package:broody/service/datasources/clip/clip.datasource.dart';
import 'package:broody/service/datasources/entry/entry.datasource.dart';
import 'package:broody/service/providers/directory.provider.dart';
import 'package:broody/service/repositories/project.repository.dart';
import 'package:broody/service/repositories/repository.dart';
import 'package:video_transcode/video_transcode.dart';
import 'package:dartx/dartx_io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:process_value/process_value.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:riverpod/riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

abstract class IEntryRepository {
  Stream<ProcessValue<SavedEntry?>> saveEntry({required EditingEntry entry});

  Stream<ProcessValue<SavedEntry?>> updateEntryVersion({
    required SavedEntry entry,
  });

  Future<File?> getEntryClip(SavedEntry entry);

  Future<File?> getEntryThumbnail(SavedEntry entry);

  Future<void> deleteEntry(SavedEntry entry);

  List<SavedEntry> getEntriesForProject({required String projectId});

  Stream<List<SavedEntry>> watchEntriesForProject({required String projectId});

  Stream<List<SavedEntry>> watchOutdatedEntries({required String projectId});

  Future<void> shareEntry({required SavedEntry entry});

  SavedEntry? getEntry(String projectId, DateTime timestamp);
}

final entryRepositoryProvider =
    Provider<IEntryRepository>((ref) => EntryRepository(ref));

class EntryRepository extends RepositoryBase implements IEntryRepository {
  EntryRepository(ProviderRef ref) : super(ref);

  @override
  Future<void> deleteEntry(SavedEntry entry) async {
    final datasource = ref.read(entryDatasourceProvider(entry.projectId));
    await Future.wait<dynamic>([
      getEntryClip(entry).then((c) => c?.delete()),
      getEntryThumbnail(entry).then((t) => t?.delete()),
    ]);
    await datasource.deleteEntry(entry.timestamp);
  }

  @override
  List<SavedEntry> getEntriesForProject({required String projectId}) {
    final datasource = ref.read(entryDatasourceProvider(projectId));
    return datasource.entries;
  }

  @override
  Stream<List<SavedEntry>> watchOutdatedEntries(
      {required String projectId}) async* {
    final clipDatasource = ref.read(clipDatasourceProvider);
    await for (final entries in watchEntriesForProject(projectId: projectId)) {
      yield entries
          .where((e) => e.exportVersion != clipDatasource.algorithmVersion)
          .toList();
    }
  }

  @override
  SavedEntry? getEntry(String projectId, DateTime timestamp) {
    final datasource = ref.read(entryDatasourceProvider(projectId));
    return datasource.getEntry(timestamp);
  }

  @override
  Future<File?> getEntryClip(SavedEntry entry) async {
    final entriesDirectory =
        await ref.read(projectDirectoryProvider(entry.projectId).future);
    final maybeFile = File("${entriesDirectory.path}/${entry.clipFileName}");
    final clipDatasource = ref.read(clipDatasourceProvider);
    return await clipDatasource.loadClip(file: maybeFile);
  }

  @override
  Future<File?> getEntryThumbnail(SavedEntry entry) async {
    final entriesDirectory =
        await ref.read(projectDirectoryProvider(entry.projectId).future);

    final file = File("${entriesDirectory.path}/${entry.uid}.jpg");
    return await file.exists() ? file : null;
  }

  @override
  Stream<ProcessValue<SavedEntry?>> saveEntry({
    required EditingEntry entry,
  }) async* {
    final clipDatasource = ref.read(clipDatasourceProvider);
    final entriesDirectory =
        await ref.read(projectDirectoryProvider(entry.projectId).future);
    await entriesDirectory.create();
    final destinationFile = entriesDirectory.file(
      "${entry.day.toIso8601String()}${clipDatasource.fileFormat}",
    );
    final Future<BlurHash?> blurHash = _makeBlurHashAndThumbnail(
      entry,
      entriesDirectory,
    );

    final project =
        ref.read(projectRepositoryProvider).getProject(entry.projectId);
    if (project == null) {
      throw Exception("Trying to save entry for project that does not exist!");
    }

    final needsCropping = _entryNeedsCropping(project: project, entry: entry);

    final process = clipDatasource.createClip(
      startPoint: entry.startPoint,
      duration: entry.duration,
      videoSource: File(entry.videoPath),
      videoDestination: destinationFile,
      resolution: project.resolution,
      centerCropping: needsCropping
          ? _calculateCropping(project: project, entry: entry)
          : null,
    );

    await for (final processValue in process) {
      yield await processValue.whenDataAsync((value) async {
        if (value == null) {
          throw Exception("Could not export entry successfully: $entry");
        }
        final hash = await blurHash;
        final entryToSave = Entry.saved(
          exportVersion: clipDatasource.algorithmVersion,
          changedWhen: DateTime.now(),
          projectId: entry.projectId,
          timestamp: entry.timestamp,
          assetEntityId: entry.assetEntityId,
          clipFileName: destinationFile.name,
          blurHash: hash?.hash ?? "",
          color: hash?.getSingleColor().value,
          startPoint: entry.startPoint,
          duration: entry.duration,
          width: project.resolution.width.toInt(),
          height: project.resolution.height.toInt(),
        ) as SavedEntry;
        debugPrint("Saving Entry to Database...");
        await ref
            .read(entryDatasourceProvider(entry.projectId))
            .setEntry(entryToSave);
        return entryToSave;
      });
    }
  }

  @override
  Stream<ProcessValue<SavedEntry?>> updateEntryVersion(
      {required SavedEntry entry}) async* {
    final assetEntity = await AssetEntity.fromId(entry.assetEntityId);
    debugPrint("Loading original assetEntity for ${entry.uid}");
    final originalFile = (await assetEntity?.loadFile());
    if (originalFile == null) {
      debugPrint(
          "Original AssetEntity for ${entry.uid} not found! Falling back to re-encoding clip.");
      yield* _updateEntryVersionFromClip(entry: entry);
      return;
    }
    debugPrint("Re-encoding original assetEntity for ${entry.uid}");
    final entriesDirectory =
        await ref.read(projectDirectoryProvider(entry.projectId).future);
    await entriesDirectory.create();
    final project =
        ref.read(projectRepositoryProvider).getProject(entry.projectId);

    final needsCropping = _entryNeedsCropping(project: project!, entry: entry);
    final clipDatasource = ref.read(clipDatasourceProvider);
    final process = clipDatasource.createClip(
      videoSource: originalFile,
      videoDestination: (await getEntryClip(entry))!,
      startPoint: entry.startPoint,
      duration: entry.duration,
      resolution: project.resolution,
      centerCropping: needsCropping
          ? _calculateCropping(project: project, entry: entry)
          : null,
    );

    await for (final value in process) {
      yield await value.whenDataAsync((value) async {
        final updatedEntry = entry.copyWith(
          exportVersion: clipDatasource.algorithmVersion,
          changedWhen: DateTime.now(),
        );
        debugPrint("Saving Updated Entry to Database...");
        await ref
            .read(entryDatasourceProvider(entry.projectId))
            .setEntry(updatedEntry);
        return updatedEntry;
      });
    }
  }

  Stream<ProcessValue<SavedEntry?>> _updateEntryVersionFromClip(
      {required SavedEntry entry}) async* {
    final clipDatasource = ref.read(clipDatasourceProvider);
    final clipFile = await getEntryClip(entry);
    if (clipFile == null) {
      throw Exception(
          "This entry can't be regenerated because its file wasn't found!");
    }
    // copy to temp
    final source = await clipFile.copy(
      clipFile.parent.path + "/temp_${clipFile.name}",
    );
    final process = clipDatasource.createClip(
      startPoint: Duration.zero,
      duration: entry.duration,
      videoSource: source,
      videoDestination: clipFile,
      resolution: Size(entry.width.toDouble(), entry.height.toDouble()),
      highQuality: true,
    );

    await for (final value in process) {
      yield await value.whenDataAsync((value) async {
        final updatedEntry = entry.copyWith(
          exportVersion: clipDatasource.algorithmVersion,
          changedWhen: DateTime.now(),
        );
        debugPrint("Saving Updated Entry to Database...");
        await ref
            .read(entryDatasourceProvider(entry.projectId))
            .setEntry(updatedEntry);
        // Delete temporary file
        await source.delete();
        return updatedEntry;
      });
    }
  }

  @override
  Stream<List<SavedEntry>> watchEntriesForProject({required String projectId}) {
    return ref.read(entryDatasourceProvider(projectId)).entries$;
  }

  Future<BlurHash?> _makeBlurHashAndThumbnail(
    EditingEntry entry,
    Directory directory,
  ) async {
    final List<int>? bytes;
    if (entry.thumbnailBytes != null) {
      bytes = entry.thumbnailBytes!;
    } else {
      bytes = await VideoThumbnail.thumbnailData(
        video: entry.videoPath,
        timeMs: entry.startPoint.inMilliseconds,
        imageFormat: ImageFormat.JPEG,
        maxHeight: entry.height ~/ 2,
        maxWidth: entry.width ~/ 2,
        quality: 10,
      );
    }
    if (bytes == null) return null;
    File(directory.path + "/" + entry.uid + ".jpg").writeAsBytes(bytes);
    final img = await decodeImageOnIsolate(Uint8List.fromList(bytes));
    if (img == null) return null;
    return await encodeBlurHashOnIsolate(img);
  }

  @override
  Future<void> shareEntry({required SavedEntry entry}) async {
    final file = await getEntryClip(entry);
    if (file == null) return;
    Share.shareFiles([file.path]);
  }

  bool _entryNeedsCropping({required Project project, required Entry entry}) {
    final projectAspectRatio =
        project.resolution.width / project.resolution.height;
    final entryAspectRatio = entry.width / entry.height;
    if (projectAspectRatio != entryAspectRatio) {
      return true;
    } else {
      return false;
    }
  }

  Size _calculateCropping({required Project project, required Entry entry}) {
    final projectAspectRatio =
        project.resolution.width / project.resolution.height;
    final entryAspectRatio = entry.width / entry.height;
    var outWidth = 0.0;
    var outHeight = 0.0;
    if (projectAspectRatio > entryAspectRatio) {
      outWidth = entry.width.toDouble();
      outHeight = entry.width / projectAspectRatio;
    } else {
      outHeight = entry.height.toDouble();
      outWidth = (entry.height * projectAspectRatio);
    }
    return Size(entry.width - outWidth, entry.height - outHeight);
  }
}
