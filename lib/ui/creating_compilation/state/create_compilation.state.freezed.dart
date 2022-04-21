// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_compilation.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CreateCompilationStateTearOff {
  const _$CreateCompilationStateTearOff();

  CreateCompilationPrepareExport prepareExport(
      {required String projectUid, required int? month}) {
    return CreateCompilationPrepareExport(
      projectUid: projectUid,
      month: month,
    );
  }

  CreateCompilationExporting exporting(
      {required String projectUid,
      required int? month,
      required LoadingValue<dynamic> exportProgress}) {
    return CreateCompilationExporting(
      projectUid: projectUid,
      month: month,
      exportProgress: exportProgress,
    );
  }

  CreateCompilationExportSuccess exportSuccess(
      {required String projectUid,
      required int? month,
      required SavedCompilation savedCompilation,
      required File file,
      required VideoPlayerController videoController}) {
    return CreateCompilationExportSuccess(
      projectUid: projectUid,
      month: month,
      savedCompilation: savedCompilation,
      file: file,
      videoController: videoController,
    );
  }

  CreateCompilationExportFailed exportFailed(
      {required String projectUid, int? month}) {
    return CreateCompilationExportFailed(
      projectUid: projectUid,
      month: month,
    );
  }
}

/// @nodoc
const $CreateCompilationState = _$CreateCompilationStateTearOff();

/// @nodoc
mixin _$CreateCompilationState {
  String get projectUid => throw _privateConstructorUsedError;
  int? get month => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectUid, int? month) prepareExport,
    required TResult Function(
            String projectUid, int? month, LoadingValue<dynamic> exportProgress)
        exporting,
    required TResult Function(
            String projectUid,
            int? month,
            SavedCompilation savedCompilation,
            File file,
            VideoPlayerController videoController)
        exportSuccess,
    required TResult Function(String projectUid, int? month) exportFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String projectUid, int? month)? prepareExport,
    TResult Function(String projectUid, int? month,
            LoadingValue<dynamic> exportProgress)?
        exporting,
    TResult Function(
            String projectUid,
            int? month,
            SavedCompilation savedCompilation,
            File file,
            VideoPlayerController videoController)?
        exportSuccess,
    TResult Function(String projectUid, int? month)? exportFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectUid, int? month)? prepareExport,
    TResult Function(String projectUid, int? month,
            LoadingValue<dynamic> exportProgress)?
        exporting,
    TResult Function(
            String projectUid,
            int? month,
            SavedCompilation savedCompilation,
            File file,
            VideoPlayerController videoController)?
        exportSuccess,
    TResult Function(String projectUid, int? month)? exportFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateCompilationPrepareExport value)
        prepareExport,
    required TResult Function(CreateCompilationExporting value) exporting,
    required TResult Function(CreateCompilationExportSuccess value)
        exportSuccess,
    required TResult Function(CreateCompilationExportFailed value) exportFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateCompilationPrepareExport value)? prepareExport,
    TResult Function(CreateCompilationExporting value)? exporting,
    TResult Function(CreateCompilationExportSuccess value)? exportSuccess,
    TResult Function(CreateCompilationExportFailed value)? exportFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateCompilationPrepareExport value)? prepareExport,
    TResult Function(CreateCompilationExporting value)? exporting,
    TResult Function(CreateCompilationExportSuccess value)? exportSuccess,
    TResult Function(CreateCompilationExportFailed value)? exportFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateCompilationStateCopyWith<CreateCompilationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCompilationStateCopyWith<$Res> {
  factory $CreateCompilationStateCopyWith(CreateCompilationState value,
          $Res Function(CreateCompilationState) then) =
      _$CreateCompilationStateCopyWithImpl<$Res>;
  $Res call({String projectUid, int? month});
}

