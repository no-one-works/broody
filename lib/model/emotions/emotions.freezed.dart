// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emotions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Emotions _$EmotionsFromJson(Map<String, dynamic> json) {
  return _Emotions.fromJson(json);
}

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
      _$EmotionsCopyWithImpl<$Res, Emotions>;
  @useResult
  $Res call({double sadHappy});
}

/// @nodoc
class _$EmotionsCopyWithImpl<$Res, $Val extends Emotions>
    implements $EmotionsCopyWith<$Res> {
  _$EmotionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sadHappy = null,
  }) {
    return _then(_value.copyWith(
      sadHappy: null == sadHappy
          ? _value.sadHappy
          : sadHappy // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmotionsCopyWith<$Res> implements $EmotionsCopyWith<$Res> {
  factory _$$_EmotionsCopyWith(
          _$_Emotions value, $Res Function(_$_Emotions) then) =
      __$$_EmotionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double sadHappy});
}

/// @nodoc
class __$$_EmotionsCopyWithImpl<$Res>
    extends _$EmotionsCopyWithImpl<$Res, _$_Emotions>
    implements _$$_EmotionsCopyWith<$Res> {
  __$$_EmotionsCopyWithImpl(
      _$_Emotions _value, $Res Function(_$_Emotions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sadHappy = null,
  }) {
    return _then(_$_Emotions(
      sadHappy: null == sadHappy
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

  @override
  @JsonKey()
  final double sadHappy;

  @override
  String toString() {
    return 'Emotions(sadHappy: $sadHappy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Emotions &&
            (identical(other.sadHappy, sadHappy) ||
                other.sadHappy == sadHappy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sadHappy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmotionsCopyWith<_$_Emotions> get copyWith =>
      __$$_EmotionsCopyWithImpl<_$_Emotions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmotionsToJson(
      this,
    );
  }
}

abstract class _Emotions implements Emotions {
  const factory _Emotions({final double sadHappy}) = _$_Emotions;

  factory _Emotions.fromJson(Map<String, dynamic> json) = _$_Emotions.fromJson;

  @override
  double get sadHappy;
  @override
  @JsonKey(ignore: true)
  _$$_EmotionsCopyWith<_$_Emotions> get copyWith =>
      throw _privateConstructorUsedError;
}
