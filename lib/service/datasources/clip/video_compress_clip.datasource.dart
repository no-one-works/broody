import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:broody/core/constants/video_resolutions.dart';
import 'package:broody/service/datasources/clip/clip.datasource.dart';
import 'package:broody_video/video_compress.dart';
import 'package:flutter/foundation.dart';
import 'package:loading_value/loading_value.dart';

class VideoCompressClipDatasource extends IClipDatasource {
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

    StreamController<LoadingValue<File?>> _progress$ = StreamController();
    final subscription = VideoCompress.compressProgress$.subscribe((event) {
      _progress$.add(LoadingValue.loading(event / 100));
    }, onError: (e) {
      debugPrint(e);
    });

    final future = VideoCompress.compressVideo(
      videoSource.path,
      includeAudio: true,
      startTime: startPoint.inMilliseconds / 1000,
      duration: duration.inMilliseconds / 1000,
      quality: VideoQuality.Res1920x1080Quality,
    );

    future.then((_) => _progress$.close());

    await for (final p in _progress$.stream) {
      debugPrint(p.toString());
      yield p;
    }
    subscription.unsubscribe();
    try {
      final info = await future;
      yield LoadingValue.data(info?.file);
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
