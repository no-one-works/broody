// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Entry _$EntryFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'editing':
      return EditingEntry.fromJson(json);
    case 'saved':
      return SavedEntry.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Entry',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$EntryTearOff {
  const _$EntryTearOff();

  EditingEntry editing(
      {required DateTime timestamp,
      required String projectId,
      required String assetEntityId,
      required String videoPath,
      required Duration startPoint,
      required Duration duration,
      required int width,
      required int height,
      List<int>? thumbnailBytes}) {
    return EditingEntry(
      timestamp: timestamp,
      projectId: projectId,
      assetEntityId: assetEntityId,
      videoPath: videoPath,
      startPoint: startPoint,
      duration: duration,
      width: width,
      height: height,
      thumbnailBytes: thumbnailBytes,
    );
  }

  SavedEntry saved(
      {int exportVersion = entryAlgorithmVersion,
      required DateTime timestamp,
      required DateTime changedWhen,
      required String projectId,
      required String assetEntityId,
      required String clipFileName,
      required String blurHash,
      int? color,
      required Duration startPoint,
      required Duration duration,
      required int width,
      required int height}) {
    return SavedEntry(
      exportVersion: exportVersion,
      timestamp: timestamp,
      changedWhen: changedWhen,
      projectId: projectId,
      assetEntityId: assetEntityId,
      clipFileName: clipFileName,
      blurHash: blurHash,
      color: color,
      startPoint: startPoint,
      duration: duration,
      width: width,
      height: height,
    );
  }

  Entry fromJson(Map<String, Object?> json) {
    return Entry.fromJson(json);
  }
}

/// @nodoc
const $Entry = _$EntryTearOff();

/// @nodoc
mixin _$Entry {
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get assetEntityId => throw _privateConstructorUsedError;
  Duration get startPoint => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime timestamp,
            String projectId,
            String assetEntityId,
            String videoPath,
            Duration startPoint,
            Duration duration,
            int width,
            int height,
            List<int>? thumbnailBytes)
        editing,
    required TResult Function(
            int exportVersion,
            DateTime timestamp,
            DateTime changedWhen,
            String projectId,
            String assetEntityId,
            String clipFileName,
            String blurHash,
            int? color,
            Duration startPoint,
            Duration duration,
            int width,
            int height)
        saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            DateTime timestamp,
            String projectId,
            String assetEntityId,
            String videoPath,
            Duration startPoint,
            Duration duration,
            int width,
            int height,
            List<int>? thumbnailBytes)?
        editing,
    TResult Function(
            int exportVersion,
            DateTime timestamp,
            DateTime changedWhen,
            String projectId,
            String assetEntityId,
            String clipFileName,
            String blurHash,
            int? color,
            Duration startPoint,
            Duration duration,
            int width,
            int height)?
        saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DateTime timestamp,
            String projectId,
            String assetEntityId,
            String videoPath,
            Duration startPoint,
            Duration duration,
            int width,
            int height,
            List<int>? thumbnailBytes)?
        editing,
    TResult Function(
            int exportVersion,
            DateTime timestamp,
            DateTime changedWhen,
            String projectId,
            String assetEntityId,
            String clipFileName,
            String blurHash,
            int? color,
            Duration startPoint,
            Duration duration,
            int width,
            int height)?
        saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditingEntry value) editing,
    required TResult Function(SavedEntry value) saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EditingEntry value)? editing,
    TResult Function(SavedEntry value)? saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditingEntry value)? editing,
    TResult Function(SavedEntry value)? saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntryCopyWith<Entry> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntryCopyWith<$Res> {
  factory $EntryCopyWith(Entry value, $Res Function(Entry) then) =
      _$EntryCopyWithImpl<$Res>;
  $Res call(
      {DateTime timestamp,
      String projectId,
      String assetEntityId,
      Duration startPoint,
      Duration duration,
      int width,
      int height});
}

/// @nodoc
class _$EntryCopyWithImpl<$Res> implements $EntryCopyWith<$Res> {
  _$EntryCopyWithImpl(this._value, this._then);

  final Entry _value;
  // ignore: unused_field
  final $Res Function(Entry) _then;

