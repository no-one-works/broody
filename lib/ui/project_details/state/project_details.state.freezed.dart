// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'project_details.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProjectDetailsState {
  Project get project => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Project project) creating,
    required TResult Function(Project project) editing,
    required TResult Function(Project project) confirmDestructive,
    required TResult Function(Project project) saved,
    required TResult Function(Project project) deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Project project)? creating,
    TResult Function(Project project)? editing,
    TResult Function(Project project)? confirmDestructive,
    TResult Function(Project project)? saved,
    TResult Function(Project project)? deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Project project)? creating,
    TResult Function(Project project)? editing,
    TResult Function(Project project)? confirmDestructive,
    TResult Function(Project project)? saved,
    TResult Function(Project project)? deleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectDetailsCreating value) creating,
    required TResult Function(ProjectDetailsEditing value) editing,
    required TResult Function(ProjectDetailsConfirmDestructive value)
        confirmDestructive,
    required TResult Function(ProjectDetailsSaved value) saved,
    required TResult Function(ProjectDetailsDeleted value) deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProjectDetailsCreating value)? creating,
    TResult Function(ProjectDetailsEditing value)? editing,
    TResult Function(ProjectDetailsConfirmDestructive value)?
        confirmDestructive,
    TResult Function(ProjectDetailsSaved value)? saved,
    TResult Function(ProjectDetailsDeleted value)? deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectDetailsCreating value)? creating,
    TResult Function(ProjectDetailsEditing value)? editing,
    TResult Function(ProjectDetailsConfirmDestructive value)?
        confirmDestructive,
    TResult Function(ProjectDetailsSaved value)? saved,
    TResult Function(ProjectDetailsDeleted value)? deleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectDetailsStateCopyWith<ProjectDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectDetailsStateCopyWith<$Res> {
  factory $ProjectDetailsStateCopyWith(
          ProjectDetailsState value, $Res Function(ProjectDetailsState) then) =
      _$ProjectDetailsStateCopyWithImpl<$Res>;
  $Res call({Project project});

  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class _$ProjectDetailsStateCopyWithImpl<$Res>
    implements $ProjectDetailsStateCopyWith<$Res> {
  _$ProjectDetailsStateCopyWithImpl(this._value, this._then);

  final ProjectDetailsState _value;
  // ignore: unused_field
  final $Res Function(ProjectDetailsState) _then;

  @override
  $Res call({
    Object? project = freezed,
  }) {
    return _then(_value.copyWith(
      project: project == freezed
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
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
abstract class _$$ProjectDetailsCreatingCopyWith<$Res>
    implements $ProjectDetailsStateCopyWith<$Res> {
  factory _$$ProjectDetailsCreatingCopyWith(_$ProjectDetailsCreating value,
          $Res Function(_$ProjectDetailsCreating) then) =
      __$$ProjectDetailsCreatingCopyWithImpl<$Res>;
  @override
  $Res call({Project project});

  @override
  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class __$$ProjectDetailsCreatingCopyWithImpl<$Res>
    extends _$ProjectDetailsStateCopyWithImpl<$Res>
    implements _$$ProjectDetailsCreatingCopyWith<$Res> {
  __$$ProjectDetailsCreatingCopyWithImpl(_$ProjectDetailsCreating _value,
      $Res Function(_$ProjectDetailsCreating) _then)
      : super(_value, (v) => _then(v as _$ProjectDetailsCreating));

  @override
  _$ProjectDetailsCreating get _value =>
      super._value as _$ProjectDetailsCreating;

  @override
  $Res call({
    Object? project = freezed,
  }) {
    return _then(_$ProjectDetailsCreating(
      project: project == freezed
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
    ));
  }
}

/// @nodoc

class _$ProjectDetailsCreating implements ProjectDetailsCreating {
  const _$ProjectDetailsCreating({required this.project});

  @override
  final Project project;

  @override
  String toString() {
    return 'ProjectDetailsState.creating(project: $project)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectDetailsCreating &&
            const DeepCollectionEquality().equals(other.project, project));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(project));

  @JsonKey(ignore: true)
  @override
  _$$ProjectDetailsCreatingCopyWith<_$ProjectDetailsCreating> get copyWith =>
      __$$ProjectDetailsCreatingCopyWithImpl<_$ProjectDetailsCreating>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Project project) creating,
    required TResult Function(Project project) editing,
    required TResult Function(Project project) confirmDestructive,
    required TResult Function(Project project) saved,
    required TResult Function(Project project) deleted,
  }) {
    return creating(project);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Project project)? creating,
    TResult Function(Project project)? editing,
    TResult Function(Project project)? confirmDestructive,
    TResult Function(Project project)? saved,
    TResult Function(Project project)? deleted,
  }) {
    return creating?.call(project);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Project project)? creating,
    TResult Function(Project project)? editing,
    TResult Function(Project project)? confirmDestructive,
    TResult Function(Project project)? saved,
    TResult Function(Project project)? deleted,
    required TResult orElse(),
  }) {
    if (creating != null) {
      return creating(project);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectDetailsCreating value) creating,
    required TResult Function(ProjectDetailsEditing value) editing,
    required TResult Function(ProjectDetailsConfirmDestructive value)
        confirmDestructive,
    required TResult Function(ProjectDetailsSaved value) saved,
    required TResult Function(ProjectDetailsDeleted value) deleted,
  }) {
    return creating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProjectDetailsCreating value)? creating,
    TResult Function(ProjectDetailsEditing value)? editing,
    TResult Function(ProjectDetailsConfirmDestructive value)?
        confirmDestructive,
    TResult Function(ProjectDetailsSaved value)? saved,
    TResult Function(ProjectDetailsDeleted value)? deleted,
  }) {
    return creating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectDetailsCreating value)? creating,
    TResult Function(ProjectDetailsEditing value)? editing,
    TResult Function(ProjectDetailsConfirmDestructive value)?
        confirmDestructive,
    TResult Function(ProjectDetailsSaved value)? saved,
    TResult Function(ProjectDetailsDeleted value)? deleted,
    required TResult orElse(),
  }) {
    if (creating != null) {
      return creating(this);
    }
    return orElse();
  }
}

