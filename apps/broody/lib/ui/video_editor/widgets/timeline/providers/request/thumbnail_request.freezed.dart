// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thumbnail_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$ThumbnailRequestCopyWithImpl<$Res, ThumbnailRequest>;
  @useResult
  $Res call(
      {String videoPath,
      Duration videoDuration,
      int thumbnailHeight,
      double aspectRatio,
      int thumbnailCount,
      int quality});
}

/// @nodoc
class _$ThumbnailRequestCopyWithImpl<$Res, $Val extends ThumbnailRequest>
    implements $ThumbnailRequestCopyWith<$Res> {
  _$ThumbnailRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoPath = null,
    Object? videoDuration = null,
    Object? thumbnailHeight = null,
    Object? aspectRatio = null,
    Object? thumbnailCount = null,
    Object? quality = null,
  }) {
    return _then(_value.copyWith(
      videoPath: null == videoPath
          ? _value.videoPath
          : videoPath // ignore: cast_nullable_to_non_nullable
              as String,
      videoDuration: null == videoDuration
          ? _value.videoDuration
          : videoDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      thumbnailHeight: null == thumbnailHeight
          ? _value.thumbnailHeight
          : thumbnailHeight // ignore: cast_nullable_to_non_nullable
              as int,
      aspectRatio: null == aspectRatio
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double,
      thumbnailCount: null == thumbnailCount
          ? _value.thumbnailCount
          : thumbnailCount // ignore: cast_nullable_to_non_nullable
              as int,
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ThumbnailRequestCopyWith<$Res>
    implements $ThumbnailRequestCopyWith<$Res> {
  factory _$$_ThumbnailRequestCopyWith(
          _$_ThumbnailRequest value, $Res Function(_$_ThumbnailRequest) then) =
      __$$_ThumbnailRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String videoPath,
      Duration videoDuration,
      int thumbnailHeight,
      double aspectRatio,
      int thumbnailCount,
      int quality});
}

/// @nodoc
class __$$_ThumbnailRequestCopyWithImpl<$Res>
    extends _$ThumbnailRequestCopyWithImpl<$Res, _$_ThumbnailRequest>
    implements _$$_ThumbnailRequestCopyWith<$Res> {
  __$$_ThumbnailRequestCopyWithImpl(
      _$_ThumbnailRequest _value, $Res Function(_$_ThumbnailRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoPath = null,
    Object? videoDuration = null,
    Object? thumbnailHeight = null,
    Object? aspectRatio = null,
    Object? thumbnailCount = null,
    Object? quality = null,
  }) {
    return _then(_$_ThumbnailRequest(
      videoPath: null == videoPath
          ? _value.videoPath
          : videoPath // ignore: cast_nullable_to_non_nullable
              as String,
      videoDuration: null == videoDuration
          ? _value.videoDuration
          : videoDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      thumbnailHeight: null == thumbnailHeight
          ? _value.thumbnailHeight
          : thumbnailHeight // ignore: cast_nullable_to_non_nullable
              as int,
      aspectRatio: null == aspectRatio
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double,
      thumbnailCount: null == thumbnailCount
          ? _value.thumbnailCount
          : thumbnailCount // ignore: cast_nullable_to_non_nullable
              as int,
      quality: null == quality
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
            other is _$_ThumbnailRequest &&
            (identical(other.videoPath, videoPath) ||
                other.videoPath == videoPath) &&
            (identical(other.videoDuration, videoDuration) ||
                other.videoDuration == videoDuration) &&
            (identical(other.thumbnailHeight, thumbnailHeight) ||
                other.thumbnailHeight == thumbnailHeight) &&
            (identical(other.aspectRatio, aspectRatio) ||
                other.aspectRatio == aspectRatio) &&
            (identical(other.thumbnailCount, thumbnailCount) ||
                other.thumbnailCount == thumbnailCount) &&
            (identical(other.quality, quality) || other.quality == quality));
  }

  @override
  int get hashCode => Object.hash(runtimeType, videoPath, videoDuration,
      thumbnailHeight, aspectRatio, thumbnailCount, quality);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ThumbnailRequestCopyWith<_$_ThumbnailRequest> get copyWith =>
      __$$_ThumbnailRequestCopyWithImpl<_$_ThumbnailRequest>(this, _$identity);
}

abstract class _ThumbnailRequest implements ThumbnailRequest {
  const factory _ThumbnailRequest(
      {required final String videoPath,
      required final Duration videoDuration,
      required final int thumbnailHeight,
      required final double aspectRatio,
      required final int thumbnailCount,
      required final int quality}) = _$_ThumbnailRequest;

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
  _$$_ThumbnailRequestCopyWith<_$_ThumbnailRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
