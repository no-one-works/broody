// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'video_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$VideoRequestTearOff {
  const _$VideoRequestTearOff();

  _VideoRequest call({required DateTime date, required int page}) {
    return _VideoRequest(
      date: date,
      page: page,
    );
  }
}

/// @nodoc
const $VideoRequest = _$VideoRequestTearOff();

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
      _$VideoRequestCopyWithImpl<$Res>;
  $Res call({DateTime date, int page});
}

/// @nodoc
class _$VideoRequestCopyWithImpl<$Res> implements $VideoRequestCopyWith<$Res> {
  _$VideoRequestCopyWithImpl(this._value, this._then);

  final VideoRequest _value;
  // ignore: unused_field
  final $Res Function(VideoRequest) _then;

  @override
  $Res call({
    Object? date = freezed,
    Object? page = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$VideoRequestCopyWith<$Res>
    implements $VideoRequestCopyWith<$Res> {
  factory _$VideoRequestCopyWith(
          _VideoRequest value, $Res Function(_VideoRequest) then) =
      __$VideoRequestCopyWithImpl<$Res>;
  @override
  $Res call({DateTime date, int page});
}

/// @nodoc
class __$VideoRequestCopyWithImpl<$Res> extends _$VideoRequestCopyWithImpl<$Res>
    implements _$VideoRequestCopyWith<$Res> {
  __$VideoRequestCopyWithImpl(
      _VideoRequest _value, $Res Function(_VideoRequest) _then)
      : super(_value, (v) => _then(v as _VideoRequest));

  @override
  _VideoRequest get _value => super._value as _VideoRequest;

  @override
  $Res call({
    Object? date = freezed,
    Object? page = freezed,
  }) {
    return _then(_VideoRequest(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      page: page == freezed
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
            other is _VideoRequest &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.page, page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(page));

  @JsonKey(ignore: true)
  @override
  _$VideoRequestCopyWith<_VideoRequest> get copyWith =>
      __$VideoRequestCopyWithImpl<_VideoRequest>(this, _$identity);
}

abstract class _VideoRequest implements VideoRequest {
  const factory _VideoRequest({required DateTime date, required int page}) =
      _$_VideoRequest;

  @override
  DateTime get date;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$VideoRequestCopyWith<_VideoRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
