import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:broody/core/constants/video_resolutions.dart';
import 'package:broody/service/datasources/clip/clip.datasource.dart';
import 'package:broody_video/broody_video.dart';
import 'package:flutter/foundation.dart';
import 'package:loading_value/loading_value.dart';

class BroodyClipDatasource extends IClipDatasource {
  @override
  int get algorithmVersion => 6;

  @override
  String get fileFormat => ".mp4";

  @override
  Stream<LoadingValue<File?>> createClip({
    required Duration startPoint,
    required Duration duration,
    required File videoSource,
    required Size resolution,
    bool highQuality = false,
    Size? centerCropping,
  }) async* {
    if (resolution != resolution1080Landscape &&
        resolution !=
            Size(resolution1080Landscape.height,
                resolution1080Landscape.width)) {
      throw UnimplementedError("Only 1080p supported so far");
    }

    final process = BroodyVideo.instance.processClip(
      sourceFile: videoSource,
      start: startPoint,
      duration: duration,
      targetSize: resolution,
    );

    await for (final p in process) {
      yield p.when(
        data: (data) => LoadingValue.data(data?.file),
        error: (e, s) => LoadingValue.error(e, stackTrace: s),
        loading: (p) => LoadingValue.loading(p),
      );
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
