// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'color_scheme_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ColorSchemeRequestTearOff {
  const _$ColorSchemeRequestTearOff();

  ColorRequest color({required Color color, required Brightness brightness}) {
    return ColorRequest(
      color: color,
      brightness: brightness,
    );
  }

  EntryColorSchemeRequest entry(
      {required SavedEntry entry,
      required Color projectColor,
      required Brightness brightness}) {
    return EntryColorSchemeRequest(
      entry: entry,
      projectColor: projectColor,
      brightness: brightness,
    );
  }

  ProjectColorSchemeRequest project(
      {required Project project, required Brightness brightness}) {
    return ProjectColorSchemeRequest(
      project: project,
      brightness: brightness,
    );
  }
}

/// @nodoc
const $ColorSchemeRequest = _$ColorSchemeRequestTearOff();

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
    TResult Function(Color color, Brightness brightness)? color,
    TResult Function(
            SavedEntry entry, Color projectColor, Brightness brightness)?
        entry,
    TResult Function(Project project, Brightness brightness)? project,
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
    TResult Function(ColorRequest value)? color,
    TResult Function(EntryColorSchemeRequest value)? entry,
    TResult Function(ProjectColorSchemeRequest value)? project,
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
      _$ColorSchemeRequestCopyWithImpl<$Res>;
  $Res call({Brightness brightness});
}

