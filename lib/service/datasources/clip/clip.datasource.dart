import 'dart:async';
import 'dart:io';

import 'package:broody/model/common/loading_value/loading_value.dart';
import 'package:dartx/dartx_io.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/return_code.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/session.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/session_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

abstract class IClipDatasource {
  Stream<LoadingValue<File?>> createClip({
    required Duration? startPoint,
    required Duration duration,
    required File videoSource,
    required Size resolution,
    bool highQuality = false,
    Size? centerCropping,
  });

  Future<bool> deleteClip({required File file});

  Future<File?> loadClip({required File file});
}

final clipDatasourceProvider =
    Provider<IClipDatasource>((ref) => ClipDatasource());

class ClipDatasource extends IClipDatasource {
  Session? _currentSession;

  @override
  Stream<LoadingValue<File?>> createClip({
    required Duration? startPoint,
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
      if (cutLoadingValue is Loading<File?>) {
        yield LoadingValue.loading(progress: cutLoadingValue.progress);
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
    final destinationFile = destinationDir.file("cut.mp4");
    final filters = centerCropping == null
        ? "-vf scale=${resolution.width.toInt()}x${resolution.height.toInt()}"
        : '-vf "crop=iw-${centerCropping.width}:ih-${centerCropping.height}, scale=${resolution.width.toInt()}x${resolution.height.toInt()}"';
    final seek = startPoint == null ? "" : "-ss $startPoint";
    final end = startPoint == null ? "" : "-t $duration";
    final preset = highQuality ? "veryslow" : "veryfast";
    final command =
        '-y $seek -i "${videoSource.path}" -f lavfi -i aevalsrc=0 -shortest $end $filters -video_track_timescale 30k -c:v libx264 -c:a aac -ac 2 -ar 44100 -preset $preset -r 30 "${destinationFile.path}"'
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
        LoadingValue.loading(
          progress: stats.getTime() / totalDuration.inMilliseconds,
        ),
      );
    });
    yield* controller.stream;
    try {
      final success = await completer.future;
      yield LoadingValue.data(value: success ? successResult : null);
    } catch (e, s) {
      yield LoadingValue.error(error: e, stackTrace: s);
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
