// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_scheme_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ColorSchemeRequest {
  Brightness get brightness => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Color color, Brightness brightness) color,
    required TResult Function(
            SavedEntry entry, Color projectColor, Brightness brightness)
        entry,
    required TResult Function(Project project, Brightness brightness) project,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Color color, Brightness brightness)? color,
    TResult? Function(
            SavedEntry entry, Color projectColor, Brightness brightness)?
        entry,
    TResult? Function(Project project, Brightness brightness)? project,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Color color, Brightness brightness)? color,
    TResult Function(
            SavedEntry entry, Color projectColor, Brightness brightness)?
        entry,
    TResult Function(Project project, Brightness brightness)? project,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ColorRequest value) color,
    required TResult Function(EntryColorSchemeRequest value) entry,
    required TResult Function(ProjectColorSchemeRequest value) project,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ColorRequest value)? color,
    TResult? Function(EntryColorSchemeRequest value)? entry,
    TResult? Function(ProjectColorSchemeRequest value)? project,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorRequest value)? color,
    TResult Function(EntryColorSchemeRequest value)? entry,
    TResult Function(ProjectColorSchemeRequest value)? project,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ColorSchemeRequestCopyWith<ColorSchemeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorSchemeRequestCopyWith<$Res> {
  factory $ColorSchemeRequestCopyWith(
          ColorSchemeRequest value, $Res Function(ColorSchemeRequest) then) =
      _$ColorSchemeRequestCopyWithImpl<$Res, ColorSchemeRequest>;
  @useResult
  $Res call({Brightness brightness});
}

/// @nodoc
class _$ColorSchemeRequestCopyWithImpl<$Res, $Val extends ColorSchemeRequest>
    implements $ColorSchemeRequestCopyWith<$Res> {
  _$ColorSchemeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brightness = null,
  }) {
    return _then(_value.copyWith(
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ColorRequestCopyWith<$Res>
    implements $ColorSchemeRequestCopyWith<$Res> {
  factory _$$ColorRequestCopyWith(
          _$ColorRequest value, $Res Function(_$ColorRequest) then) =
      __$$ColorRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Color color, Brightness brightness});
}

/// @nodoc
class __$$ColorRequestCopyWithImpl<$Res>
    extends _$ColorSchemeRequestCopyWithImpl<$Res, _$ColorRequest>
    implements _$$ColorRequestCopyWith<$Res> {
  __$$ColorRequestCopyWithImpl(
      _$ColorRequest _value, $Res Function(_$ColorRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? brightness = null,
  }) {
    return _then(_$ColorRequest(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc

class _$ColorRequest implements ColorRequest {
  const _$ColorRequest({required this.color, required this.brightness});

  @override
  final Color color;
  @override
  final Brightness brightness;

  @override
  String toString() {
    return 'ColorSchemeRequest.color(color: $color, brightness: $brightness)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorRequest &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, color, brightness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorRequestCopyWith<_$ColorRequest> get copyWith =>
      __$$ColorRequestCopyWithImpl<_$ColorRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Color color, Brightness brightness) color,
    required TResult Function(
            SavedEntry entry, Color projectColor, Brightness brightness)
        entry,
    required TResult Function(Project project, Brightness brightness) project,
  }) {
    return color(this.color, brightness);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Color color, Brightness brightness)? color,
    TResult? Function(
            SavedEntry entry, Color projectColor, Brightness brightness)?
        entry,
    TResult? Function(Project project, Brightness brightness)? project,
  }) {
    return color?.call(this.color, brightness);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Color color, Brightness brightness)? color,
    TResult Function(
            SavedEntry entry, Color projectColor, Brightness brightness)?
        entry,
    TResult Function(Project project, Brightness brightness)? project,
    required TResult orElse(),
  }) {
    if (color != null) {
      return color(this.color, brightness);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ColorRequest value) color,
    required TResult Function(EntryColorSchemeRequest value) entry,
    required TResult Function(ProjectColorSchemeRequest value) project,
  }) {
    return color(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ColorRequest value)? color,
    TResult? Function(EntryColorSchemeRequest value)? entry,
    TResult? Function(ProjectColorSchemeRequest value)? project,
  }) {
    return color?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorRequest value)? color,
    TResult Function(EntryColorSchemeRequest value)? entry,
    TResult Function(ProjectColorSchemeRequest value)? project,
    required TResult orElse(),
  }) {
    if (color != null) {
      return color(this);
    }
    return orElse();
  }
}

