import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:broody/core/extensions/blur_hash.x.dart';
import 'package:broody/core/extensions/image.x.dart';
import 'package:broody/model/common/loading_value/loading_value.dart';
import 'package:broody/model/entry/entry.dart';
import 'package:broody/model/project/project.dart';
import 'package:broody/service/datasources/clip/clip.datasource.dart';
import 'package:broody/service/datasources/entry/entry.datasource.dart';
import 'package:broody/service/providers/directory.provider.dart';
import 'package:broody/service/repositories/project.repository.dart';
import 'package:broody/service/repositories/repository.dart';
import 'package:dartx/dartx_io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

abstract class IEntryRepository {
  Stream<LoadingValue<SavedEntry?>> saveEntry({required EditingEntry entry});

  Stream<LoadingValue<SavedEntry?>> updateEntryVersion(
      {required SavedEntry entry});

  Future<File?> getEntryClip(SavedEntry entry);

  Future<File?> getEntryThumbnail(SavedEntry entry);

  Future<void> deleteEntry(SavedEntry entry);

  List<SavedEntry> getEntriesForProject({required String projectId});

  Stream<List<SavedEntry>> watchEntriesForProject({required String projectId});

  Stream<List<SavedEntry>> watchOutdatedEntries({required String projectId});

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
    await for (final entries in watchEntriesForProject(projectId: projectId)) {
      yield entries
          .where((e) => e.exportVersion < entryAlgorithmVersion)
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
  Stream<LoadingValue<SavedEntry?>> saveEntry({
    required EditingEntry entry,
  }) async* {
    final clipDatasource = ref.read(clipDatasourceProvider);
    final entriesDirectory =
        await ref.read(projectDirectoryProvider(entry.projectId).future);
    await entriesDirectory.create();
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
      resolution: project.resolution,
      centerCropping: needsCropping
          ? _calculateCropping(project: project, entry: entry)
          : null,
    );

    await for (final loadingValue in process) {
      if (loadingValue is Loading<File?>) {
        yield LoadingValue.loading(progress: loadingValue.progress);
      } else if (loadingValue is LoadingError<File?>) {
        yield LoadingValue.error(
          error: loadingValue.error,
          stackTrace: loadingValue.stackTrace,
        );
        return;
      } else if (loadingValue is Data<File?>) {
        if (loadingValue.value == null) {
          debugPrint("Could not export entry successfully: $entry");
          yield LoadingValue.error(
              error: "Could not export entry successfully: $entry");
          return;
        }
        final destinationFile =
            entriesDirectory.file("${entry.day.toIso8601String()}.mp4");
        try {
          debugPrint("Copying resulting clip to folder...");
          await loadingValue.value!.copy(destinationFile.path);
        } catch (e, s) {
          yield LoadingValue.error(error: e, stackTrace: s);
          return;
        }
        final hash = await blurHash;
        final entryToSave = Entry.saved(
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
        yield LoadingValue.data(value: entryToSave);
        return;
      }
    }
  }

  @override
  Stream<LoadingValue<SavedEntry?>> updateEntryVersion(
      {required SavedEntry entry}) async* {
    final clipDatasource = ref.read(clipDatasourceProvider);
    final file = await getEntryClip(entry);
    if (file == null) {
      throw Exception(
          "This entry can't be regenerated because its file wasn't found!");
    }
    final process = clipDatasource.createClip(
      startPoint: null,
      duration: entry.duration,
      videoSource: file,
      resolution: Size(entry.width.toDouble(), entry.height.toDouble()),
      highQuality: true,
    );

    await for (final loadingValue in process) {
      if (loadingValue is Loading<File?>) {
        yield LoadingValue.loading(progress: loadingValue.progress);
      } else if (loadingValue is LoadingError<File?>) {
        yield LoadingValue.error(
          error: loadingValue.error,
          stackTrace: loadingValue.stackTrace,
        );
        return;
      } else if (loadingValue is Data<File?>) {
        if (loadingValue.value == null) {
          debugPrint("Could not update entry successfully: $entry");
          yield LoadingValue.error(
              error: "Could not update entry successfully: $entry");
          return;
        }
        try {
          debugPrint("Copying resulting clip to folder...");
          await loadingValue.value!.copy(file.path);
        } catch (e, s) {
          yield LoadingValue.error(error: e, stackTrace: s);
          return;
        }
        final updatedEntry = entry.copyWith(
          exportVersion: entryAlgorithmVersion,
          changedWhen: DateTime.now(),
        );
        debugPrint("Saving Updated Entry to Database...");
        await ref
            .read(entryDatasourceProvider(entry.projectId))
            .setEntry(updatedEntry);
        yield LoadingValue.data(value: updatedEntry);
        return;
      }
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
    final bytes = entry.thumbnailBytes ??
        await VideoThumbnail.thumbnailData(
          video: entry.videoPath,
          timeMs: entry.startPoint.inMilliseconds,
          imageFormat: ImageFormat.JPEG,
          maxHeight: entry.height ~/ 2,
          maxWidth: entry.width ~/ 2,
          quality: 10,
        );
    if (bytes == null) return null;
    File(directory.path + "/" + entry.uid + ".jpg").writeAsBytes(bytes);
    final img = await decodeImageOnIsolate(Uint8List.fromList(bytes));
    if (img == null) return null;
    return await encodeBlurHashOnIsolate(img);
  }

  @override
  bool _entryNeedsCropping(
      {required Project project, required EditingEntry entry}) {
    final projectAspectRatio =
        project.resolution.width / project.resolution.height;
    final entryAspectRatio = entry.width / entry.height;
    if (projectAspectRatio != entryAspectRatio) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Size _calculateCropping(
      {required Project project, required EditingEntry entry}) {
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
