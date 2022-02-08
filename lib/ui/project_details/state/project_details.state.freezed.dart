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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProjectDetailsStateTearOff {
  const _$ProjectDetailsStateTearOff();

  ProjectDetailsCreating creating({required Project project}) {
    return ProjectDetailsCreating(
      project: project,
    );
  }

  ProjectDetailsEditing editing({required Project project}) {
    return ProjectDetailsEditing(
      project: project,
    );
  }

  ProjectDetailsConfirmDestructive confirmDestructive(
      {required Project project}) {
    return ProjectDetailsConfirmDestructive(
      project: project,
    );
  }

  ProjectDetailsSaved saved({required Project project}) {
    return ProjectDetailsSaved(
      project: project,
    );
  }

  ProjectDetailsDeleted deleted({required Project project}) {
    return ProjectDetailsDeleted(
      project: project,
    );
  }
}

/// @nodoc
const $ProjectDetailsState = _$ProjectDetailsStateTearOff();

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
abstract class $ProjectDetailsCreatingCopyWith<$Res>
    implements $ProjectDetailsStateCopyWith<$Res> {
  factory $ProjectDetailsCreatingCopyWith(ProjectDetailsCreating value,
          $Res Function(ProjectDetailsCreating) then) =
      _$ProjectDetailsCreatingCopyWithImpl<$Res>;
  @override
  $Res call({Project project});

  @override
  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class _$ProjectDetailsCreatingCopyWithImpl<$Res>
    extends _$ProjectDetailsStateCopyWithImpl<$Res>
    implements $ProjectDetailsCreatingCopyWith<$Res> {
  _$ProjectDetailsCreatingCopyWithImpl(ProjectDetailsCreating _value,
      $Res Function(ProjectDetailsCreating) _then)
      : super(_value, (v) => _then(v as ProjectDetailsCreating));

  @override
  ProjectDetailsCreating get _value => super._value as ProjectDetailsCreating;

  @override
  $Res call({
    Object? project = freezed,
  }) {
    return _then(ProjectDetailsCreating(
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
            other is ProjectDetailsCreating &&
            const DeepCollectionEquality().equals(other.project, project));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(project));

  @JsonKey(ignore: true)
  @override
  $ProjectDetailsCreatingCopyWith<ProjectDetailsCreating> get copyWith =>
      _$ProjectDetailsCreatingCopyWithImpl<ProjectDetailsCreating>(
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
  const factory ProjectDetailsCreating({required Project project}) =
      _$ProjectDetailsCreating;

  @override
  Project get project;
  @override
  @JsonKey(ignore: true)
  $ProjectDetailsCreatingCopyWith<ProjectDetailsCreating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectDetailsEditingCopyWith<$Res>
    implements $ProjectDetailsStateCopyWith<$Res> {
  factory $ProjectDetailsEditingCopyWith(ProjectDetailsEditing value,
          $Res Function(ProjectDetailsEditing) then) =
      _$ProjectDetailsEditingCopyWithImpl<$Res>;
  @override
  $Res call({Project project});

  @override
  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class _$ProjectDetailsEditingCopyWithImpl<$Res>
    extends _$ProjectDetailsStateCopyWithImpl<$Res>
    implements $ProjectDetailsEditingCopyWith<$Res> {
  _$ProjectDetailsEditingCopyWithImpl(
      ProjectDetailsEditing _value, $Res Function(ProjectDetailsEditing) _then)
      : super(_value, (v) => _then(v as ProjectDetailsEditing));

  @override
  ProjectDetailsEditing get _value => super._value as ProjectDetailsEditing;

  @override
  $Res call({
    Object? project = freezed,
  }) {
    return _then(ProjectDetailsEditing(
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
            other is ProjectDetailsEditing &&
            const DeepCollectionEquality().equals(other.project, project));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(project));

  @JsonKey(ignore: true)
  @override
  $ProjectDetailsEditingCopyWith<ProjectDetailsEditing> get copyWith =>
      _$ProjectDetailsEditingCopyWithImpl<ProjectDetailsEditing>(
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
  const factory ProjectDetailsEditing({required Project project}) =
      _$ProjectDetailsEditing;

  @override
  Project get project;
  @override
  @JsonKey(ignore: true)
  $ProjectDetailsEditingCopyWith<ProjectDetailsEditing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectDetailsConfirmDestructiveCopyWith<$Res>
    implements $ProjectDetailsStateCopyWith<$Res> {
  factory $ProjectDetailsConfirmDestructiveCopyWith(
          ProjectDetailsConfirmDestructive value,
          $Res Function(ProjectDetailsConfirmDestructive) then) =
      _$ProjectDetailsConfirmDestructiveCopyWithImpl<$Res>;
  @override
  $Res call({Project project});

  @override
  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class _$ProjectDetailsConfirmDestructiveCopyWithImpl<$Res>
    extends _$ProjectDetailsStateCopyWithImpl<$Res>
    implements $ProjectDetailsConfirmDestructiveCopyWith<$Res> {
  _$ProjectDetailsConfirmDestructiveCopyWithImpl(
      ProjectDetailsConfirmDestructive _value,
      $Res Function(ProjectDetailsConfirmDestructive) _then)
      : super(_value, (v) => _then(v as ProjectDetailsConfirmDestructive));

  @override
  ProjectDetailsConfirmDestructive get _value =>
      super._value as ProjectDetailsConfirmDestructive;

  @override
  $Res call({
    Object? project = freezed,
  }) {
    return _then(ProjectDetailsConfirmDestructive(
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
            other is ProjectDetailsConfirmDestructive &&
            const DeepCollectionEquality().equals(other.project, project));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(project));

  @JsonKey(ignore: true)
  @override
  $ProjectDetailsConfirmDestructiveCopyWith<ProjectDetailsConfirmDestructive>
      get copyWith => _$ProjectDetailsConfirmDestructiveCopyWithImpl<
          ProjectDetailsConfirmDestructive>(this, _$identity);

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
  const factory ProjectDetailsConfirmDestructive({required Project project}) =
      _$ProjectDetailsConfirmDestructive;

  @override
  Project get project;
  @override
  @JsonKey(ignore: true)
  $ProjectDetailsConfirmDestructiveCopyWith<ProjectDetailsConfirmDestructive>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectDetailsSavedCopyWith<$Res>
    implements $ProjectDetailsStateCopyWith<$Res> {
  factory $ProjectDetailsSavedCopyWith(
          ProjectDetailsSaved value, $Res Function(ProjectDetailsSaved) then) =
      _$ProjectDetailsSavedCopyWithImpl<$Res>;
  @override
  $Res call({Project project});

  @override
  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class _$ProjectDetailsSavedCopyWithImpl<$Res>
    extends _$ProjectDetailsStateCopyWithImpl<$Res>
    implements $ProjectDetailsSavedCopyWith<$Res> {
  _$ProjectDetailsSavedCopyWithImpl(
      ProjectDetailsSaved _value, $Res Function(ProjectDetailsSaved) _then)
      : super(_value, (v) => _then(v as ProjectDetailsSaved));

  @override
  ProjectDetailsSaved get _value => super._value as ProjectDetailsSaved;

  @override
  $Res call({
    Object? project = freezed,
  }) {
    return _then(ProjectDetailsSaved(
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
            other is ProjectDetailsSaved &&
            const DeepCollectionEquality().equals(other.project, project));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(project));

  @JsonKey(ignore: true)
  @override
  $ProjectDetailsSavedCopyWith<ProjectDetailsSaved> get copyWith =>
      _$ProjectDetailsSavedCopyWithImpl<ProjectDetailsSaved>(this, _$identity);

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
  const factory ProjectDetailsSaved({required Project project}) =
      _$ProjectDetailsSaved;

  @override
  Project get project;
  @override
  @JsonKey(ignore: true)
  $ProjectDetailsSavedCopyWith<ProjectDetailsSaved> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectDetailsDeletedCopyWith<$Res>
    implements $ProjectDetailsStateCopyWith<$Res> {
  factory $ProjectDetailsDeletedCopyWith(ProjectDetailsDeleted value,
          $Res Function(ProjectDetailsDeleted) then) =
      _$ProjectDetailsDeletedCopyWithImpl<$Res>;
  @override
  $Res call({Project project});

  @override
  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class _$ProjectDetailsDeletedCopyWithImpl<$Res>
    extends _$ProjectDetailsStateCopyWithImpl<$Res>
    implements $ProjectDetailsDeletedCopyWith<$Res> {
  _$ProjectDetailsDeletedCopyWithImpl(
      ProjectDetailsDeleted _value, $Res Function(ProjectDetailsDeleted) _then)
      : super(_value, (v) => _then(v as ProjectDetailsDeleted));

  @override
  ProjectDetailsDeleted get _value => super._value as ProjectDetailsDeleted;

  @override
  $Res call({
    Object? project = freezed,
  }) {
    return _then(ProjectDetailsDeleted(
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
            other is ProjectDetailsDeleted &&
            const DeepCollectionEquality().equals(other.project, project));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(project));

  @JsonKey(ignore: true)
  @override
  $ProjectDetailsDeletedCopyWith<ProjectDetailsDeleted> get copyWith =>
      _$ProjectDetailsDeletedCopyWithImpl<ProjectDetailsDeleted>(
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
  const factory ProjectDetailsDeleted({required Project project}) =
      _$ProjectDetailsDeleted;

  @override
  Project get project;
  @override
  @JsonKey(ignore: true)
  $ProjectDetailsDeletedCopyWith<ProjectDetailsDeleted> get copyWith =>
      throw _privateConstructorUsedError;
}