  @override
  $Res call({
    Object? timestamp = freezed,
    Object? projectId = freezed,
    Object? assetEntityId = freezed,
    Object? startPoint = freezed,
    Object? duration = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_value.copyWith(
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      assetEntityId: assetEntityId == freezed
          ? _value.assetEntityId
          : assetEntityId // ignore: cast_nullable_to_non_nullable
              as String,
      startPoint: startPoint == freezed
          ? _value.startPoint
          : startPoint // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class $EditingEntryCopyWith<$Res> implements $EntryCopyWith<$Res> {
  factory $EditingEntryCopyWith(
          EditingEntry value, $Res Function(EditingEntry) then) =
      _$EditingEntryCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime timestamp,
      String projectId,
      String assetEntityId,
      String videoPath,
      Duration startPoint,
      Duration duration,
      int width,
      int height,
      List<int>? thumbnailBytes});
}

/// @nodoc
class _$EditingEntryCopyWithImpl<$Res> extends _$EntryCopyWithImpl<$Res>
    implements $EditingEntryCopyWith<$Res> {
  _$EditingEntryCopyWithImpl(
      EditingEntry _value, $Res Function(EditingEntry) _then)
      : super(_value, (v) => _then(v as EditingEntry));

  @override
  EditingEntry get _value => super._value as EditingEntry;

  @override
  $Res call({
    Object? timestamp = freezed,
    Object? projectId = freezed,
    Object? assetEntityId = freezed,
    Object? videoPath = freezed,
    Object? startPoint = freezed,
    Object? duration = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? thumbnailBytes = freezed,
  }) {
    return _then(EditingEntry(
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      assetEntityId: assetEntityId == freezed
          ? _value.assetEntityId
          : assetEntityId // ignore: cast_nullable_to_non_nullable
              as String,
      videoPath: videoPath == freezed
          ? _value.videoPath
          : videoPath // ignore: cast_nullable_to_non_nullable
              as String,
      startPoint: startPoint == freezed
          ? _value.startPoint
          : startPoint // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      thumbnailBytes: thumbnailBytes == freezed
          ? _value.thumbnailBytes
          : thumbnailBytes // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EditingEntry extends EditingEntry {
  _$EditingEntry(
      {required this.timestamp,
      required this.projectId,
      required this.assetEntityId,
      required this.videoPath,
      required this.startPoint,
      required this.duration,
      required this.width,
      required this.height,
      this.thumbnailBytes,
      String? $type})
      : $type = $type ?? 'editing',
        super._();

  factory _$EditingEntry.fromJson(Map<String, dynamic> json) =>
      _$$EditingEntryFromJson(json);

  @override
  final DateTime timestamp;
  @override
  final String projectId;
  @override
  final String assetEntityId;
  @override
  final String videoPath;
  @override
  final Duration startPoint;
  @override
  final Duration duration;
  @override
  final int width;
  @override
  final int height;
  @override
  final List<int>? thumbnailBytes;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Entry.editing(timestamp: $timestamp, projectId: $projectId, assetEntityId: $assetEntityId, videoPath: $videoPath, startPoint: $startPoint, duration: $duration, width: $width, height: $height, thumbnailBytes: $thumbnailBytes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EditingEntry &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality().equals(other.projectId, projectId) &&
            const DeepCollectionEquality()
                .equals(other.assetEntityId, assetEntityId) &&
            const DeepCollectionEquality().equals(other.videoPath, videoPath) &&
            const DeepCollectionEquality()
                .equals(other.startPoint, startPoint) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.width, width) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality()
                .equals(other.thumbnailBytes, thumbnailBytes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(projectId),
      const DeepCollectionEquality().hash(assetEntityId),
      const DeepCollectionEquality().hash(videoPath),
      const DeepCollectionEquality().hash(startPoint),
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(width),
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(thumbnailBytes));

  @JsonKey(ignore: true)
  @override
  $EditingEntryCopyWith<EditingEntry> get copyWith =>
      _$EditingEntryCopyWithImpl<EditingEntry>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime timestamp,
            String projectId,
            String assetEntityId,
            String videoPath,
            Duration startPoint,
            Duration duration,
            int width,
            int height,
            List<int>? thumbnailBytes)
        editing,
    required TResult Function(
            int exportVersion,
            DateTime timestamp,
            DateTime changedWhen,
            String projectId,
            String assetEntityId,
            String clipFileName,
            String blurHash,
            int? color,
            Duration startPoint,
            Duration duration,
            int width,
            int height)
        saved,
  }) {
    return editing(timestamp, projectId, assetEntityId, videoPath, startPoint,
        duration, width, height, thumbnailBytes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            DateTime timestamp,
            String projectId,
            String assetEntityId,
            String videoPath,
            Duration startPoint,
            Duration duration,
            int width,
            int height,
            List<int>? thumbnailBytes)?
        editing,
    TResult Function(
            int exportVersion,
            DateTime timestamp,
            DateTime changedWhen,
            String projectId,
            String assetEntityId,
            String clipFileName,
            String blurHash,
            int? color,
            Duration startPoint,
            Duration duration,
            int width,
            int height)?
        saved,
  }) {
    return editing?.call(timestamp, projectId, assetEntityId, videoPath,
        startPoint, duration, width, height, thumbnailBytes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DateTime timestamp,
            String projectId,
            String assetEntityId,
            String videoPath,
            Duration startPoint,
            Duration duration,
            int width,
            int height,
            List<int>? thumbnailBytes)?
        editing,
    TResult Function(
            int exportVersion,
            DateTime timestamp,
            DateTime changedWhen,
            String projectId,
            String assetEntityId,
            String clipFileName,
            String blurHash,
            int? color,
            Duration startPoint,
            Duration duration,
            int width,
            int height)?
        saved,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(timestamp, projectId, assetEntityId, videoPath, startPoint,
          duration, width, height, thumbnailBytes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditingEntry value) editing,
    required TResult Function(SavedEntry value) saved,
  }) {
    return editing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EditingEntry value)? editing,
    TResult Function(SavedEntry value)? saved,
  }) {
    return editing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditingEntry value)? editing,
    TResult Function(SavedEntry value)? saved,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EditingEntryToJson(this);
  }
}