/// @nodoc
class _$ColorSchemeRequestCopyWithImpl<$Res>
    implements $ColorSchemeRequestCopyWith<$Res> {
  _$ColorSchemeRequestCopyWithImpl(this._value, this._then);

  final ColorSchemeRequest _value;
  // ignore: unused_field
  final $Res Function(ColorSchemeRequest) _then;

  @override
  $Res call({
    Object? brightness = freezed,
  }) {
    return _then(_value.copyWith(
      brightness: brightness == freezed
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc
abstract class $ColorRequestCopyWith<$Res>
    implements $ColorSchemeRequestCopyWith<$Res> {
  factory $ColorRequestCopyWith(
          ColorRequest value, $Res Function(ColorRequest) then) =
      _$ColorRequestCopyWithImpl<$Res>;
  @override
  $Res call({Color color, Brightness brightness});
}

/// @nodoc
class _$ColorRequestCopyWithImpl<$Res>
    extends _$ColorSchemeRequestCopyWithImpl<$Res>
    implements $ColorRequestCopyWith<$Res> {
  _$ColorRequestCopyWithImpl(
      ColorRequest _value, $Res Function(ColorRequest) _then)
      : super(_value, (v) => _then(v as ColorRequest));

  @override
  ColorRequest get _value => super._value as ColorRequest;

  @override
  $Res call({
    Object? color = freezed,
    Object? brightness = freezed,
  }) {
    return _then(ColorRequest(
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      brightness: brightness == freezed
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
            other is ColorRequest &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality()
                .equals(other.brightness, brightness));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(brightness));

  @JsonKey(ignore: true)
  @override
  $ColorRequestCopyWith<ColorRequest> get copyWith =>
      _$ColorRequestCopyWithImpl<ColorRequest>(this, _$identity);

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
    TResult Function(Color color, Brightness brightness)? color,
    TResult Function(
            SavedEntry entry, Color projectColor, Brightness brightness)?
        entry,
    TResult Function(Project project, Brightness brightness)? project,
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
    TResult Function(ColorRequest value)? color,
    TResult Function(EntryColorSchemeRequest value)? entry,
    TResult Function(ProjectColorSchemeRequest value)? project,
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
      {required Color color, required Brightness brightness}) = _$ColorRequest;

  Color get color;
  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  $ColorRequestCopyWith<ColorRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntryColorSchemeRequestCopyWith<$Res>
    implements $ColorSchemeRequestCopyWith<$Res> {
  factory $EntryColorSchemeRequestCopyWith(EntryColorSchemeRequest value,
          $Res Function(EntryColorSchemeRequest) then) =
      _$EntryColorSchemeRequestCopyWithImpl<$Res>;
  @override
  $Res call({SavedEntry entry, Color projectColor, Brightness brightness});
}

/// @nodoc
class _$EntryColorSchemeRequestCopyWithImpl<$Res>
    extends _$ColorSchemeRequestCopyWithImpl<$Res>
    implements $EntryColorSchemeRequestCopyWith<$Res> {
  _$EntryColorSchemeRequestCopyWithImpl(EntryColorSchemeRequest _value,
      $Res Function(EntryColorSchemeRequest) _then)
      : super(_value, (v) => _then(v as EntryColorSchemeRequest));

  @override
  EntryColorSchemeRequest get _value => super._value as EntryColorSchemeRequest;

  @override
  $Res call({
    Object? entry = freezed,
    Object? projectColor = freezed,
    Object? brightness = freezed,
  }) {
    return _then(EntryColorSchemeRequest(
      entry: entry == freezed
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as SavedEntry,
      projectColor: projectColor == freezed
          ? _value.projectColor
          : projectColor // ignore: cast_nullable_to_non_nullable
              as Color,
      brightness: brightness == freezed
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
            other is EntryColorSchemeRequest &&
            const DeepCollectionEquality().equals(other.entry, entry) &&
            const DeepCollectionEquality()
                .equals(other.projectColor, projectColor) &&
            const DeepCollectionEquality()
                .equals(other.brightness, brightness));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(entry),
      const DeepCollectionEquality().hash(projectColor),
      const DeepCollectionEquality().hash(brightness));

  @JsonKey(ignore: true)
  @override
  $EntryColorSchemeRequestCopyWith<EntryColorSchemeRequest> get copyWith =>
      _$EntryColorSchemeRequestCopyWithImpl<EntryColorSchemeRequest>(
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
    TResult Function(Color color, Brightness brightness)? color,
    TResult Function(
            SavedEntry entry, Color projectColor, Brightness brightness)?
        entry,
    TResult Function(Project project, Brightness brightness)? project,
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
    TResult Function(ColorRequest value)? color,
    TResult Function(EntryColorSchemeRequest value)? entry,
    TResult Function(ProjectColorSchemeRequest value)? project,
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
      {required SavedEntry entry,
      required Color projectColor,
      required Brightness brightness}) = _$EntryColorSchemeRequest;

  SavedEntry get entry;
  Color get projectColor;
  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  $EntryColorSchemeRequestCopyWith<EntryColorSchemeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectColorSchemeRequestCopyWith<$Res>
    implements $ColorSchemeRequestCopyWith<$Res> {
  factory $ProjectColorSchemeRequestCopyWith(ProjectColorSchemeRequest value,
          $Res Function(ProjectColorSchemeRequest) then) =
      _$ProjectColorSchemeRequestCopyWithImpl<$Res>;
  @override
  $Res call({Project project, Brightness brightness});

  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class _$ProjectColorSchemeRequestCopyWithImpl<$Res>
    extends _$ColorSchemeRequestCopyWithImpl<$Res>
    implements $ProjectColorSchemeRequestCopyWith<$Res> {
  _$ProjectColorSchemeRequestCopyWithImpl(ProjectColorSchemeRequest _value,
      $Res Function(ProjectColorSchemeRequest) _then)
      : super(_value, (v) => _then(v as ProjectColorSchemeRequest));

  @override
  ProjectColorSchemeRequest get _value =>
      super._value as ProjectColorSchemeRequest;

  @override
  $Res call({
    Object? project = freezed,
    Object? brightness = freezed,
  }) {
    return _then(ProjectColorSchemeRequest(
      project: project == freezed
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
      brightness: brightness == freezed
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }

  @override
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
            other is ProjectColorSchemeRequest &&
            const DeepCollectionEquality().equals(other.project, project) &&
            const DeepCollectionEquality()
                .equals(other.brightness, brightness));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(project),
      const DeepCollectionEquality().hash(brightness));

  @JsonKey(ignore: true)
  @override
  $ProjectColorSchemeRequestCopyWith<ProjectColorSchemeRequest> get copyWith =>
      _$ProjectColorSchemeRequestCopyWithImpl<ProjectColorSchemeRequest>(
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
    return project(this.project, brightness);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Color color, Brightness brightness)? color,
    TResult Function(
            SavedEntry entry, Color projectColor, Brightness brightness)?
        entry,
    TResult Function(Project project, Brightness brightness)? project,
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
    TResult Function(ColorRequest value)? color,
    TResult Function(EntryColorSchemeRequest value)? entry,
    TResult Function(ProjectColorSchemeRequest value)? project,
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
      {required Project project,
      required Brightness brightness}) = _$ProjectColorSchemeRequest;

  Project get project;
  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  $ProjectColorSchemeRequestCopyWith<ProjectColorSchemeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
