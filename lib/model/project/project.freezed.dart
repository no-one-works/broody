// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return _Project.fromJson(json);
}

/// @nodoc
class _$ProjectTearOff {
  const _$ProjectTearOff();

  _Project call(
      {required String uid,
      String title = "",
      required DateTime startDate,
      required DateTime endDate,
      required Duration entryDuration,
      required String? thumbnailPath,
      required DateTime? notificationTime,
      @SizeConverter() Size landScapeResolution = resolution1080Landscape,
      bool portrait = true,
      int? color,
      dynamic isHardcoreMode = false,
      List<String> compilationAssetIds = const [],
      String? exportedPath}) {
    return _Project(
      uid: uid,
      title: title,
      startDate: startDate,
      endDate: endDate,
      entryDuration: entryDuration,
      thumbnailPath: thumbnailPath,
      notificationTime: notificationTime,
      landScapeResolution: landScapeResolution,
      portrait: portrait,
      color: color,
      isHardcoreMode: isHardcoreMode,
      compilationAssetIds: compilationAssetIds,
      exportedPath: exportedPath,
    );
  }

  Project fromJson(Map<String, Object?> json) {
    return Project.fromJson(json);
  }
}

/// @nodoc
const $Project = _$ProjectTearOff();

/// @nodoc
mixin _$Project {
  String get uid => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  Duration get entryDuration => throw _privateConstructorUsedError;
  String? get thumbnailPath => throw _privateConstructorUsedError;
  DateTime? get notificationTime => throw _privateConstructorUsedError;
  @SizeConverter()
  Size get landScapeResolution => throw _privateConstructorUsedError;
  bool get portrait => throw _privateConstructorUsedError;
  int? get color => throw _privateConstructorUsedError;
  dynamic get isHardcoreMode => throw _privateConstructorUsedError;
  List<String> get compilationAssetIds => throw _privateConstructorUsedError;
  String? get exportedPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String title,
      DateTime startDate,
      DateTime endDate,
      Duration entryDuration,
      String? thumbnailPath,
      DateTime? notificationTime,
      @SizeConverter() Size landScapeResolution,
      bool portrait,
      int? color,
      dynamic isHardcoreMode,
      List<String> compilationAssetIds,
      String? exportedPath});
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res> implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  final Project _value;
  // ignore: unused_field
  final $Res Function(Project) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? title = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? entryDuration = freezed,
    Object? thumbnailPath = freezed,
    Object? notificationTime = freezed,
    Object? landScapeResolution = freezed,
    Object? portrait = freezed,
    Object? color = freezed,
    Object? isHardcoreMode = freezed,
    Object? compilationAssetIds = freezed,
    Object? exportedPath = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      entryDuration: entryDuration == freezed
          ? _value.entryDuration
          : entryDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      thumbnailPath: thumbnailPath == freezed
          ? _value.thumbnailPath
          : thumbnailPath // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationTime: notificationTime == freezed
          ? _value.notificationTime
          : notificationTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      landScapeResolution: landScapeResolution == freezed
          ? _value.landScapeResolution
          : landScapeResolution // ignore: cast_nullable_to_non_nullable
              as Size,
      portrait: portrait == freezed
          ? _value.portrait
          : portrait // ignore: cast_nullable_to_non_nullable
              as bool,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
      isHardcoreMode: isHardcoreMode == freezed
          ? _value.isHardcoreMode
          : isHardcoreMode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      compilationAssetIds: compilationAssetIds == freezed
          ? _value.compilationAssetIds
          : compilationAssetIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      exportedPath: exportedPath == freezed
          ? _value.exportedPath
          : exportedPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$ProjectCopyWith(_Project value, $Res Function(_Project) then) =
      __$ProjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String title,
      DateTime startDate,
      DateTime endDate,
      Duration entryDuration,
      String? thumbnailPath,
      DateTime? notificationTime,
      @SizeConverter() Size landScapeResolution,
      bool portrait,
      int? color,
      dynamic isHardcoreMode,
      List<String> compilationAssetIds,
      String? exportedPath});
}

