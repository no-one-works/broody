import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:broody/core/constants/video_resolutions.dart';
import 'package:broody/service/datasources/clip/clip.datasource.dart';
import 'package:dartx/dartx_io.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_transcode/video_transcode.dart';
import 'package:flutter/foundation.dart';
import 'package:process_value/process_value.dart';

class BroodyClipDatasource extends ClipDatasource {
  @override
  int get algorithmVersion => 7;

  @override
  String get fileFormat => ".mp4";

  @override
  Stream<ProcessValue<File?>> createClip({
    required Duration startPoint,
    required Duration duration,
    required File videoSource,
    required File videoDestination,
    required Size resolution,
    bool highQuality = false,
    Size? centerCropping,
    bool overwrite = false,
  }) async* {
    if (resolution != resolution1080Landscape &&
        resolution !=
            Size(resolution1080Landscape.height,
                resolution1080Landscape.width)) {
      throw UnimplementedError("Only 1080p supported so far");
    }
    if (await videoDestination.exists()) {
      if (overwrite) {
        await videoDestination.delete();
      } else {
        throw ArgumentError("File already exists and overwrite is false");
      }
    }
    final process = VideoTranscode.instance.processClip(
      source: videoSource,
      target: videoDestination,
      start: startPoint,
      duration: duration,
      targetSize: (
        width: resolution.width.toInt(),
        height: resolution.height.toInt()
      ),
    );

    await for (final p in process.updates) {
      if (p case ProcessError(:final error, :final stackTrace)) {
        debugPrint("Error: $error");
        debugPrintStack(stackTrace: stackTrace);
      }
      yield p.whenData((value) => value?.file);
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
