// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compilation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateCompilation _$$CreateCompilationFromJson(Map<String, dynamic> json) =>
    _$CreateCompilation(
      uid: json['uid'] as String,
      projectUid: json['projectUid'] as String,
      projectTitle: json['projectTitle'] as String,
      month: json['month'] as int?,
      destination: json['destination'] as String,
      usedEntries: (json['usedEntries'] as List<dynamic>)
          .map((e) => SavedEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      projectPath: json['projectPath'] as String,
      created: DateTime.parse(json['created'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CreateCompilationToJson(_$CreateCompilation instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'projectUid': instance.projectUid,
      'projectTitle': instance.projectTitle,
      'month': instance.month,
      'destination': instance.destination,
      'usedEntries': instance.usedEntries.map((e) => e.toJson()).toList(),
      'width': instance.width,
      'height': instance.height,
      'projectPath': instance.projectPath,
      'created': instance.created.toIso8601String(),
      'runtimeType': instance.$type,
    };

_$SavedCompilation _$$SavedCompilationFromJson(Map<String, dynamic> json) =>
    _$SavedCompilation(
      uid: json['uid'] as String,
      filename: json['filename'] as String,
      projectUid: json['projectUid'] as String,
      month: json['month'] as int?,
      usedEntries: (json['usedEntries'] as List<dynamic>)
          .map((e) => SavedEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      algorithmVersion:
          json['algorithmVersion'] as int? ?? compilationAlgorithmVersion,
      created: DateTime.parse(json['created'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SavedCompilationToJson(_$SavedCompilation instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'filename': instance.filename,
      'projectUid': instance.projectUid,
      'month': instance.month,
      'usedEntries': instance.usedEntries.map((e) => e.toJson()).toList(),
      'width': instance.width,
      'height': instance.height,
      'algorithmVersion': instance.algorithmVersion,
      'created': instance.created.toIso8601String(),
      'runtimeType': instance.$type,
    };