abstract class ColorRequest implements ColorSchemeRequest {
  const factory ColorRequest(
      {required final Color color,
      required final Brightness brightness}) = _$ColorRequest;

  Color get color;
  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  _$$ColorRequestCopyWith<_$ColorRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EntryColorSchemeRequestCopyWith<$Res>
    implements $ColorSchemeRequestCopyWith<$Res> {
  factory _$$EntryColorSchemeRequestCopyWith(_$EntryColorSchemeRequest value,
          $Res Function(_$EntryColorSchemeRequest) then) =
      __$$EntryColorSchemeRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SavedEntry entry, Color projectColor, Brightness brightness});
}

/// @nodoc
class __$$EntryColorSchemeRequestCopyWithImpl<$Res>
    extends _$ColorSchemeRequestCopyWithImpl<$Res, _$EntryColorSchemeRequest>
    implements _$$EntryColorSchemeRequestCopyWith<$Res> {
  __$$EntryColorSchemeRequestCopyWithImpl(_$EntryColorSchemeRequest _value,
      $Res Function(_$EntryColorSchemeRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entry = freezed,
    Object? projectColor = null,
    Object? brightness = null,
  }) {
    return _then(_$EntryColorSchemeRequest(
      entry: freezed == entry
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as SavedEntry,
      projectColor: null == projectColor
          ? _value.projectColor
          : projectColor // ignore: cast_nullable_to_non_nullable
              as Color,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc

class _$EntryColorSchemeRequest implements EntryColorSchemeRequest {
  const _$EntryColorSchemeRequest(
      {required this.entry,
      required this.projectColor,
      required this.brightness});

  @override
  final SavedEntry entry;
  @override
  final Color projectColor;
  @override
  final Brightness brightness;

  @override
  String toString() {
    return 'ColorSchemeRequest.entry(entry: $entry, projectColor: $projectColor, brightness: $brightness)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntryColorSchemeRequest &&
            const DeepCollectionEquality().equals(other.entry, entry) &&
            (identical(other.projectColor, projectColor) ||
                other.projectColor == projectColor) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(entry), projectColor, brightness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EntryColorSchemeRequestCopyWith<_$EntryColorSchemeRequest> get copyWith =>
      __$$EntryColorSchemeRequestCopyWithImpl<_$EntryColorSchemeRequest>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Color color, Brightness brightness) color,
    required TResult Function(
            SavedEntry entry, Color projectColor, Brightness brightness)
        entry,
    required TResult Function(Project project, Brightness brightness) project,
  }) {
    return entry(this.entry, projectColor, brightness);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Color color, Brightness brightness)? color,
    TResult? Function(
            SavedEntry entry, Color projectColor, Brightness brightness)?
        entry,
    TResult? Function(Project project, Brightness brightness)? project,
  }) {
    return entry?.call(this.entry, projectColor, brightness);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Color color, Brightness brightness)? color,
    TResult Function(
            SavedEntry entry, Color projectColor, Brightness brightness)?
        entry,
    TResult Function(Project project, Brightness brightness)? project,
    required TResult orElse(),
  }) {
    if (entry != null) {
      return entry(this.entry, projectColor, brightness);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ColorRequest value) color,
    required TResult Function(EntryColorSchemeRequest value) entry,
    required TResult Function(ProjectColorSchemeRequest value) project,
  }) {
    return entry(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ColorRequest value)? color,
    TResult? Function(EntryColorSchemeRequest value)? entry,
    TResult? Function(ProjectColorSchemeRequest value)? project,
  }) {
    return entry?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorRequest value)? color,
    TResult Function(EntryColorSchemeRequest value)? entry,
    TResult Function(ProjectColorSchemeRequest value)? project,
    required TResult orElse(),
  }) {
    if (entry != null) {
      return entry(this);
    }
    return orElse();
  }
}