/// @nodoc
class _$CreateCompilationStateCopyWithImpl<$Res>
    implements $CreateCompilationStateCopyWith<$Res> {
  _$CreateCompilationStateCopyWithImpl(this._value, this._then);

  final CreateCompilationState _value;
  // ignore: unused_field
  final $Res Function(CreateCompilationState) _then;

  @override
  $Res call({
    Object? projectUid = freezed,
    Object? month = freezed,
  }) {
    return _then(_value.copyWith(
      projectUid: projectUid == freezed
          ? _value.projectUid
          : projectUid // ignore: cast_nullable_to_non_nullable
              as String,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class $CreateCompilationPrepareExportCopyWith<$Res>
    implements $CreateCompilationStateCopyWith<$Res> {
  factory $CreateCompilationPrepareExportCopyWith(
          CreateCompilationPrepareExport value,
          $Res Function(CreateCompilationPrepareExport) then) =
      _$CreateCompilationPrepareExportCopyWithImpl<$Res>;
  @override
  $Res call({String projectUid, int? month});
}

/// @nodoc
class _$CreateCompilationPrepareExportCopyWithImpl<$Res>
    extends _$CreateCompilationStateCopyWithImpl<$Res>
    implements $CreateCompilationPrepareExportCopyWith<$Res> {
  _$CreateCompilationPrepareExportCopyWithImpl(
      CreateCompilationPrepareExport _value,
      $Res Function(CreateCompilationPrepareExport) _then)
      : super(_value, (v) => _then(v as CreateCompilationPrepareExport));

  @override
  CreateCompilationPrepareExport get _value =>
      super._value as CreateCompilationPrepareExport;

  @override
  $Res call({
    Object? projectUid = freezed,
    Object? month = freezed,
  }) {
    return _then(CreateCompilationPrepareExport(
      projectUid: projectUid == freezed
          ? _value.projectUid
          : projectUid // ignore: cast_nullable_to_non_nullable
              as String,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$CreateCompilationPrepareExport
    implements CreateCompilationPrepareExport {
  const _$CreateCompilationPrepareExport(
      {required this.projectUid, required this.month});

  @override
  final String projectUid;
  @override
  final int? month;

  @override
  String toString() {
    return 'CreateCompilationState.prepareExport(projectUid: $projectUid, month: $month)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateCompilationPrepareExport &&
            const DeepCollectionEquality()
                .equals(other.projectUid, projectUid) &&
            const DeepCollectionEquality().equals(other.month, month));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(projectUid),
      const DeepCollectionEquality().hash(month));

  @JsonKey(ignore: true)
  @override
  $CreateCompilationPrepareExportCopyWith<CreateCompilationPrepareExport>
      get copyWith => _$CreateCompilationPrepareExportCopyWithImpl<
          CreateCompilationPrepareExport>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectUid, int? month) prepareExport,
    required TResult Function(
            String projectUid, int? month, LoadingValue<dynamic> exportProgress)
        exporting,
    required TResult Function(
            String projectUid,
            int? month,
            SavedCompilation savedCompilation,
            File file,
            VideoPlayerController videoController)
        exportSuccess,
    required TResult Function(String projectUid, int? month) exportFailed,
  }) {
    return prepareExport(projectUid, month);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String projectUid, int? month)? prepareExport,
    TResult Function(String projectUid, int? month,
            LoadingValue<dynamic> exportProgress)?
        exporting,
    TResult Function(
            String projectUid,
            int? month,
            SavedCompilation savedCompilation,
            File file,
            VideoPlayerController videoController)?
        exportSuccess,
    TResult Function(String projectUid, int? month)? exportFailed,
  }) {
    return prepareExport?.call(projectUid, month);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectUid, int? month)? prepareExport,
    TResult Function(String projectUid, int? month,
            LoadingValue<dynamic> exportProgress)?
        exporting,
    TResult Function(
            String projectUid,
            int? month,
            SavedCompilation savedCompilation,
            File file,
            VideoPlayerController videoController)?
        exportSuccess,
    TResult Function(String projectUid, int? month)? exportFailed,
    required TResult orElse(),
  }) {
    if (prepareExport != null) {
      return prepareExport(projectUid, month);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateCompilationPrepareExport value)
        prepareExport,
    required TResult Function(CreateCompilationExporting value) exporting,
    required TResult Function(CreateCompilationExportSuccess value)
        exportSuccess,
    required TResult Function(CreateCompilationExportFailed value) exportFailed,
  }) {
    return prepareExport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateCompilationPrepareExport value)? prepareExport,
    TResult Function(CreateCompilationExporting value)? exporting,
    TResult Function(CreateCompilationExportSuccess value)? exportSuccess,
    TResult Function(CreateCompilationExportFailed value)? exportFailed,
  }) {
    return prepareExport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateCompilationPrepareExport value)? prepareExport,
    TResult Function(CreateCompilationExporting value)? exporting,
    TResult Function(CreateCompilationExportSuccess value)? exportSuccess,
    TResult Function(CreateCompilationExportFailed value)? exportFailed,
    required TResult orElse(),
  }) {
    if (prepareExport != null) {
      return prepareExport(this);
    }
    return orElse();
  }
}

