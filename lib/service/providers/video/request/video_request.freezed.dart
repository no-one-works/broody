// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VideoRequest {
  DateTime get date => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VideoRequestCopyWith<VideoRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoRequestCopyWith<$Res> {
  factory $VideoRequestCopyWith(
          VideoRequest value, $Res Function(VideoRequest) then) =
      _$VideoRequestCopyWithImpl<$Res, VideoRequest>;
  @useResult
  $Res call({DateTime date, int page});
}

/// @nodoc
class _$VideoRequestCopyWithImpl<$Res, $Val extends VideoRequest>
    implements $VideoRequestCopyWith<$Res> {
  _$VideoRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VideoRequestCopyWith<$Res>
    implements $VideoRequestCopyWith<$Res> {
  factory _$$_VideoRequestCopyWith(
          _$_VideoRequest value, $Res Function(_$_VideoRequest) then) =
      __$$_VideoRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, int page});
}

/// @nodoc
class __$$_VideoRequestCopyWithImpl<$Res>
    extends _$VideoRequestCopyWithImpl<$Res, _$_VideoRequest>
    implements _$$_VideoRequestCopyWith<$Res> {
  __$$_VideoRequestCopyWithImpl(
      _$_VideoRequest _value, $Res Function(_$_VideoRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? page = null,
  }) {
    return _then(_$_VideoRequest(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_VideoRequest implements _VideoRequest {
  const _$_VideoRequest({required this.date, required this.page});

  @override
  final DateTime date;
  @override
  final int page;

  @override
  String toString() {
    return 'VideoRequest(date: $date, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VideoRequest &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VideoRequestCopyWith<_$_VideoRequest> get copyWith =>
      __$$_VideoRequestCopyWithImpl<_$_VideoRequest>(this, _$identity);
}

abstract class _VideoRequest implements VideoRequest {
  const factory _VideoRequest(
      {required final DateTime date,
      required final int page}) = _$_VideoRequest;

  @override
  DateTime get date;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$_VideoRequestCopyWith<_$_VideoRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