abstract class EditingEntry extends Entry {
  factory EditingEntry(
      {required DateTime timestamp,
      required String projectId,
      required String assetEntityId,
      required String videoPath,
      required Duration startPoint,
      required Duration duration,
      required int width,
      required int height,
      List<int>? thumbnailBytes}) = _$EditingEntry;
  EditingEntry._() : super._();

  factory EditingEntry.fromJson(Map<String, dynamic> json) =
      _$EditingEntry.fromJson;

  @override
  DateTime get timestamp;
  @override
  String get projectId;
  @override
  String get assetEntityId;
  String get videoPath;
  @override
  Duration get startPoint;
  @override
  Duration get duration;
  @override
  int get width;
  @override
  int get height;
  List<int>? get thumbnailBytes;
  @override
  @JsonKey(ignore: true)
  $EditingEntryCopyWith<EditingEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedEntryCopyWith<$Res> implements $EntryCopyWith<$Res> {
  factory $SavedEntryCopyWith(
          SavedEntry value, $Res Function(SavedEntry) then) =
      _$SavedEntryCopyWithImpl<$Res>;
  @override
  $Res call(
      {int exportVersion,
      DateTime timestamp,
      DateTime changedWhen,
      String projectId,
      String assetEntityId,
      String clipFileName,
      String blurHash,
      int? color,
      Duration startPoint,
      Duration duration,
      int width,
      int height});
}

/// @nodoc
class _$SavedEntryCopyWithImpl<$Res> extends _$EntryCopyWithImpl<$Res>
    implements $SavedEntryCopyWith<$Res> {
  _$SavedEntryCopyWithImpl(SavedEntry _value, $Res Function(SavedEntry) _then)
      : super(_value, (v) => _then(v as SavedEntry));

  @override
  SavedEntry get _value => super._value as SavedEntry;

  @override
  $Res call({
    Object? exportVersion = freezed,
    Object? timestamp = freezed,
    Object? changedWhen = freezed,
    Object? projectId = freezed,
    Object? assetEntityId = freezed,
    Object? clipFileName = freezed,
    Object? blurHash = freezed,
    Object? color = freezed,
    Object? startPoint = freezed,
    Object? duration = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(SavedEntry(
      exportVersion: exportVersion == freezed
          ? _value.exportVersion
          : exportVersion // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      changedWhen: changedWhen == freezed
          ? _value.changedWhen
          : changedWhen // ignore: cast_nullable_to_non_nullable
              as DateTime,
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      assetEntityId: assetEntityId == freezed
          ? _value.assetEntityId
          : assetEntityId // ignore: cast_nullable_to_non_nullable
              as String,
      clipFileName: clipFileName == freezed
          ? _value.clipFileName
          : clipFileName // ignore: cast_nullable_to_non_nullable
              as String,
      blurHash: blurHash == freezed
          ? _value.blurHash
          : blurHash // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
      startPoint: startPoint == freezed
          ? _value.startPoint
          : startPoint // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SavedEntry extends SavedEntry {
  _$SavedEntry(
      {this.exportVersion = entryAlgorithmVersion,
      required this.timestamp,
      required this.changedWhen,
      required this.projectId,
      required this.assetEntityId,
      required this.clipFileName,
      required this.blurHash,
      this.color,
      required this.startPoint,
      required this.duration,
      required this.width,
      required this.height,
      String? $type})
      : $type = $type ?? 'saved',
        super._();

  factory _$SavedEntry.fromJson(Map<String, dynamic> json) =>
      _$$SavedEntryFromJson(json);

  @JsonKey()
  @override
  final int exportVersion;
  @override
  final DateTime timestamp;
  @override
  final DateTime changedWhen;
  @override
  final String projectId;
  @override
  final String assetEntityId;
  @override
  final String clipFileName;
  @override
  final String blurHash;
  @override
  final int? color;
  @override
  final Duration startPoint;
  @override
  final Duration duration;
  @override
  final int width;
  @override
  final int height;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Entry.saved(exportVersion: $exportVersion, timestamp: $timestamp, changedWhen: $changedWhen, projectId: $projectId, assetEntityId: $assetEntityId, clipFileName: $clipFileName, blurHash: $blurHash, color: $color, startPoint: $startPoint, duration: $duration, width: $width, height: $height)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavedEntry &&
            const DeepCollectionEquality()
                .equals(other.exportVersion, exportVersion) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality()
                .equals(other.changedWhen, changedWhen) &&
            const DeepCollectionEquality().equals(other.projectId, projectId) &&
            const DeepCollectionEquality()
                .equals(other.assetEntityId, assetEntityId) &&
            const DeepCollectionEquality()
                .equals(other.clipFileName, clipFileName) &&
            const DeepCollectionEquality().equals(other.blurHash, blurHash) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality()
                .equals(other.startPoint, startPoint) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.width, width) &&
            const DeepCollectionEquality().equals(other.height, height));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(exportVersion),
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(changedWhen),
      const DeepCollectionEquality().hash(projectId),
      const DeepCollectionEquality().hash(assetEntityId),
      const DeepCollectionEquality().hash(clipFileName),
      const DeepCollectionEquality().hash(blurHash),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(startPoint),
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(width),
      const DeepCollectionEquality().hash(height));

  @JsonKey(ignore: true)
  @override
  $SavedEntryCopyWith<SavedEntry> get copyWith =>
      _$SavedEntryCopyWithImpl<SavedEntry>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime timestamp,
            String projectId,
            String assetEntityId,
            String videoPath,
            Duration startPoint,
            Duration duration,
            int width,
            int height,
            List<int>? thumbnailBytes)
        editing,
    required TResult Function(
            int exportVersion,
            DateTime timestamp,
            DateTime changedWhen,
            String projectId,
            String assetEntityId,
            String clipFileName,
            String blurHash,
            int? color,
            Duration startPoint,
            Duration duration,
            int width,
            int height)
        saved,
  }) {
    return saved(
        exportVersion,
        timestamp,
        changedWhen,
        projectId,
        assetEntityId,
        clipFileName,
        blurHash,
        color,
        startPoint,
        duration,
        width,
        height);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            DateTime timestamp,
            String projectId,
            String assetEntityId,
            String videoPath,
            Duration startPoint,
            Duration duration,
            int width,
            int height,
            List<int>? thumbnailBytes)?
        editing,
    TResult Function(
            int exportVersion,
            DateTime timestamp,
            DateTime changedWhen,
            String projectId,
            String assetEntityId,
            String clipFileName,
            String blurHash,
            int? color,
            Duration startPoint,
            Duration duration,
            int width,
            int height)?
        saved,
  }) {
    return saved?.call(
        exportVersion,
        timestamp,
        changedWhen,
        projectId,
        assetEntityId,
        clipFileName,
        blurHash,
        color,
        startPoint,
        duration,
        width,
        height);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DateTime timestamp,
            String projectId,
            String assetEntityId,
            String videoPath,
            Duration startPoint,
            Duration duration,
            int width,
            int height,
            List<int>? thumbnailBytes)?
        editing,
    TResult Function(
            int exportVersion,
            DateTime timestamp,
            DateTime changedWhen,
            String projectId,
            String assetEntityId,
            String clipFileName,
            String blurHash,
            int? color,
            Duration startPoint,
            Duration duration,
            int width,
            int height)?
        saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(
          exportVersion,
          timestamp,
          changedWhen,
          projectId,
          assetEntityId,
          clipFileName,
          blurHash,
          color,
          startPoint,
          duration,
          width,
          height);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditingEntry value) editing,
    required TResult Function(SavedEntry value) saved,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EditingEntry value)? editing,
    TResult Function(SavedEntry value)? saved,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditingEntry value)? editing,
    TResult Function(SavedEntry value)? saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedEntryToJson(this);
  }
}

abstract class SavedEntry extends Entry {
  factory SavedEntry(
      {int exportVersion,
      required DateTime timestamp,
      required DateTime changedWhen,
      required String projectId,
      required String assetEntityId,
      required String clipFileName,
      required String blurHash,
      int? color,
      required Duration startPoint,
      required Duration duration,
      required int width,
      required int height}) = _$SavedEntry;
  SavedEntry._() : super._();

  factory SavedEntry.fromJson(Map<String, dynamic> json) =
      _$SavedEntry.fromJson;

  int get exportVersion;
  @override
  DateTime get timestamp;
  DateTime get changedWhen;
  @override
  String get projectId;
  @override
  String get assetEntityId;
  String get clipFileName;
  String get blurHash;
  int? get color;
  @override
  Duration get startPoint;
  @override
  Duration get duration;
  @override
  int get width;
  @override
  int get height;
  @override
  @JsonKey(ignore: true)
  $SavedEntryCopyWith<SavedEntry> get copyWith =>
      throw _privateConstructorUsedError;
}
