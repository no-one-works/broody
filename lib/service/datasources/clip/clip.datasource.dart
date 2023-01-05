import 'dart:async';
import 'dart:io';

import 'package:broody/service/datasources/clip/broody_clip.datasource.dart';
import 'package:broody/service/datasources/clip/ffmpeg_clip.datasource.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_value/loading_value.dart';

abstract class ClipDatasource {
  int get algorithmVersion;

  String get fileFormat;

  Stream<LoadingValue<File?>> createClip({
    required Duration startPoint,
    required Duration duration,
    required File videoSource,
    required Size resolution,
    bool highQuality = false,
    Size? centerCropping,
  });

  Future<bool> deleteClip({required File file});

  Future<File?> loadClip({required File file});
}

final clipDatasourceProvider = Provider<ClipDatasource>(
  (ref) => Platform.isAndroid ? FFmpegClipDatasource() : BroodyClipDatasource(),
);