abstract class ProjectDetailsCreating implements ProjectDetailsState {
  const factory ProjectDetailsCreating({required final Project project}) =
      _$ProjectDetailsCreating;

  @override
  Project get project;
  @override
  @JsonKey(ignore: true)
  _$$ProjectDetailsCreatingCopyWith<_$ProjectDetailsCreating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProjectDetailsEditingCopyWith<$Res>
    implements $ProjectDetailsStateCopyWith<$Res> {
  factory _$$ProjectDetailsEditingCopyWith(_$ProjectDetailsEditing value,
          $Res Function(_$ProjectDetailsEditing) then) =
      __$$ProjectDetailsEditingCopyWithImpl<$Res>;
  @override
  $Res call({Project project});

  @override
  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class __$$ProjectDetailsEditingCopyWithImpl<$Res>
    extends _$ProjectDetailsStateCopyWithImpl<$Res>
    implements _$$ProjectDetailsEditingCopyWith<$Res> {
  __$$ProjectDetailsEditingCopyWithImpl(_$ProjectDetailsEditing _value,
      $Res Function(_$ProjectDetailsEditing) _then)
      : super(_value, (v) => _then(v as _$ProjectDetailsEditing));

  @override
  _$ProjectDetailsEditing get _value => super._value as _$ProjectDetailsEditing;

  @override
  $Res call({
    Object? project = freezed,
  }) {
    return _then(_$ProjectDetailsEditing(
      project: project == freezed
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
    ));
  }
}

/// @nodoc

class _$ProjectDetailsEditing implements ProjectDetailsEditing {
  const _$ProjectDetailsEditing({required this.project});

  @override
  final Project project;

  @override
  String toString() {
    return 'ProjectDetailsState.editing(project: $project)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectDetailsEditing &&
            const DeepCollectionEquality().equals(other.project, project));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(project));

  @JsonKey(ignore: true)
  @override
  _$$ProjectDetailsEditingCopyWith<_$ProjectDetailsEditing> get copyWith =>
      __$$ProjectDetailsEditingCopyWithImpl<_$ProjectDetailsEditing>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Project project) creating,
    required TResult Function(Project project) editing,
    required TResult Function(Project project) confirmDestructive,
    required TResult Function(Project project) saved,
    required TResult Function(Project project) deleted,
  }) {
    return editing(project);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Project project)? creating,
    TResult Function(Project project)? editing,
    TResult Function(Project project)? confirmDestructive,
    TResult Function(Project project)? saved,
    TResult Function(Project project)? deleted,
  }) {
    return editing?.call(project);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Project project)? creating,
    TResult Function(Project project)? editing,
    TResult Function(Project project)? confirmDestructive,
    TResult Function(Project project)? saved,
    TResult Function(Project project)? deleted,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(project);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectDetailsCreating value) creating,
    required TResult Function(ProjectDetailsEditing value) editing,
    required TResult Function(ProjectDetailsConfirmDestructive value)
        confirmDestructive,
    required TResult Function(ProjectDetailsSaved value) saved,
    required TResult Function(ProjectDetailsDeleted value) deleted,
  }) {
    return editing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProjectDetailsCreating value)? creating,
    TResult Function(ProjectDetailsEditing value)? editing,
    TResult Function(ProjectDetailsConfirmDestructive value)?
        confirmDestructive,
    TResult Function(ProjectDetailsSaved value)? saved,
    TResult Function(ProjectDetailsDeleted value)? deleted,
  }) {
    return editing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectDetailsCreating value)? creating,
    TResult Function(ProjectDetailsEditing value)? editing,
    TResult Function(ProjectDetailsConfirmDestructive value)?
        confirmDestructive,
    TResult Function(ProjectDetailsSaved value)? saved,
    TResult Function(ProjectDetailsDeleted value)? deleted,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(this);
    }
    return orElse();
  }
}

