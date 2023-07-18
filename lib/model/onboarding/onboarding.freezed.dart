// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Onboarding _$OnboardingFromJson(Map<String, dynamic> json) {
  return _Onboarding.fromJson(json);
}

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
      _$OnboardingCopyWithImpl<$Res, Onboarding>;
  @useResult
  $Res call({bool knowsTwoFingerSwipe, bool knowsTimeline});
}

/// @nodoc
class _$OnboardingCopyWithImpl<$Res, $Val extends Onboarding>
    implements $OnboardingCopyWith<$Res> {
  _$OnboardingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? knowsTwoFingerSwipe = null,
    Object? knowsTimeline = null,
  }) {
    return _then(_value.copyWith(
      knowsTwoFingerSwipe: null == knowsTwoFingerSwipe
          ? _value.knowsTwoFingerSwipe
          : knowsTwoFingerSwipe // ignore: cast_nullable_to_non_nullable
              as bool,
      knowsTimeline: null == knowsTimeline
          ? _value.knowsTimeline
          : knowsTimeline // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OnboardingCopyWith<$Res>
    implements $OnboardingCopyWith<$Res> {
  factory _$$_OnboardingCopyWith(
          _$_Onboarding value, $Res Function(_$_Onboarding) then) =
      __$$_OnboardingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool knowsTwoFingerSwipe, bool knowsTimeline});
}

/// @nodoc
class __$$_OnboardingCopyWithImpl<$Res>
    extends _$OnboardingCopyWithImpl<$Res, _$_Onboarding>
    implements _$$_OnboardingCopyWith<$Res> {
  __$$_OnboardingCopyWithImpl(
      _$_Onboarding _value, $Res Function(_$_Onboarding) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? knowsTwoFingerSwipe = null,
    Object? knowsTimeline = null,
  }) {
    return _then(_$_Onboarding(
      knowsTwoFingerSwipe: null == knowsTwoFingerSwipe
          ? _value.knowsTwoFingerSwipe
          : knowsTwoFingerSwipe // ignore: cast_nullable_to_non_nullable
              as bool,
      knowsTimeline: null == knowsTimeline
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

  @override
  @JsonKey()
  final bool knowsTwoFingerSwipe;
  @override
  @JsonKey()
  final bool knowsTimeline;

  @override
  String toString() {
    return 'Onboarding(knowsTwoFingerSwipe: $knowsTwoFingerSwipe, knowsTimeline: $knowsTimeline)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Onboarding &&
            (identical(other.knowsTwoFingerSwipe, knowsTwoFingerSwipe) ||
                other.knowsTwoFingerSwipe == knowsTwoFingerSwipe) &&
            (identical(other.knowsTimeline, knowsTimeline) ||
                other.knowsTimeline == knowsTimeline));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, knowsTwoFingerSwipe, knowsTimeline);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnboardingCopyWith<_$_Onboarding> get copyWith =>
      __$$_OnboardingCopyWithImpl<_$_Onboarding>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OnboardingToJson(
      this,
    );
  }
}

abstract class _Onboarding implements Onboarding {
  const factory _Onboarding(
      {final bool knowsTwoFingerSwipe,
      final bool knowsTimeline}) = _$_Onboarding;

  factory _Onboarding.fromJson(Map<String, dynamic> json) =
      _$_Onboarding.fromJson;

  @override
  bool get knowsTwoFingerSwipe;
  @override
  bool get knowsTimeline;
  @override
  @JsonKey(ignore: true)
  _$$_OnboardingCopyWith<_$_Onboarding> get copyWith =>
      throw _privateConstructorUsedError;
}
