import 'dart:async';
import 'dart:io';

import 'package:broody/service/datasources/clip/broody_clip.datasource.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:process_value/process_value.dart';

abstract class ClipDatasource {
  int get algorithmVersion;

  String get fileFormat;

  Stream<ProcessValue<File?>> createClip({
    required Duration startPoint,
    required Duration duration,
    required File videoSource,
    required File videoDestination,
    required Size resolution,
    bool highQuality = false,
    Size? centerCropping,
    bool overwrite = false,
  });

  Future<bool> deleteClip({required File file});

  Future<File?> loadClip({required File file});
}

final clipDatasourceProvider = Provider<ClipDatasource>(
  (ref) => BroodyClipDatasource(),
);