abstract class ProjectDetailsEditing implements ProjectDetailsState {
  const factory ProjectDetailsEditing({required final Project project}) =
      _$ProjectDetailsEditing;

  @override
  Project get project;
  @override
  @JsonKey(ignore: true)
  _$$ProjectDetailsEditingCopyWith<_$ProjectDetailsEditing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProjectDetailsConfirmDestructiveCopyWith<$Res>
    implements $ProjectDetailsStateCopyWith<$Res> {
  factory _$$ProjectDetailsConfirmDestructiveCopyWith(
          _$ProjectDetailsConfirmDestructive value,
          $Res Function(_$ProjectDetailsConfirmDestructive) then) =
      __$$ProjectDetailsConfirmDestructiveCopyWithImpl<$Res>;
  @override
  $Res call({Project project});

  @override
  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class __$$ProjectDetailsConfirmDestructiveCopyWithImpl<$Res>
    extends _$ProjectDetailsStateCopyWithImpl<$Res>
    implements _$$ProjectDetailsConfirmDestructiveCopyWith<$Res> {
  __$$ProjectDetailsConfirmDestructiveCopyWithImpl(
      _$ProjectDetailsConfirmDestructive _value,
      $Res Function(_$ProjectDetailsConfirmDestructive) _then)
      : super(_value, (v) => _then(v as _$ProjectDetailsConfirmDestructive));

  @override
  _$ProjectDetailsConfirmDestructive get _value =>
      super._value as _$ProjectDetailsConfirmDestructive;

  @override
  $Res call({
    Object? project = freezed,
  }) {
    return _then(_$ProjectDetailsConfirmDestructive(
      project: project == freezed
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
    ));
  }
}

/// @nodoc

class _$ProjectDetailsConfirmDestructive
    implements ProjectDetailsConfirmDestructive {
  const _$ProjectDetailsConfirmDestructive({required this.project});

  @override
  final Project project;

  @override
  String toString() {
    return 'ProjectDetailsState.confirmDestructive(project: $project)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectDetailsConfirmDestructive &&
            const DeepCollectionEquality().equals(other.project, project));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(project));

  @JsonKey(ignore: true)
  @override
  _$$ProjectDetailsConfirmDestructiveCopyWith<
          _$ProjectDetailsConfirmDestructive>
      get copyWith => __$$ProjectDetailsConfirmDestructiveCopyWithImpl<
          _$ProjectDetailsConfirmDestructive>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Project project) creating,
    required TResult Function(Project project) editing,
    required TResult Function(Project project) confirmDestructive,
    required TResult Function(Project project) saved,
    required TResult Function(Project project) deleted,
  }) {
    return confirmDestructive(project);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Project project)? creating,
    TResult Function(Project project)? editing,
    TResult Function(Project project)? confirmDestructive,
    TResult Function(Project project)? saved,
    TResult Function(Project project)? deleted,
  }) {
    return confirmDestructive?.call(project);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Project project)? creating,
    TResult Function(Project project)? editing,
    TResult Function(Project project)? confirmDestructive,
    TResult Function(Project project)? saved,
    TResult Function(Project project)? deleted,
    required TResult orElse(),
  }) {
    if (confirmDestructive != null) {
      return confirmDestructive(project);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectDetailsCreating value) creating,
    required TResult Function(ProjectDetailsEditing value) editing,
    required TResult Function(ProjectDetailsConfirmDestructive value)
        confirmDestructive,
    required TResult Function(ProjectDetailsSaved value) saved,
    required TResult Function(ProjectDetailsDeleted value) deleted,
  }) {
    return confirmDestructive(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProjectDetailsCreating value)? creating,
    TResult Function(ProjectDetailsEditing value)? editing,
    TResult Function(ProjectDetailsConfirmDestructive value)?
        confirmDestructive,
    TResult Function(ProjectDetailsSaved value)? saved,
    TResult Function(ProjectDetailsDeleted value)? deleted,
  }) {
    return confirmDestructive?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectDetailsCreating value)? creating,
    TResult Function(ProjectDetailsEditing value)? editing,
    TResult Function(ProjectDetailsConfirmDestructive value)?
        confirmDestructive,
    TResult Function(ProjectDetailsSaved value)? saved,
    TResult Function(ProjectDetailsDeleted value)? deleted,
    required TResult orElse(),
  }) {
    if (confirmDestructive != null) {
      return confirmDestructive(this);
    }
    return orElse();
  }
}

