import 'dart:async';
import 'dart:io';

import 'package:broody/core/constants/box_keys.dart';
import 'package:broody/core/extensions/hive_box.x.dart';
import 'package:broody/model/compilation/compilation.dart';
import 'package:broody_video/broody_video.dart';
import 'package:collection/collection.dart';
import 'package:dartx/dartx_io.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:loading_value/loading_value.dart';

import 'compilation.datasource.dart';

class BroodyCompilationDatasource extends ICompilationDatasource {
  late final Box<SavedCompilation> _box =
      Hive.box<SavedCompilation>(compilationBoxKey);

  @override
  List<SavedCompilation> get compilations => _box.values.toList();

  @override
  Stream<List<SavedCompilation>> get compilations$ => _box.watchValues();

  @override
  FutureOr<void> setCompilation(SavedCompilation compilation) {
    _box.put(compilation.uid, compilation);
  }

  @override
  Stream<LoadingValue<SavedCompilation?>> createCompilation(
      {required CreateCompilation createCompilation}) async* {
    final dir = Directory(createCompilation.destination);
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    final outputPath = "${dir.path}/${createCompilation.filename}.mp4";
    final videoPaths = createCompilation.usedEntries
        .map((e) => "${createCompilation.projectPath}/${e.clipFileName}")
        .toList();
    print(outputPath);
    final process = BroodyVideo.instance
        .concatVideos(sourcePaths: videoPaths, destination: File(outputPath));

    LoadingValue<MediaInfo?> loadingFile = LoadingValue.loading(0);
    await for (final p in process) {
      loadingFile = p;
      if (loadingFile is LoadedData<MediaInfo?>) {
        break;
      } else if (loadingFile is ValueLoading<MediaInfo?>) {
        yield LoadingValue.loading(loadingFile.progress);
      } else if (loadingFile is LoadingError<MediaInfo?>) {
        yield LoadingValue.error(loadingFile.error,
            stackTrace: loadingFile.stackTrace);
      }
    }
    final mediaInfo = loadingFile.whenOrNull(data: (mediaInfo) => mediaInfo);
    final file = mediaInfo?.file;
    print(mediaInfo?.toJson());
    await file?.setLastModified(DateTime.now());
    final savedCompilation = file == null
        ? null
        : SavedCompilation(
            uid: createCompilation.uid,
            filename: file.name,
            projectUid: createCompilation.projectUid,
            monthOfYear: createCompilation.monthOfYear,
            usedEntries: createCompilation.usedEntries,
            created: DateTime.now(),
            width: createCompilation.width,
            height: createCompilation.height,
          );

    if (savedCompilation != null) {
      setCompilation(savedCompilation);
    } else {}
    yield LoadingValue.data(savedCompilation);
  }

  @override
  Future<void> clearCompilations(List<Directory> compilationDirectories) async {
    _box.clear();
    await Future.wait(
        compilationDirectories.map((e) => e.delete(recursive: true)));
  }

  @override
  Future<bool> deleteCompilation(
      {required SavedCompilation compilation, File? file}) async {
    _box.delete(compilation.uid);
    try {
      await file?.delete();
      return true;
    } catch (e) {
      debugPrint("Could not delete file: $e");
      return false;
    }
  }

  @override
  Future<File?> loadCompilation({required File file}) async {
    if (await file.exists()) {
      return file;
    }
    return null;
  }

  @override
  SavedCompilation? getCompilationForProject({
    required String projectUid,
    DateTime? monthOfYear,
  }) {
    return compilations.firstWhereOrNull(
      (c) => c.projectUid == projectUid && c.monthOfYear == monthOfYear,
    );
  }
}
