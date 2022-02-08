// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'onboarding.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Onboarding _$OnboardingFromJson(Map<String, dynamic> json) {
  return _Onboarding.fromJson(json);
}

/// @nodoc
class _$OnboardingTearOff {
  const _$OnboardingTearOff();

  _Onboarding call(
      {bool knowsTwoFingerSwipe = false, bool knowsTimeline = false}) {
    return _Onboarding(
      knowsTwoFingerSwipe: knowsTwoFingerSwipe,
      knowsTimeline: knowsTimeline,
    );
  }

  Onboarding fromJson(Map<String, Object?> json) {
    return Onboarding.fromJson(json);
  }
}

/// @nodoc
const $Onboarding = _$OnboardingTearOff();

/// @nodoc
mixin _$Onboarding {
  bool get knowsTwoFingerSwipe => throw _privateConstructorUsedError;
  bool get knowsTimeline => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OnboardingCopyWith<Onboarding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingCopyWith<$Res> {
  factory $OnboardingCopyWith(
          Onboarding value, $Res Function(Onboarding) then) =
      _$OnboardingCopyWithImpl<$Res>;
  $Res call({bool knowsTwoFingerSwipe, bool knowsTimeline});
}

/// @nodoc
class _$OnboardingCopyWithImpl<$Res> implements $OnboardingCopyWith<$Res> {
  _$OnboardingCopyWithImpl(this._value, this._then);

  final Onboarding _value;
  // ignore: unused_field
  final $Res Function(Onboarding) _then;

  @override
  $Res call({
    Object? knowsTwoFingerSwipe = freezed,
    Object? knowsTimeline = freezed,
  }) {
    return _then(_value.copyWith(
      knowsTwoFingerSwipe: knowsTwoFingerSwipe == freezed
          ? _value.knowsTwoFingerSwipe
          : knowsTwoFingerSwipe // ignore: cast_nullable_to_non_nullable
              as bool,
      knowsTimeline: knowsTimeline == freezed
          ? _value.knowsTimeline
          : knowsTimeline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$OnboardingCopyWith<$Res> implements $OnboardingCopyWith<$Res> {
  factory _$OnboardingCopyWith(
          _Onboarding value, $Res Function(_Onboarding) then) =
      __$OnboardingCopyWithImpl<$Res>;
  @override
  $Res call({bool knowsTwoFingerSwipe, bool knowsTimeline});
}

/// @nodoc
class __$OnboardingCopyWithImpl<$Res> extends _$OnboardingCopyWithImpl<$Res>
    implements _$OnboardingCopyWith<$Res> {
  __$OnboardingCopyWithImpl(
      _Onboarding _value, $Res Function(_Onboarding) _then)
      : super(_value, (v) => _then(v as _Onboarding));

  @override
  _Onboarding get _value => super._value as _Onboarding;

  @override
  $Res call({
    Object? knowsTwoFingerSwipe = freezed,
    Object? knowsTimeline = freezed,
  }) {
    return _then(_Onboarding(
      knowsTwoFingerSwipe: knowsTwoFingerSwipe == freezed
          ? _value.knowsTwoFingerSwipe
          : knowsTwoFingerSwipe // ignore: cast_nullable_to_non_nullable
              as bool,
      knowsTimeline: knowsTimeline == freezed
          ? _value.knowsTimeline
          : knowsTimeline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Onboarding implements _Onboarding {
  const _$_Onboarding(
      {this.knowsTwoFingerSwipe = false, this.knowsTimeline = false});

  factory _$_Onboarding.fromJson(Map<String, dynamic> json) =>
      _$$_OnboardingFromJson(json);

  @JsonKey()
  @override
  final bool knowsTwoFingerSwipe;
  @JsonKey()
  @override
  final bool knowsTimeline;

  @override
  String toString() {
    return 'Onboarding(knowsTwoFingerSwipe: $knowsTwoFingerSwipe, knowsTimeline: $knowsTimeline)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Onboarding &&
            const DeepCollectionEquality()
                .equals(other.knowsTwoFingerSwipe, knowsTwoFingerSwipe) &&
            const DeepCollectionEquality()
                .equals(other.knowsTimeline, knowsTimeline));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(knowsTwoFingerSwipe),
      const DeepCollectionEquality().hash(knowsTimeline));

  @JsonKey(ignore: true)
  @override
  _$OnboardingCopyWith<_Onboarding> get copyWith =>
      __$OnboardingCopyWithImpl<_Onboarding>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OnboardingToJson(this);
  }
}

abstract class _Onboarding implements Onboarding {
  const factory _Onboarding({bool knowsTwoFingerSwipe, bool knowsTimeline}) =
      _$_Onboarding;

  factory _Onboarding.fromJson(Map<String, dynamic> json) =
      _$_Onboarding.fromJson;

  @override
  bool get knowsTwoFingerSwipe;
  @override
  bool get knowsTimeline;
  @override
  @JsonKey(ignore: true)
  _$OnboardingCopyWith<_Onboarding> get copyWith =>
      throw _privateConstructorUsedError;
}
