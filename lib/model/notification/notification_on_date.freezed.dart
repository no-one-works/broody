// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_on_date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationOnDate {
  DateTime get dateTime => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationOnDateCopyWith<NotificationOnDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationOnDateCopyWith<$Res> {
  factory $NotificationOnDateCopyWith(
          NotificationOnDate value, $Res Function(NotificationOnDate) then) =
      _$NotificationOnDateCopyWithImpl<$Res>;
  $Res call({DateTime dateTime, String title, String body});
}

/// @nodoc
class _$NotificationOnDateCopyWithImpl<$Res>
    implements $NotificationOnDateCopyWith<$Res> {
  _$NotificationOnDateCopyWithImpl(this._value, this._then);

  final NotificationOnDate _value;
  // ignore: unused_field
  final $Res Function(NotificationOnDate) _then;

  @override
  $Res call({
    Object? dateTime = freezed,
    Object? title = freezed,
    Object? body = freezed,
  }) {
    return _then(_value.copyWith(
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_NotificationOnDateCopyWith<$Res>
    implements $NotificationOnDateCopyWith<$Res> {
  factory _$$_NotificationOnDateCopyWith(_$_NotificationOnDate value,
          $Res Function(_$_NotificationOnDate) then) =
      __$$_NotificationOnDateCopyWithImpl<$Res>;
  @override
  $Res call({DateTime dateTime, String title, String body});
}

/// @nodoc
class __$$_NotificationOnDateCopyWithImpl<$Res>
    extends _$NotificationOnDateCopyWithImpl<$Res>
    implements _$$_NotificationOnDateCopyWith<$Res> {
  __$$_NotificationOnDateCopyWithImpl(
      _$_NotificationOnDate _value, $Res Function(_$_NotificationOnDate) _then)
      : super(_value, (v) => _then(v as _$_NotificationOnDate));

  @override
  _$_NotificationOnDate get _value => super._value as _$_NotificationOnDate;

  @override
  $Res call({
    Object? dateTime = freezed,
    Object? title = freezed,
    Object? body = freezed,
  }) {
    return _then(_$_NotificationOnDate(
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NotificationOnDate implements _NotificationOnDate {
  const _$_NotificationOnDate(
      {required this.dateTime, required this.title, required this.body});

  @override
  final DateTime dateTime;
  @override
  final String title;
  @override
  final String body;

  @override
  String toString() {
    return 'NotificationOnDate(dateTime: $dateTime, title: $title, body: $body)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationOnDate &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.body, body));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dateTime),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(body));

  @JsonKey(ignore: true)
  @override
  _$$_NotificationOnDateCopyWith<_$_NotificationOnDate> get copyWith =>
      __$$_NotificationOnDateCopyWithImpl<_$_NotificationOnDate>(
          this, _$identity);
}

abstract class _NotificationOnDate implements NotificationOnDate {
  const factory _NotificationOnDate(
      {required final DateTime dateTime,
      required final String title,
      required final String body}) = _$_NotificationOnDate;

  @override
  DateTime get dateTime;
  @override
  String get title;
  @override
  String get body;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationOnDateCopyWith<_$_NotificationOnDate> get copyWith =>
      throw _privateConstructorUsedError;
}
