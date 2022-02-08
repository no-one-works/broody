// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'thumbnail_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ThumbnailRequestTearOff {
  const _$ThumbnailRequestTearOff();

  _ThumbnailRequest call(
      {required String videoPath,
      required Duration videoDuration,
      required int thumbnailHeight,
      required double aspectRatio,
      required int thumbnailCount,
      required int quality}) {
    return _ThumbnailRequest(
      videoPath: videoPath,
      videoDuration: videoDuration,
      thumbnailHeight: thumbnailHeight,
      aspectRatio: aspectRatio,
      thumbnailCount: thumbnailCount,
      quality: quality,
    );
  }
}

/// @nodoc
const $ThumbnailRequest = _$ThumbnailRequestTearOff();

/// @nodoc
mixin _$ThumbnailRequest {
  String get videoPath => throw _privateConstructorUsedError;
  Duration get videoDuration => throw _privateConstructorUsedError;
  int get thumbnailHeight => throw _privateConstructorUsedError;
  double get aspectRatio => throw _privateConstructorUsedError;
  int get thumbnailCount => throw _privateConstructorUsedError;
  int get quality => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThumbnailRequestCopyWith<ThumbnailRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThumbnailRequestCopyWith<$Res> {
  factory $ThumbnailRequestCopyWith(
          ThumbnailRequest value, $Res Function(ThumbnailRequest) then) =
      _$ThumbnailRequestCopyWithImpl<$Res>;
  $Res call(
      {String videoPath,
      Duration videoDuration,
      int thumbnailHeight,
      double aspectRatio,
      int thumbnailCount,
      int quality});
}

/// @nodoc
class _$ThumbnailRequestCopyWithImpl<$Res>
    implements $ThumbnailRequestCopyWith<$Res> {
  _$ThumbnailRequestCopyWithImpl(this._value, this._then);

  final ThumbnailRequest _value;
  // ignore: unused_field
  final $Res Function(ThumbnailRequest) _then;

  @override
  $Res call({
    Object? videoPath = freezed,
    Object? videoDuration = freezed,
    Object? thumbnailHeight = freezed,
    Object? aspectRatio = freezed,
    Object? thumbnailCount = freezed,
    Object? quality = freezed,
  }) {
    return _then(_value.copyWith(
      videoPath: videoPath == freezed
          ? _value.videoPath
          : videoPath // ignore: cast_nullable_to_non_nullable
              as String,
      videoDuration: videoDuration == freezed
          ? _value.videoDuration
          : videoDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      thumbnailHeight: thumbnailHeight == freezed
          ? _value.thumbnailHeight
          : thumbnailHeight // ignore: cast_nullable_to_non_nullable
              as int,
      aspectRatio: aspectRatio == freezed
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double,
      thumbnailCount: thumbnailCount == freezed
          ? _value.thumbnailCount
          : thumbnailCount // ignore: cast_nullable_to_non_nullable
              as int,
      quality: quality == freezed
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ThumbnailRequestCopyWith<$Res>
    implements $ThumbnailRequestCopyWith<$Res> {
  factory _$ThumbnailRequestCopyWith(
          _ThumbnailRequest value, $Res Function(_ThumbnailRequest) then) =
      __$ThumbnailRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {String videoPath,
      Duration videoDuration,
      int thumbnailHeight,
      double aspectRatio,
      int thumbnailCount,
      int quality});
}

/// @nodoc
class __$ThumbnailRequestCopyWithImpl<$Res>
    extends _$ThumbnailRequestCopyWithImpl<$Res>
    implements _$ThumbnailRequestCopyWith<$Res> {
  __$ThumbnailRequestCopyWithImpl(
      _ThumbnailRequest _value, $Res Function(_ThumbnailRequest) _then)
      : super(_value, (v) => _then(v as _ThumbnailRequest));

  @override
  _ThumbnailRequest get _value => super._value as _ThumbnailRequest;

  @override
  $Res call({
    Object? videoPath = freezed,
    Object? videoDuration = freezed,
    Object? thumbnailHeight = freezed,
    Object? aspectRatio = freezed,
    Object? thumbnailCount = freezed,
    Object? quality = freezed,
  }) {
    return _then(_ThumbnailRequest(
      videoPath: videoPath == freezed
          ? _value.videoPath
          : videoPath // ignore: cast_nullable_to_non_nullable
              as String,
      videoDuration: videoDuration == freezed
          ? _value.videoDuration
          : videoDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      thumbnailHeight: thumbnailHeight == freezed
          ? _value.thumbnailHeight
          : thumbnailHeight // ignore: cast_nullable_to_non_nullable
              as int,
      aspectRatio: aspectRatio == freezed
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double,
      thumbnailCount: thumbnailCount == freezed
          ? _value.thumbnailCount
          : thumbnailCount // ignore: cast_nullable_to_non_nullable
              as int,
      quality: quality == freezed
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ThumbnailRequest implements _ThumbnailRequest {
  const _$_ThumbnailRequest(
      {required this.videoPath,
      required this.videoDuration,
      required this.thumbnailHeight,
      required this.aspectRatio,
      required this.thumbnailCount,
      required this.quality});

  @override
  final String videoPath;
  @override
  final Duration videoDuration;
  @override
  final int thumbnailHeight;
  @override
  final double aspectRatio;
  @override
  final int thumbnailCount;
  @override
  final int quality;

  @override
  String toString() {
    return 'ThumbnailRequest(videoPath: $videoPath, videoDuration: $videoDuration, thumbnailHeight: $thumbnailHeight, aspectRatio: $aspectRatio, thumbnailCount: $thumbnailCount, quality: $quality)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ThumbnailRequest &&
            const DeepCollectionEquality().equals(other.videoPath, videoPath) &&
            const DeepCollectionEquality()
                .equals(other.videoDuration, videoDuration) &&
            const DeepCollectionEquality()
                .equals(other.thumbnailHeight, thumbnailHeight) &&
            const DeepCollectionEquality()
                .equals(other.aspectRatio, aspectRatio) &&
            const DeepCollectionEquality()
                .equals(other.thumbnailCount, thumbnailCount) &&
            const DeepCollectionEquality().equals(other.quality, quality));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(videoPath),
      const DeepCollectionEquality().hash(videoDuration),
      const DeepCollectionEquality().hash(thumbnailHeight),
      const DeepCollectionEquality().hash(aspectRatio),
      const DeepCollectionEquality().hash(thumbnailCount),
      const DeepCollectionEquality().hash(quality));

  @JsonKey(ignore: true)
  @override
  _$ThumbnailRequestCopyWith<_ThumbnailRequest> get copyWith =>
      __$ThumbnailRequestCopyWithImpl<_ThumbnailRequest>(this, _$identity);
}

abstract class _ThumbnailRequest implements ThumbnailRequest {
  const factory _ThumbnailRequest(
      {required String videoPath,
      required Duration videoDuration,
      required int thumbnailHeight,
      required double aspectRatio,
      required int thumbnailCount,
      required int quality}) = _$_ThumbnailRequest;

  @override
  String get videoPath;
  @override
  Duration get videoDuration;
  @override
  int get thumbnailHeight;
  @override
  double get aspectRatio;
  @override
  int get thumbnailCount;
  @override
  int get quality;
  @override
  @JsonKey(ignore: true)
  _$ThumbnailRequestCopyWith<_ThumbnailRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
