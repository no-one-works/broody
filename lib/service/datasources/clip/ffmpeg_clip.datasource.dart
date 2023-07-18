import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:broody/service/datasources/clip/clip.datasource.dart';
import 'package:dartx/dartx_io.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/return_code.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/session.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/session_state.dart';
import 'package:flutter/foundation.dart';
import 'package:loading_value/loading_value.dart';
import 'package:path_provider/path_provider.dart';

class FFmpegClipDatasource extends ClipDatasource {
  Session? _currentSession;

  @override
  int get algorithmVersion => 5;

  @override
  String get fileFormat => ".mp4";

  final useX265 = !Platform.isAndroid;

  @override
  Stream<LoadingValue<File?>> createClip({
    required Duration startPoint,
    required Duration duration,
    required File videoSource,
    required Size resolution,
    bool highQuality = false,
    Size? centerCropping,
  }) async* {
    final temporaryDirectory = await getTemporaryDirectory();
    final cuttingProcess = _cutClip(
      temporaryDirectory: temporaryDirectory,
      videoSource: videoSource,
      startPoint: startPoint,
      duration: duration,
      resolution: resolution,
      highQuality: highQuality,
      centerCropping: centerCropping,
    );
    debugPrint("Exporting ${videoSource.path}...");
    await for (final cutLoadingValue in cuttingProcess) {
      if (cutLoadingValue is ValueLoading<File?>) {
        yield LoadingValue.loading(cutLoadingValue.progress);
      } else {
        debugPrint(cutLoadingValue.toString());
        yield cutLoadingValue;
        return;
      }
    }
  }

  Stream<LoadingValue<File?>> _cutClip({
    required Directory temporaryDirectory,
    required File videoSource,
    required Duration? startPoint,
    required Duration duration,
    required Size resolution,
    required bool highQuality,
    Size? centerCropping,
  }) async* {
    final destinationDir = temporaryDirectory.subdir("export");
    await destinationDir.create(recursive: true);
    final destinationFile = destinationDir.file("cut$fileFormat");
    final filters = centerCropping == null
        ? "-vf scale=${resolution.width.toInt()}x${resolution.height.toInt()}"
        : '-vf "crop=iw-${centerCropping.width}:ih-${centerCropping.height}, scale=${resolution.width.toInt()}x${resolution.height.toInt()}"';
    final seek = startPoint == null ? "" : "-ss $startPoint";
    final end = startPoint == null ? "" : "-t $duration";
    final quality = highQuality ? "-crf 20" : "-crf 29";
    const preset = "-preset ultrafast";
    const audioSettings = "-c:a aac -ac 2 -ar 44100";
    const timescale = "-video_track_timescale 30k";
    final encoder = useX265 ? "-c:v libx265" : "-c:v libx264";
    final hevcTag = useX265 ? "-tag:v hvc1" : "";
    final tune = useX265 ? "-tune zerolatency" : "";
    const pixelFormat = "-pix_fmt yuv420p";
    final command =
        '-y $seek -i "${videoSource.path}" -f lavfi -i aevalsrc=0 -shortest $end $filters $timescale $encoder $hevcTag $pixelFormat $quality $preset $tune -r 30 $audioSettings "${destinationFile.path}"'
            .replaceAll("  ", " ");
    yield* _executeCommand(
      command,
      totalDuration: duration,
      successResult: destinationFile,
    );
  }

  Stream<LoadingValue<ResultType?>> _executeCommand<ResultType>(
    String command, {
    required Duration totalDuration,
    required ResultType successResult,
  }) async* {
    if (_currentSession != null) {
      throw Exception("A clip session is already in progress!");
    }
    final Completer<bool> completer = Completer();
    final StreamController<LoadingValue<ResultType?>> controller =
        StreamController();
    debugPrint(command);
    _currentSession = await FFmpegKit.executeAsync(command, (session) async {
      controller.close();
      final state = await session.getState();
      final returnCode = await session.getReturnCode();
      _currentSession?.cancel();
      _currentSession = null;
      switch (state) {
        case SessionState.failed:
          completer.completeError(
            Exception("Executing $command failed!"),
            StackTrace.fromString(
              (await session.getFailStackTrace())!,
            ),
          );
          break;
        case SessionState.completed:
          !ReturnCode.isSuccess(returnCode)
              ? completer.completeError(
                  Exception("Executing $command failed!"),
                  StackTrace.fromString(
                    (await session.getFailStackTrace() ?? ""),
                  ),
                )
              : completer.complete(ReturnCode.isSuccess(returnCode));
          break;
        default:
          throw Exception("FFMPEG finished with invalid state $state");
      }
    }, (log) {
      debugPrint(log.getMessage());
    }, (stats) {
      controller.add(
        LoadingValue.loading(stats.getTime() / totalDuration.inMilliseconds),
      );
    });
    yield* controller.stream;
    try {
      final success = await completer.future;
      yield LoadingValue.data(success ? successResult : null);
    } catch (e, s) {
      yield LoadingValue.error(e, stackTrace: s);
    }
  }

  @override
  Future<bool> deleteClip({required File file}) async {
    try {
      await file.delete();
      return true;
    } catch (e) {
      debugPrint("Could not delete file: $e");
      return false;
    }
  }

  @override
  Future<File?> loadClip({required File file}) async {
    if (await file.exists()) {
      return file;
    }
    return null;
  }
}
