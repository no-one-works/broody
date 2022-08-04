// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditingEntry _$$EditingEntryFromJson(Map<String, dynamic> json) =>
    _$EditingEntry(
      timestamp: DateTime.parse(json['timestamp'] as String),
      projectId: json['projectId'] as String,
      assetEntityId: json['assetEntityId'] as String,
      videoPath: json['videoPath'] as String,
      startPoint: Duration(microseconds: json['startPoint'] as int),
      duration: Duration(microseconds: json['duration'] as int),
      width: json['width'] as int,
      height: json['height'] as int,
      thumbnailBytes: (json['thumbnailBytes'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EditingEntryToJson(_$EditingEntry instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'projectId': instance.projectId,
      'assetEntityId': instance.assetEntityId,
      'videoPath': instance.videoPath,
      'startPoint': instance.startPoint.inMicroseconds,
      'duration': instance.duration.inMicroseconds,
      'width': instance.width,
      'height': instance.height,
      'thumbnailBytes': instance.thumbnailBytes,
      'runtimeType': instance.$type,
    };

_$SavedEntry _$$SavedEntryFromJson(Map<String, dynamic> json) => _$SavedEntry(
      exportVersion: json['exportVersion'] as int,
      timestamp: DateTime.parse(json['timestamp'] as String),
      changedWhen: DateTime.parse(json['changedWhen'] as String),
      projectId: json['projectId'] as String,
      assetEntityId: json['assetEntityId'] as String,
      clipFileName: json['clipFileName'] as String,
      blurHash: json['blurHash'] as String,
      color: json['color'] as int?,
      startPoint: Duration(microseconds: json['startPoint'] as int),
      duration: Duration(microseconds: json['duration'] as int),
      width: json['width'] as int,
      height: json['height'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SavedEntryToJson(_$SavedEntry instance) =>
    <String, dynamic>{
      'exportVersion': instance.exportVersion,
      'timestamp': instance.timestamp.toIso8601String(),
      'changedWhen': instance.changedWhen.toIso8601String(),
      'projectId': instance.projectId,
      'assetEntityId': instance.assetEntityId,
      'clipFileName': instance.clipFileName,
      'blurHash': instance.blurHash,
      'color': instance.color,
      'startPoint': instance.startPoint.inMicroseconds,
      'duration': instance.duration.inMicroseconds,
      'width': instance.width,
      'height': instance.height,
      'runtimeType': instance.$type,
    };
