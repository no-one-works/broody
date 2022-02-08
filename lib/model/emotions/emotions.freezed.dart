// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'emotions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Emotions _$EmotionsFromJson(Map<String, dynamic> json) {
  return _Emotions.fromJson(json);
}

/// @nodoc
class _$EmotionsTearOff {
  const _$EmotionsTearOff();

  _Emotions call({double sadHappy = 0.5}) {
    return _Emotions(
      sadHappy: sadHappy,
    );
  }

  Emotions fromJson(Map<String, Object?> json) {
    return Emotions.fromJson(json);
  }
}

/// @nodoc
const $Emotions = _$EmotionsTearOff();

/// @nodoc
mixin _$Emotions {
  double get sadHappy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmotionsCopyWith<Emotions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmotionsCopyWith<$Res> {
  factory $EmotionsCopyWith(Emotions value, $Res Function(Emotions) then) =
      _$EmotionsCopyWithImpl<$Res>;
  $Res call({double sadHappy});
}

/// @nodoc
class _$EmotionsCopyWithImpl<$Res> implements $EmotionsCopyWith<$Res> {
  _$EmotionsCopyWithImpl(this._value, this._then);

  final Emotions _value;
  // ignore: unused_field
  final $Res Function(Emotions) _then;

  @override
  $Res call({
    Object? sadHappy = freezed,
  }) {
    return _then(_value.copyWith(
      sadHappy: sadHappy == freezed
          ? _value.sadHappy
          : sadHappy // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$EmotionsCopyWith<$Res> implements $EmotionsCopyWith<$Res> {
  factory _$EmotionsCopyWith(_Emotions value, $Res Function(_Emotions) then) =
      __$EmotionsCopyWithImpl<$Res>;
  @override
  $Res call({double sadHappy});
}

/// @nodoc
class __$EmotionsCopyWithImpl<$Res> extends _$EmotionsCopyWithImpl<$Res>
    implements _$EmotionsCopyWith<$Res> {
  __$EmotionsCopyWithImpl(_Emotions _value, $Res Function(_Emotions) _then)
      : super(_value, (v) => _then(v as _Emotions));

  @override
  _Emotions get _value => super._value as _Emotions;

  @override
  $Res call({
    Object? sadHappy = freezed,
  }) {
    return _then(_Emotions(
      sadHappy: sadHappy == freezed
          ? _value.sadHappy
          : sadHappy // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Emotions implements _Emotions {
  const _$_Emotions({this.sadHappy = 0.5});

  factory _$_Emotions.fromJson(Map<String, dynamic> json) =>
      _$$_EmotionsFromJson(json);

  @JsonKey()
  @override
  final double sadHappy;

  @override
  String toString() {
    return 'Emotions(sadHappy: $sadHappy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Emotions &&
            const DeepCollectionEquality().equals(other.sadHappy, sadHappy));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(sadHappy));

  @JsonKey(ignore: true)
  @override
  _$EmotionsCopyWith<_Emotions> get copyWith =>
      __$EmotionsCopyWithImpl<_Emotions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmotionsToJson(this);
  }
}

abstract class _Emotions implements Emotions {
  const factory _Emotions({double sadHappy}) = _$_Emotions;

  factory _Emotions.fromJson(Map<String, dynamic> json) = _$_Emotions.fromJson;

  @override
  double get sadHappy;
  @override
  @JsonKey(ignore: true)
  _$EmotionsCopyWith<_Emotions> get copyWith =>
      throw _privateConstructorUsedError;
}
