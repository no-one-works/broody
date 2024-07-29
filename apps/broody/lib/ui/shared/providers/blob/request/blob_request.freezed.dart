// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blob_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BlobRequest {
  int get day => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BlobRequestCopyWith<BlobRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlobRequestCopyWith<$Res> {
  factory $BlobRequestCopyWith(
          BlobRequest value, $Res Function(BlobRequest) then) =
      _$BlobRequestCopyWithImpl<$Res, BlobRequest>;
  @useResult
  $Res call({int day, int month});
}

/// @nodoc
class _$BlobRequestCopyWithImpl<$Res, $Val extends BlobRequest>
    implements $BlobRequestCopyWith<$Res> {
  _$BlobRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? month = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BlobRequestCopyWith<$Res>
    implements $BlobRequestCopyWith<$Res> {
  factory _$$_BlobRequestCopyWith(
          _$_BlobRequest value, $Res Function(_$_BlobRequest) then) =
      __$$_BlobRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int day, int month});
}

/// @nodoc
class __$$_BlobRequestCopyWithImpl<$Res>
    extends _$BlobRequestCopyWithImpl<$Res, _$_BlobRequest>
    implements _$$_BlobRequestCopyWith<$Res> {
  __$$_BlobRequestCopyWithImpl(
      _$_BlobRequest _value, $Res Function(_$_BlobRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? month = null,
  }) {
    return _then(_$_BlobRequest(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_BlobRequest implements _BlobRequest {
  const _$_BlobRequest({required this.day, required this.month});

  @override
  final int day;
  @override
  final int month;

  @override
  String toString() {
    return 'BlobRequest(day: $day, month: $month)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BlobRequest &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.month, month) || other.month == month));
  }

  @override
  int get hashCode => Object.hash(runtimeType, day, month);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BlobRequestCopyWith<_$_BlobRequest> get copyWith =>
      __$$_BlobRequestCopyWithImpl<_$_BlobRequest>(this, _$identity);
}

abstract class _BlobRequest implements BlobRequest {
  const factory _BlobRequest(
      {required final int day, required final int month}) = _$_BlobRequest;

  @override
  int get day;
  @override
  int get month;
  @override
  @JsonKey(ignore: true)
  _$$_BlobRequestCopyWith<_$_BlobRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
