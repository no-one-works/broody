import 'dart:async';
import 'dart:io';

import 'package:broody/core/constants/box_keys.dart';
import 'package:broody/core/extensions/hive_box.x.dart';
import 'package:broody/model/compilation/compilation.dart';
import 'package:broody/service/datasources/compilation/compilation.datasource.dart';
import 'package:collection/collection.dart';
import 'package:dartx/dartx_io.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/ffmpeg_kit_config.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/log.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/return_code.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:loading_value/loading_value.dart';
import 'package:path_provider/path_provider.dart';

class FFmpegCompilationDatasource extends CompilationDatasource {
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
    final outputPath = "${dir.path}/${createCompilation.filename}";

    final path = await getTemporaryDirectory();
    debugPrint(path.path);
    debugPrint(outputPath);
    final videoSourcesStringFile = File("${path.path}/videoSources.txt");
    final videoSourcesString = createCompilation.usedEntries.map(
        (e) => "file '${createCompilation.projectPath}/${e.clipFileName}'");
    await videoSourcesStringFile.writeAsString(videoSourcesString.join("\n"));

    // Delete existing compilation
    final f = File(outputPath);
    if (await f.exists()) {
      debugPrint("Deleted existing compilation.");
      await f.delete();
    }
    var command =
        '-y -f concat -safe 0 -i ${videoSourcesStringFile.path} -c copy "$outputPath"';

    final Completer<File?> completer = Completer<File?>();
    FFmpegKit.executeAsync(
      command,
      (session) async {
        final state =
            FFmpegKitConfig.sessionStateToString(await session.getState());
        final returnCode = await session.getReturnCode();
        debugPrint(
            "FFmpeg process exited with state $state and rc $returnCode");
        if (ReturnCode.isSuccess(returnCode)) {
          debugPrint("FFmpeg processing completed successfully.");
          debugPrint('Video successfully saved');
          completer.complete(File(outputPath));
        } else {
          debugPrint("FFmpeg processing failed.");
          debugPrint("Couldn't save the video");
          completer.complete(null);
        }
      },
      (Log log) => debugPrint(log.getMessage()),
    );
    final file = await completer.future;
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
    }
    yield LoadingValue.data(savedCompilation);
  }

  @override
  Future<void> clearCompilations(List<Directory> compilationDirectories) async {
    _box.clear();
    await Future.wait(
        compilationDirectories.map((e) => e.delete(recursive: true)));
  }

  @override
  Future<bool> deleteCompilation({
    required SavedCompilation compilation,
    File? file,
  }) async {
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