abstract class CreateCompilationPrepareExport
    implements CreateCompilationState {
  const factory CreateCompilationPrepareExport(
      {required String projectUid,
      required int? month}) = _$CreateCompilationPrepareExport;

  @override
  String get projectUid;
  @override
  int? get month;
  @override
  @JsonKey(ignore: true)
  $CreateCompilationPrepareExportCopyWith<CreateCompilationPrepareExport>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCompilationExportingCopyWith<$Res>
    implements $CreateCompilationStateCopyWith<$Res> {
  factory $CreateCompilationExportingCopyWith(CreateCompilationExporting value,
          $Res Function(CreateCompilationExporting) then) =
      _$CreateCompilationExportingCopyWithImpl<$Res>;
  @override
  $Res call(
      {String projectUid, int? month, LoadingValue<dynamic> exportProgress});
}

/// @nodoc
class _$CreateCompilationExportingCopyWithImpl<$Res>
    extends _$CreateCompilationStateCopyWithImpl<$Res>
    implements $CreateCompilationExportingCopyWith<$Res> {
  _$CreateCompilationExportingCopyWithImpl(CreateCompilationExporting _value,
      $Res Function(CreateCompilationExporting) _then)
      : super(_value, (v) => _then(v as CreateCompilationExporting));

  @override
  CreateCompilationExporting get _value =>
      super._value as CreateCompilationExporting;

  @override
  $Res call({
    Object? projectUid = freezed,
    Object? month = freezed,
    Object? exportProgress = freezed,
  }) {
    return _then(CreateCompilationExporting(
      projectUid: projectUid == freezed
          ? _value.projectUid
          : projectUid // ignore: cast_nullable_to_non_nullable
              as String,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      exportProgress: exportProgress == freezed
          ? _value.exportProgress
          : exportProgress // ignore: cast_nullable_to_non_nullable
              as LoadingValue<dynamic>,
    ));
  }
}

/// @nodoc

class _$CreateCompilationExporting implements CreateCompilationExporting {
  const _$CreateCompilationExporting(
      {required this.projectUid,
      required this.month,
      required this.exportProgress});

  @override
  final String projectUid;
  @override
  final int? month;
  @override
  final LoadingValue<dynamic> exportProgress;

  @override
  String toString() {
    return 'CreateCompilationState.exporting(projectUid: $projectUid, month: $month, exportProgress: $exportProgress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateCompilationExporting &&
            const DeepCollectionEquality()
                .equals(other.projectUid, projectUid) &&
            const DeepCollectionEquality().equals(other.month, month) &&
            const DeepCollectionEquality()
                .equals(other.exportProgress, exportProgress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(projectUid),
      const DeepCollectionEquality().hash(month),
      const DeepCollectionEquality().hash(exportProgress));

  @JsonKey(ignore: true)
  @override
  $CreateCompilationExportingCopyWith<CreateCompilationExporting>
      get copyWith =>
          _$CreateCompilationExportingCopyWithImpl<CreateCompilationExporting>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectUid, int? month) prepareExport,
    required TResult Function(
            String projectUid, int? month, LoadingValue<dynamic> exportProgress)
        exporting,
    required TResult Function(
            String projectUid,
            int? month,
            SavedCompilation savedCompilation,
            File file,
            VideoPlayerController videoController)
        exportSuccess,
    required TResult Function(String projectUid, int? month) exportFailed,
  }) {
    return exporting(projectUid, month, exportProgress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String projectUid, int? month)? prepareExport,
    TResult Function(String projectUid, int? month,
            LoadingValue<dynamic> exportProgress)?
        exporting,
    TResult Function(
            String projectUid,
            int? month,
            SavedCompilation savedCompilation,
            File file,
            VideoPlayerController videoController)?
        exportSuccess,
    TResult Function(String projectUid, int? month)? exportFailed,
  }) {
    return exporting?.call(projectUid, month, exportProgress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectUid, int? month)? prepareExport,
    TResult Function(String projectUid, int? month,
            LoadingValue<dynamic> exportProgress)?
        exporting,
    TResult Function(
            String projectUid,
            int? month,
            SavedCompilation savedCompilation,
            File file,
            VideoPlayerController videoController)?
        exportSuccess,
    TResult Function(String projectUid, int? month)? exportFailed,
    required TResult orElse(),
  }) {
    if (exporting != null) {
      return exporting(projectUid, month, exportProgress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateCompilationPrepareExport value)
        prepareExport,
    required TResult Function(CreateCompilationExporting value) exporting,
    required TResult Function(CreateCompilationExportSuccess value)
        exportSuccess,
    required TResult Function(CreateCompilationExportFailed value) exportFailed,
  }) {
    return exporting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateCompilationPrepareExport value)? prepareExport,
    TResult Function(CreateCompilationExporting value)? exporting,
    TResult Function(CreateCompilationExportSuccess value)? exportSuccess,
    TResult Function(CreateCompilationExportFailed value)? exportFailed,
  }) {
    return exporting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateCompilationPrepareExport value)? prepareExport,
    TResult Function(CreateCompilationExporting value)? exporting,
    TResult Function(CreateCompilationExportSuccess value)? exportSuccess,
    TResult Function(CreateCompilationExportFailed value)? exportFailed,
    required TResult orElse(),
  }) {
    if (exporting != null) {
      return exporting(this);
    }
    return orElse();
  }
}

