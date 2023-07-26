import 'dart:async';
import 'dart:io';

import 'package:broody/core/constants/box_keys.dart';
import 'package:broody/core/extensions/hive_box.x.dart';
import 'package:broody/model/compilation/compilation.dart';

import 'package:collection/collection.dart';
import 'package:dartx/dartx_io.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:process_value/process_value.dart';
import 'package:video_transcode/video_transcode.dart';

import 'compilation.datasource.dart';

class BroodyCompilationDatasource extends CompilationDatasource {
  late final Box<SavedCompilation> _box =
      Hive.box<SavedCompilation>(compilationBoxKey);

  @override
  List<SavedCompilation> get compilations => _box.values.toList();

  @override
  Stream<List<SavedCompilation>> get compilations$ => _box.watchValues();

  TranscodeProcess? _process;

  @override
  FutureOr<void> setCompilation(SavedCompilation compilation) {
    _box.put(compilation.uid, compilation);
  }

  @override
  Stream<ProcessValue<SavedCompilation?>> createCompilation(
      {required CreateCompilation createCompilation}) async* {
    final dir = Directory(createCompilation.destination);
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    final sources = createCompilation.usedEntries
        .map((e) => "${createCompilation.projectPath}/${e.clipFileName}")
        .map(File.new)
        .toList();
    final target = File("${dir.path}/${createCompilation.filename}.mp4");
    print(target);
    final process = VideoTranscode.instance.concatVideos(
      sources: sources,
      target: target,
    );
    _process = process;

    await for (final p in process.updates) {
      yield p.whenData((mediaInfo) {
        final file = mediaInfo?.file;
        print(mediaInfo?.toJson());
        file?.setLastModified(DateTime.now());
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
        }
        return savedCompilation;
      });
    }
  }

  @override
  Future<void> cancelCompilationCreation() async {
    if (_process?.isRunning == true) await _process?.cancel();
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