/// @nodoc
class __$ProjectCopyWithImpl<$Res> extends _$ProjectCopyWithImpl<$Res>
    implements _$ProjectCopyWith<$Res> {
  __$ProjectCopyWithImpl(_Project _value, $Res Function(_Project) _then)
      : super(_value, (v) => _then(v as _Project));

  @override
  _Project get _value => super._value as _Project;

  @override
  $Res call({
    Object? uid = freezed,
    Object? title = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? entryDuration = freezed,
    Object? thumbnailPath = freezed,
    Object? notificationTime = freezed,
    Object? landScapeResolution = freezed,
    Object? portrait = freezed,
    Object? color = freezed,
    Object? isHardcoreMode = freezed,
    Object? compilationAssetIds = freezed,
    Object? exportedPath = freezed,
  }) {
    return _then(_Project(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      entryDuration: entryDuration == freezed
          ? _value.entryDuration
          : entryDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      thumbnailPath: thumbnailPath == freezed
          ? _value.thumbnailPath
          : thumbnailPath // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationTime: notificationTime == freezed
          ? _value.notificationTime
          : notificationTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      landScapeResolution: landScapeResolution == freezed
          ? _value.landScapeResolution
          : landScapeResolution // ignore: cast_nullable_to_non_nullable
              as Size,
      portrait: portrait == freezed
          ? _value.portrait
          : portrait // ignore: cast_nullable_to_non_nullable
              as bool,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
      isHardcoreMode:
          isHardcoreMode == freezed ? _value.isHardcoreMode : isHardcoreMode,
      compilationAssetIds: compilationAssetIds == freezed
          ? _value.compilationAssetIds
          : compilationAssetIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      exportedPath: exportedPath == freezed
          ? _value.exportedPath
          : exportedPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Project extends _Project {
  _$_Project(
      {required this.uid,
      this.title = "",
      required this.startDate,
      required this.endDate,
      required this.entryDuration,
      required this.thumbnailPath,
      required this.notificationTime,
      @SizeConverter() this.landScapeResolution = resolution1080Landscape,
      this.portrait = true,
      this.color,
      this.isHardcoreMode = false,
      this.compilationAssetIds = const [],
      this.exportedPath})
      : super._();

  factory _$_Project.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectFromJson(json);

  @override
  final String uid;
  @JsonKey()
  @override
  final String title;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final Duration entryDuration;
  @override
  final String? thumbnailPath;
  @override
  final DateTime? notificationTime;
  @JsonKey()
  @override
  @SizeConverter()
  final Size landScapeResolution;
  @JsonKey()
  @override
  final bool portrait;
  @override
  final int? color;
  @JsonKey()
  @override
  final dynamic isHardcoreMode;
  @JsonKey()
  @override
  final List<String> compilationAssetIds;
  @override
  final String? exportedPath;

  @override
  String toString() {
    return 'Project(uid: $uid, title: $title, startDate: $startDate, endDate: $endDate, entryDuration: $entryDuration, thumbnailPath: $thumbnailPath, notificationTime: $notificationTime, landScapeResolution: $landScapeResolution, portrait: $portrait, color: $color, isHardcoreMode: $isHardcoreMode, compilationAssetIds: $compilationAssetIds, exportedPath: $exportedPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Project &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.startDate, startDate) &&
            const DeepCollectionEquality().equals(other.endDate, endDate) &&
            const DeepCollectionEquality()
                .equals(other.entryDuration, entryDuration) &&
            const DeepCollectionEquality()
                .equals(other.thumbnailPath, thumbnailPath) &&
            const DeepCollectionEquality()
                .equals(other.notificationTime, notificationTime) &&
            const DeepCollectionEquality()
                .equals(other.landScapeResolution, landScapeResolution) &&
            const DeepCollectionEquality().equals(other.portrait, portrait) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality()
                .equals(other.isHardcoreMode, isHardcoreMode) &&
            const DeepCollectionEquality()
                .equals(other.compilationAssetIds, compilationAssetIds) &&
            const DeepCollectionEquality()
                .equals(other.exportedPath, exportedPath));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(startDate),
      const DeepCollectionEquality().hash(endDate),
      const DeepCollectionEquality().hash(entryDuration),
      const DeepCollectionEquality().hash(thumbnailPath),
      const DeepCollectionEquality().hash(notificationTime),
      const DeepCollectionEquality().hash(landScapeResolution),
      const DeepCollectionEquality().hash(portrait),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(isHardcoreMode),
      const DeepCollectionEquality().hash(compilationAssetIds),
      const DeepCollectionEquality().hash(exportedPath));

  @JsonKey(ignore: true)
  @override
  _$ProjectCopyWith<_Project> get copyWith =>
      __$ProjectCopyWithImpl<_Project>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectToJson(this);
  }
}

abstract class _Project extends Project {
  factory _Project(
      {required String uid,
      String title,
      required DateTime startDate,
      required DateTime endDate,
      required Duration entryDuration,
      required String? thumbnailPath,
      required DateTime? notificationTime,
      @SizeConverter() Size landScapeResolution,
      bool portrait,
      int? color,
      dynamic isHardcoreMode,
      List<String> compilationAssetIds,
      String? exportedPath}) = _$_Project;
  _Project._() : super._();

  factory _Project.fromJson(Map<String, dynamic> json) = _$_Project.fromJson;

  @override
  String get uid;
  @override
  String get title;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  Duration get entryDuration;
  @override
  String? get thumbnailPath;
  @override
  DateTime? get notificationTime;
  @override
  @SizeConverter()
  Size get landScapeResolution;
  @override
  bool get portrait;
  @override
  int? get color;
  @override
  dynamic get isHardcoreMode;
  @override
  List<String> get compilationAssetIds;
  @override
  String? get exportedPath;
  @override
  @JsonKey(ignore: true)
  _$ProjectCopyWith<_Project> get copyWith =>
      throw _privateConstructorUsedError;
}