abstract class ProjectDetailsConfirmDestructive implements ProjectDetailsState {
  const factory ProjectDetailsConfirmDestructive(
      {required final Project project}) = _$ProjectDetailsConfirmDestructive;

  @override
  Project get project;
  @override
  @JsonKey(ignore: true)
  _$$ProjectDetailsConfirmDestructiveCopyWith<
          _$ProjectDetailsConfirmDestructive>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProjectDetailsSavedCopyWith<$Res>
    implements $ProjectDetailsStateCopyWith<$Res> {
  factory _$$ProjectDetailsSavedCopyWith(_$ProjectDetailsSaved value,
          $Res Function(_$ProjectDetailsSaved) then) =
      __$$ProjectDetailsSavedCopyWithImpl<$Res>;
  @override
  $Res call({Project project});

  @override
  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class __$$ProjectDetailsSavedCopyWithImpl<$Res>
    extends _$ProjectDetailsStateCopyWithImpl<$Res>
    implements _$$ProjectDetailsSavedCopyWith<$Res> {
  __$$ProjectDetailsSavedCopyWithImpl(
      _$ProjectDetailsSaved _value, $Res Function(_$ProjectDetailsSaved) _then)
      : super(_value, (v) => _then(v as _$ProjectDetailsSaved));

  @override
  _$ProjectDetailsSaved get _value => super._value as _$ProjectDetailsSaved;

  @override
  $Res call({
    Object? project = freezed,
  }) {
    return _then(_$ProjectDetailsSaved(
      project: project == freezed
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
    ));
  }
}

/// @nodoc

class _$ProjectDetailsSaved implements ProjectDetailsSaved {
  const _$ProjectDetailsSaved({required this.project});

  @override
  final Project project;

  @override
  String toString() {
    return 'ProjectDetailsState.saved(project: $project)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectDetailsSaved &&
            const DeepCollectionEquality().equals(other.project, project));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(project));

  @JsonKey(ignore: true)
  @override
  _$$ProjectDetailsSavedCopyWith<_$ProjectDetailsSaved> get copyWith =>
      __$$ProjectDetailsSavedCopyWithImpl<_$ProjectDetailsSaved>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Project project) creating,
    required TResult Function(Project project) editing,
    required TResult Function(Project project) confirmDestructive,
    required TResult Function(Project project) saved,
    required TResult Function(Project project) deleted,
  }) {
    return saved(project);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Project project)? creating,
    TResult Function(Project project)? editing,
    TResult Function(Project project)? confirmDestructive,
    TResult Function(Project project)? saved,
    TResult Function(Project project)? deleted,
  }) {
    return saved?.call(project);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Project project)? creating,
    TResult Function(Project project)? editing,
    TResult Function(Project project)? confirmDestructive,
    TResult Function(Project project)? saved,
    TResult Function(Project project)? deleted,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(project);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectDetailsCreating value) creating,
    required TResult Function(ProjectDetailsEditing value) editing,
    required TResult Function(ProjectDetailsConfirmDestructive value)
        confirmDestructive,
    required TResult Function(ProjectDetailsSaved value) saved,
    required TResult Function(ProjectDetailsDeleted value) deleted,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProjectDetailsCreating value)? creating,
    TResult Function(ProjectDetailsEditing value)? editing,
    TResult Function(ProjectDetailsConfirmDestructive value)?
        confirmDestructive,
    TResult Function(ProjectDetailsSaved value)? saved,
    TResult Function(ProjectDetailsDeleted value)? deleted,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectDetailsCreating value)? creating,
    TResult Function(ProjectDetailsEditing value)? editing,
    TResult Function(ProjectDetailsConfirmDestructive value)?
        confirmDestructive,
    TResult Function(ProjectDetailsSaved value)? saved,
    TResult Function(ProjectDetailsDeleted value)? deleted,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class ProjectDetailsSaved implements ProjectDetailsState {
  const factory ProjectDetailsSaved({required final Project project}) =
      _$ProjectDetailsSaved;

  @override
  Project get project;
  @override
  @JsonKey(ignore: true)
  _$$ProjectDetailsSavedCopyWith<_$ProjectDetailsSaved> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProjectDetailsDeletedCopyWith<$Res>
    implements $ProjectDetailsStateCopyWith<$Res> {
  factory _$$ProjectDetailsDeletedCopyWith(_$ProjectDetailsDeleted value,
          $Res Function(_$ProjectDetailsDeleted) then) =
      __$$ProjectDetailsDeletedCopyWithImpl<$Res>;
  @override
  $Res call({Project project});

  @override
  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class __$$ProjectDetailsDeletedCopyWithImpl<$Res>
    extends _$ProjectDetailsStateCopyWithImpl<$Res>
    implements _$$ProjectDetailsDeletedCopyWith<$Res> {
  __$$ProjectDetailsDeletedCopyWithImpl(_$ProjectDetailsDeleted _value,
      $Res Function(_$ProjectDetailsDeleted) _then)
      : super(_value, (v) => _then(v as _$ProjectDetailsDeleted));

  @override
  _$ProjectDetailsDeleted get _value => super._value as _$ProjectDetailsDeleted;

  @override
  $Res call({
    Object? project = freezed,
  }) {
    return _then(_$ProjectDetailsDeleted(
      project: project == freezed
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
    ));
  }
}

/// @nodoc

class _$ProjectDetailsDeleted implements ProjectDetailsDeleted {
  const _$ProjectDetailsDeleted({required this.project});

  @override
  final Project project;

  @override
  String toString() {
    return 'ProjectDetailsState.deleted(project: $project)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectDetailsDeleted &&
            const DeepCollectionEquality().equals(other.project, project));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(project));

  @JsonKey(ignore: true)
  @override
  _$$ProjectDetailsDeletedCopyWith<_$ProjectDetailsDeleted> get copyWith =>
      __$$ProjectDetailsDeletedCopyWithImpl<_$ProjectDetailsDeleted>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Project project) creating,
    required TResult Function(Project project) editing,
    required TResult Function(Project project) confirmDestructive,
    required TResult Function(Project project) saved,
    required TResult Function(Project project) deleted,
  }) {
    return deleted(project);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Project project)? creating,
    TResult Function(Project project)? editing,
    TResult Function(Project project)? confirmDestructive,
    TResult Function(Project project)? saved,
    TResult Function(Project project)? deleted,
  }) {
    return deleted?.call(project);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Project project)? creating,
    TResult Function(Project project)? editing,
    TResult Function(Project project)? confirmDestructive,
    TResult Function(Project project)? saved,
    TResult Function(Project project)? deleted,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(project);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectDetailsCreating value) creating,
    required TResult Function(ProjectDetailsEditing value) editing,
    required TResult Function(ProjectDetailsConfirmDestructive value)
        confirmDestructive,
    required TResult Function(ProjectDetailsSaved value) saved,
    required TResult Function(ProjectDetailsDeleted value) deleted,
  }) {
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProjectDetailsCreating value)? creating,
    TResult Function(ProjectDetailsEditing value)? editing,
    TResult Function(ProjectDetailsConfirmDestructive value)?
        confirmDestructive,
    TResult Function(ProjectDetailsSaved value)? saved,
    TResult Function(ProjectDetailsDeleted value)? deleted,
  }) {
    return deleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectDetailsCreating value)? creating,
    TResult Function(ProjectDetailsEditing value)? editing,
    TResult Function(ProjectDetailsConfirmDestructive value)?
        confirmDestructive,
    TResult Function(ProjectDetailsSaved value)? saved,
    TResult Function(ProjectDetailsDeleted value)? deleted,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class ProjectDetailsDeleted implements ProjectDetailsState {
  const factory ProjectDetailsDeleted({required final Project project}) =
      _$ProjectDetailsDeleted;

  @override
  Project get project;
  @override
  @JsonKey(ignore: true)
  _$$ProjectDetailsDeletedCopyWith<_$ProjectDetailsDeleted> get copyWith =>
      throw _privateConstructorUsedError;
}