abstract class EntryColorSchemeRequest implements ColorSchemeRequest {
  const factory EntryColorSchemeRequest(
      {required final SavedEntry entry,
      required final Color projectColor,
      required final Brightness brightness}) = _$EntryColorSchemeRequest;

  SavedEntry get entry;
  Color get projectColor;
  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  _$$EntryColorSchemeRequestCopyWith<_$EntryColorSchemeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProjectColorSchemeRequestCopyWith<$Res>
    implements $ColorSchemeRequestCopyWith<$Res> {
  factory _$$ProjectColorSchemeRequestCopyWith(
          _$ProjectColorSchemeRequest value,
          $Res Function(_$ProjectColorSchemeRequest) then) =
      __$$ProjectColorSchemeRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Project project, Brightness brightness});

  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class __$$ProjectColorSchemeRequestCopyWithImpl<$Res>
    extends _$ColorSchemeRequestCopyWithImpl<$Res, _$ProjectColorSchemeRequest>
    implements _$$ProjectColorSchemeRequestCopyWith<$Res> {
  __$$ProjectColorSchemeRequestCopyWithImpl(_$ProjectColorSchemeRequest _value,
      $Res Function(_$ProjectColorSchemeRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project = null,
    Object? brightness = null,
  }) {
    return _then(_$ProjectColorSchemeRequest(
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<$Res> get project {
    return $ProjectCopyWith<$Res>(_value.project, (value) {
      return _then(_value.copyWith(project: value));
    });
  }
}

/// @nodoc

class _$ProjectColorSchemeRequest implements ProjectColorSchemeRequest {
  const _$ProjectColorSchemeRequest(
      {required this.project, required this.brightness});

  @override
  final Project project;
  @override
  final Brightness brightness;

  @override
  String toString() {
    return 'ColorSchemeRequest.project(project: $project, brightness: $brightness)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectColorSchemeRequest &&
            (identical(other.project, project) || other.project == project) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, project, brightness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectColorSchemeRequestCopyWith<_$ProjectColorSchemeRequest>
      get copyWith => __$$ProjectColorSchemeRequestCopyWithImpl<
          _$ProjectColorSchemeRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Color color, Brightness brightness) color,
    required TResult Function(
            SavedEntry entry, Color projectColor, Brightness brightness)
        entry,
    required TResult Function(Project project, Brightness brightness) project,
  }) {
    return project(this.project, brightness);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Color color, Brightness brightness)? color,
    TResult? Function(
            SavedEntry entry, Color projectColor, Brightness brightness)?
        entry,
    TResult? Function(Project project, Brightness brightness)? project,
  }) {
    return project?.call(this.project, brightness);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Color color, Brightness brightness)? color,
    TResult Function(
            SavedEntry entry, Color projectColor, Brightness brightness)?
        entry,
    TResult Function(Project project, Brightness brightness)? project,
    required TResult orElse(),
  }) {
    if (project != null) {
      return project(this.project, brightness);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ColorRequest value) color,
    required TResult Function(EntryColorSchemeRequest value) entry,
    required TResult Function(ProjectColorSchemeRequest value) project,
  }) {
    return project(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ColorRequest value)? color,
    TResult? Function(EntryColorSchemeRequest value)? entry,
    TResult? Function(ProjectColorSchemeRequest value)? project,
  }) {
    return project?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorRequest value)? color,
    TResult Function(EntryColorSchemeRequest value)? entry,
    TResult Function(ProjectColorSchemeRequest value)? project,
    required TResult orElse(),
  }) {
    if (project != null) {
      return project(this);
    }
    return orElse();
  }
}

abstract class ProjectColorSchemeRequest implements ColorSchemeRequest {
  const factory ProjectColorSchemeRequest(
      {required final Project project,
      required final Brightness brightness}) = _$ProjectColorSchemeRequest;

  Project get project;
  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  _$$ProjectColorSchemeRequestCopyWith<_$ProjectColorSchemeRequest>
      get copyWith => throw _privateConstructorUsedError;
}
