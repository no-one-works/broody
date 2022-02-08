import 'package:broody/core/constants/video_resolutions.dart';
import 'package:broody/core/converters/size_converter.dart';
import 'package:broody/core/extensions/date_time.x.dart';
import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  Project._();

  factory Project({
    required String uid,
    @Default("") String title,
    required DateTime startDate,
    required DateTime endDate,
    required Duration entryDuration,
    required String? thumbnailPath,
    required DateTime? notificationTime,
    @SizeConverter() @Default(resolution1080Landscape) Size landScapeResolution,
    @Default(true) bool portrait,
    int? color,
    @Default(false) isHardcoreMode,
    @Default([]) List<String> compilationAssetIds,
    String? exportedPath,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  bool get valid => title.isNotEmpty;

  int get numberOfClips => startDate.daysUntil(endDate, inclusive: true);

  Duration get totalDuration => Duration(
        milliseconds: numberOfClips * entryDuration.inMilliseconds,
      );

  Size get resolution => portrait
      ? Size(landScapeResolution.height, landScapeResolution.width)
      : landScapeResolution;
}