abstract class CreateCompilationExporting implements CreateCompilationState {
  const factory CreateCompilationExporting(
          {required String projectUid,
          required int? month,
          required LoadingValue<dynamic> exportProgress}) =
      _$CreateCompilationExporting;

  @override
  String get projectUid;
  @override
  int? get month;
  LoadingValue<dynamic> get exportProgress;
  @override
  @JsonKey(ignore: true)
  $CreateCompilationExportingCopyWith<CreateCompilationExporting>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCompilationExportSuccessCopyWith<$Res>
    implements $CreateCompilationStateCopyWith<$Res> {
  factory $CreateCompilationExportSuccessCopyWith(
          CreateCompilationExportSuccess value,
          $Res Function(CreateCompilationExportSuccess) then) =
      _$CreateCompilationExportSuccessCopyWithImpl<$Res>;
  @override
  $Res call(
      {String projectUid,
      int? month,
      SavedCompilation savedCompilation,
      File file,
      VideoPlayerController videoController});
}

/// @nodoc
class _$CreateCompilationExportSuccessCopyWithImpl<$Res>
    extends _$CreateCompilationStateCopyWithImpl<$Res>
    implements $CreateCompilationExportSuccessCopyWith<$Res> {
  _$CreateCompilationExportSuccessCopyWithImpl(
      CreateCompilationExportSuccess _value,
      $Res Function(CreateCompilationExportSuccess) _then)
      : super(_value, (v) => _then(v as CreateCompilationExportSuccess));

  @override
  CreateCompilationExportSuccess get _value =>
      super._value as CreateCompilationExportSuccess;

  @override
  $Res call({
    Object? projectUid = freezed,
    Object? month = freezed,
    Object? savedCompilation = freezed,
    Object? file = freezed,
    Object? videoController = freezed,
  }) {
    return _then(CreateCompilationExportSuccess(
      projectUid: projectUid == freezed
          ? _value.projectUid
          : projectUid // ignore: cast_nullable_to_non_nullable
              as String,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      savedCompilation: savedCompilation == freezed
          ? _value.savedCompilation
          : savedCompilation // ignore: cast_nullable_to_non_nullable
              as SavedCompilation,
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      videoController: videoController == freezed
          ? _value.videoController
          : videoController // ignore: cast_nullable_to_non_nullable
              as VideoPlayerController,
    ));
  }
}

/// @nodoc

class _$CreateCompilationExportSuccess
    implements CreateCompilationExportSuccess {
  const _$CreateCompilationExportSuccess(
      {required this.projectUid,
      required this.month,
      required this.savedCompilation,
      required this.file,
      required this.videoController});

  @override
  final String projectUid;
  @override
  final int? month;
  @override
  final SavedCompilation savedCompilation;
  @override
  final File file;
  @override
  final VideoPlayerController videoController;

  @override
  String toString() {
    return 'CreateCompilationState.exportSuccess(projectUid: $projectUid, month: $month, savedCompilation: $savedCompilation, file: $file, videoController: $videoController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateCompilationExportSuccess &&
            const DeepCollectionEquality()
                .equals(other.projectUid, projectUid) &&
            const DeepCollectionEquality().equals(other.month, month) &&
            const DeepCollectionEquality()
                .equals(other.savedCompilation, savedCompilation) &&
            const DeepCollectionEquality().equals(other.file, file) &&
            const DeepCollectionEquality()
                .equals(other.videoController, videoController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(projectUid),
      const DeepCollectionEquality().hash(month),
      const DeepCollectionEquality().hash(savedCompilation),
      const DeepCollectionEquality().hash(file),
      const DeepCollectionEquality().hash(videoController));

  @JsonKey(ignore: true)
  @override
  $CreateCompilationExportSuccessCopyWith<CreateCompilationExportSuccess>
      get copyWith => _$CreateCompilationExportSuccessCopyWithImpl<
          CreateCompilationExportSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectUid, int? month) prepareExport,
    required TResult Function(
            String projectUid, int? month, LoadingValue<dynamic> exportProgress)
        exporting,
    required TResult Function(
            String projectUid,
            int? month,
            SavedCompilation savedCompilation,
            File file,
            VideoPlayerController videoController)
        exportSuccess,
    required TResult Function(String projectUid, int? month) exportFailed,
  }) {
    return exportSuccess(
        projectUid, month, savedCompilation, file, videoController);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String projectUid, int? month)? prepareExport,
    TResult Function(String projectUid, int? month,
            LoadingValue<dynamic> exportProgress)?
        exporting,
    TResult Function(
            String projectUid,
            int? month,
            SavedCompilation savedCompilation,
            File file,
            VideoPlayerController videoController)?
        exportSuccess,
    TResult Function(String projectUid, int? month)? exportFailed,
  }) {
    return exportSuccess?.call(
        projectUid, month, savedCompilation, file, videoController);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectUid, int? month)? prepareExport,
    TResult Function(String projectUid, int? month,
            LoadingValue<dynamic> exportProgress)?
        exporting,
    TResult Function(
            String projectUid,
            int? month,
            SavedCompilation savedCompilation,
            File file,
            VideoPlayerController videoController)?
        exportSuccess,
    TResult Function(String projectUid, int? month)? exportFailed,
    required TResult orElse(),
  }) {
    if (exportSuccess != null) {
      return exportSuccess(
          projectUid, month, savedCompilation, file, videoController);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateCompilationPrepareExport value)
        prepareExport,
    required TResult Function(CreateCompilationExporting value) exporting,
    required TResult Function(CreateCompilationExportSuccess value)
        exportSuccess,
    required TResult Function(CreateCompilationExportFailed value) exportFailed,
  }) {
    return exportSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateCompilationPrepareExport value)? prepareExport,
    TResult Function(CreateCompilationExporting value)? exporting,
    TResult Function(CreateCompilationExportSuccess value)? exportSuccess,
    TResult Function(CreateCompilationExportFailed value)? exportFailed,
  }) {
    return exportSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateCompilationPrepareExport value)? prepareExport,
    TResult Function(CreateCompilationExporting value)? exporting,
    TResult Function(CreateCompilationExportSuccess value)? exportSuccess,
    TResult Function(CreateCompilationExportFailed value)? exportFailed,
    required TResult orElse(),
  }) {
    if (exportSuccess != null) {
      return exportSuccess(this);
    }
    return orElse();
  }
}

