// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Project _$$_ProjectFromJson(Map<String, dynamic> json) => _$_Project(
      uid: json['uid'] as String,
      title: json['title'] as String? ?? "",
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      entryDuration: Duration(microseconds: json['entryDuration'] as int),
      thumbnailPath: json['thumbnailPath'] as String?,
      notificationTime: json['notificationTime'] == null
          ? null
          : DateTime.parse(json['notificationTime'] as String),
      landScapeResolution: json['landScapeResolution'] == null
          ? resolution1080Landscape
          : const SizeConverter()
              .fromJson(json['landScapeResolution'] as String),
      portrait: json['portrait'] as bool? ?? true,
      color: json['color'] as int?,
      isHardcoreMode: json['isHardcoreMode'] ?? false,
      compilationAssetIds: (json['compilationAssetIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      exportedPath: json['exportedPath'] as String?,
    );

Map<String, dynamic> _$$_ProjectToJson(_$_Project instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'title': instance.title,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'entryDuration': instance.entryDuration.inMicroseconds,
      'thumbnailPath': instance.thumbnailPath,
      'notificationTime': instance.notificationTime?.toIso8601String(),
      'landScapeResolution':
          const SizeConverter().toJson(instance.landScapeResolution),
      'portrait': instance.portrait,
      'color': instance.color,
      'isHardcoreMode': instance.isHardcoreMode,
      'compilationAssetIds': instance.compilationAssetIds,
      'exportedPath': instance.exportedPath,
    };