abstract class CreateCompilationExportSuccess
    implements CreateCompilationState {
  const factory CreateCompilationExportSuccess(
          {required String projectUid,
          required int? month,
          required SavedCompilation savedCompilation,
          required File file,
          required VideoPlayerController videoController}) =
      _$CreateCompilationExportSuccess;

  @override
  String get projectUid;
  @override
  int? get month;
  SavedCompilation get savedCompilation;
  File get file;
  VideoPlayerController get videoController;
  @override
  @JsonKey(ignore: true)
  $CreateCompilationExportSuccessCopyWith<CreateCompilationExportSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCompilationExportFailedCopyWith<$Res>
    implements $CreateCompilationStateCopyWith<$Res> {
  factory $CreateCompilationExportFailedCopyWith(
          CreateCompilationExportFailed value,
          $Res Function(CreateCompilationExportFailed) then) =
      _$CreateCompilationExportFailedCopyWithImpl<$Res>;
  @override
  $Res call({String projectUid, int? month});
}

/// @nodoc
class _$CreateCompilationExportFailedCopyWithImpl<$Res>
    extends _$CreateCompilationStateCopyWithImpl<$Res>
    implements $CreateCompilationExportFailedCopyWith<$Res> {
  _$CreateCompilationExportFailedCopyWithImpl(
      CreateCompilationExportFailed _value,
      $Res Function(CreateCompilationExportFailed) _then)
      : super(_value, (v) => _then(v as CreateCompilationExportFailed));

  @override
  CreateCompilationExportFailed get _value =>
      super._value as CreateCompilationExportFailed;

  @override
  $Res call({
    Object? projectUid = freezed,
    Object? month = freezed,
  }) {
    return _then(CreateCompilationExportFailed(
      projectUid: projectUid == freezed
          ? _value.projectUid
          : projectUid // ignore: cast_nullable_to_non_nullable
              as String,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$CreateCompilationExportFailed implements CreateCompilationExportFailed {
  const _$CreateCompilationExportFailed({required this.projectUid, this.month});

  @override
  final String projectUid;
  @override
  final int? month;

  @override
  String toString() {
    return 'CreateCompilationState.exportFailed(projectUid: $projectUid, month: $month)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateCompilationExportFailed &&
            const DeepCollectionEquality()
                .equals(other.projectUid, projectUid) &&
            const DeepCollectionEquality().equals(other.month, month));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(projectUid),
      const DeepCollectionEquality().hash(month));

  @JsonKey(ignore: true)
  @override
  $CreateCompilationExportFailedCopyWith<CreateCompilationExportFailed>
      get copyWith => _$CreateCompilationExportFailedCopyWithImpl<
          CreateCompilationExportFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectUid, int? month) prepareExport,
    required TResult Function(
            String projectUid, int? month, LoadingValue<dynamic> exportProgress)
        exporting,
    required TResult Function(
            String projectUid,
            int? month,
            SavedCompilation savedCompilation,
            File file,
            VideoPlayerController videoController)
        exportSuccess,
    required TResult Function(String projectUid, int? month) exportFailed,
  }) {
    return exportFailed(projectUid, month);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String projectUid, int? month)? prepareExport,
    TResult Function(String projectUid, int? month,
            LoadingValue<dynamic> exportProgress)?
        exporting,
    TResult Function(
            String projectUid,
            int? month,
            SavedCompilation savedCompilation,
            File file,
            VideoPlayerController videoController)?
        exportSuccess,
    TResult Function(String projectUid, int? month)? exportFailed,
  }) {
    return exportFailed?.call(projectUid, month);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectUid, int? month)? prepareExport,
    TResult Function(String projectUid, int? month,
            LoadingValue<dynamic> exportProgress)?
        exporting,
    TResult Function(
            String projectUid,
            int? month,
            SavedCompilation savedCompilation,
            File file,
            VideoPlayerController videoController)?
        exportSuccess,
    TResult Function(String projectUid, int? month)? exportFailed,
    required TResult orElse(),
  }) {
    if (exportFailed != null) {
      return exportFailed(projectUid, month);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateCompilationPrepareExport value)
        prepareExport,
    required TResult Function(CreateCompilationExporting value) exporting,
    required TResult Function(CreateCompilationExportSuccess value)
        exportSuccess,
    required TResult Function(CreateCompilationExportFailed value) exportFailed,
  }) {
    return exportFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateCompilationPrepareExport value)? prepareExport,
    TResult Function(CreateCompilationExporting value)? exporting,
    TResult Function(CreateCompilationExportSuccess value)? exportSuccess,
    TResult Function(CreateCompilationExportFailed value)? exportFailed,
  }) {
    return exportFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateCompilationPrepareExport value)? prepareExport,
    TResult Function(CreateCompilationExporting value)? exporting,
    TResult Function(CreateCompilationExportSuccess value)? exportSuccess,
    TResult Function(CreateCompilationExportFailed value)? exportFailed,
    required TResult orElse(),
  }) {
    if (exportFailed != null) {
      return exportFailed(this);
    }
    return orElse();
  }
}

abstract class CreateCompilationExportFailed implements CreateCompilationState {
  const factory CreateCompilationExportFailed(
      {required String projectUid,
      int? month}) = _$CreateCompilationExportFailed;

  @override
  String get projectUid;
  @override
  int? get month;
  @override
  @JsonKey(ignore: true)
  $CreateCompilationExportFailedCopyWith<CreateCompilationExportFailed>
      get copyWith => throw _privateConstructorUsedError;
}
