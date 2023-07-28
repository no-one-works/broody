// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_editor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VideoEditorState {
  double get dismissProgress => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AssetEntity assetEntity, double dismissProgress)
        loadingVideo,
    required TResult Function(AssetEntity assetEntity, double dismissProgress)
        failedToLoad,
    required TResult Function(
            AssetEntity assetEntity,
            VideoPlayerController videoController,
            EditingEntry entry,
            bool isPlaying,
            Duration seekPosition,
            double dismissProgress,
            bool previewing)
        editing,
    required TResult Function(EditingEntry entry,
            ProcessValue<dynamic> exportProgress, double dismissProgress)
        exporting,
    required TResult Function(SavedEntry entry, double dismissProgress)
        exportingSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AssetEntity assetEntity, double dismissProgress)?
        loadingVideo,
    TResult? Function(AssetEntity assetEntity, double dismissProgress)?
        failedToLoad,
    TResult? Function(
            AssetEntity assetEntity,
            VideoPlayerController videoController,
            EditingEntry entry,
            bool isPlaying,
            Duration seekPosition,
            double dismissProgress,
            bool previewing)?
        editing,
    TResult? Function(EditingEntry entry, ProcessValue<dynamic> exportProgress,
            double dismissProgress)?
        exporting,
    TResult? Function(SavedEntry entry, double dismissProgress)?
        exportingSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AssetEntity assetEntity, double dismissProgress)?
        loadingVideo,
    TResult Function(AssetEntity assetEntity, double dismissProgress)?
        failedToLoad,
    TResult Function(
            AssetEntity assetEntity,
            VideoPlayerController videoController,
            EditingEntry entry,
            bool isPlaying,
            Duration seekPosition,
            double dismissProgress,
            bool previewing)?
        editing,
    TResult Function(EditingEntry entry, ProcessValue<dynamic> exportProgress,
            double dismissProgress)?
        exporting,
    TResult Function(SavedEntry entry, double dismissProgress)?
        exportingSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoEditorLoadingVideo value) loadingVideo,
    required TResult Function(VideoEditorFailedToLoad value) failedToLoad,
    required TResult Function(VideoEditorEditing value) editing,
    required TResult Function(VideoEditorExporting value) exporting,
    required TResult Function(VideoEditorExportingSuccess value)
        exportingSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VideoEditorLoadingVideo value)? loadingVideo,
    TResult? Function(VideoEditorFailedToLoad value)? failedToLoad,
    TResult? Function(VideoEditorEditing value)? editing,
    TResult? Function(VideoEditorExporting value)? exporting,
    TResult? Function(VideoEditorExportingSuccess value)? exportingSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoEditorLoadingVideo value)? loadingVideo,
    TResult Function(VideoEditorFailedToLoad value)? failedToLoad,
    TResult Function(VideoEditorEditing value)? editing,
    TResult Function(VideoEditorExporting value)? exporting,
    TResult Function(VideoEditorExportingSuccess value)? exportingSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VideoEditorStateCopyWith<VideoEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoEditorStateCopyWith<$Res> {
  factory $VideoEditorStateCopyWith(
          VideoEditorState value, $Res Function(VideoEditorState) then) =
      _$VideoEditorStateCopyWithImpl<$Res, VideoEditorState>;
  @useResult
  $Res call({double dismissProgress});
}

/// @nodoc
class _$VideoEditorStateCopyWithImpl<$Res, $Val extends VideoEditorState>
    implements $VideoEditorStateCopyWith<$Res> {
  _$VideoEditorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dismissProgress = null,
  }) {
    return _then(_value.copyWith(
      dismissProgress: null == dismissProgress
          ? _value.dismissProgress
          : dismissProgress // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoEditorLoadingVideoCopyWith<$Res>
    implements $VideoEditorStateCopyWith<$Res> {
  factory _$$VideoEditorLoadingVideoCopyWith(_$VideoEditorLoadingVideo value,
          $Res Function(_$VideoEditorLoadingVideo) then) =
      __$$VideoEditorLoadingVideoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AssetEntity assetEntity, double dismissProgress});
}

/// @nodoc
class __$$VideoEditorLoadingVideoCopyWithImpl<$Res>
    extends _$VideoEditorStateCopyWithImpl<$Res, _$VideoEditorLoadingVideo>
    implements _$$VideoEditorLoadingVideoCopyWith<$Res> {
  __$$VideoEditorLoadingVideoCopyWithImpl(_$VideoEditorLoadingVideo _value,
      $Res Function(_$VideoEditorLoadingVideo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetEntity = null,
    Object? dismissProgress = null,
  }) {
    return _then(_$VideoEditorLoadingVideo(
      assetEntity: null == assetEntity
          ? _value.assetEntity
          : assetEntity // ignore: cast_nullable_to_non_nullable
              as AssetEntity,
      dismissProgress: null == dismissProgress
          ? _value.dismissProgress
          : dismissProgress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$VideoEditorLoadingVideo implements VideoEditorLoadingVideo {
  const _$VideoEditorLoadingVideo(
      {required this.assetEntity, this.dismissProgress = 0.0});

  @override
  final AssetEntity assetEntity;
  @override
  @JsonKey()
  final double dismissProgress;

  @override
  String toString() {
    return 'VideoEditorState.loadingVideo(assetEntity: $assetEntity, dismissProgress: $dismissProgress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoEditorLoadingVideo &&
            (identical(other.assetEntity, assetEntity) ||
                other.assetEntity == assetEntity) &&
            (identical(other.dismissProgress, dismissProgress) ||
                other.dismissProgress == dismissProgress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, assetEntity, dismissProgress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoEditorLoadingVideoCopyWith<_$VideoEditorLoadingVideo> get copyWith =>
      __$$VideoEditorLoadingVideoCopyWithImpl<_$VideoEditorLoadingVideo>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AssetEntity assetEntity, double dismissProgress)
        loadingVideo,
    required TResult Function(AssetEntity assetEntity, double dismissProgress)
        failedToLoad,
    required TResult Function(
            AssetEntity assetEntity,
            VideoPlayerController videoController,
            EditingEntry entry,
            bool isPlaying,
            Duration seekPosition,
            double dismissProgress,
            bool previewing)
        editing,
    required TResult Function(EditingEntry entry,
            ProcessValue<dynamic> exportProgress, double dismissProgress)
        exporting,
    required TResult Function(SavedEntry entry, double dismissProgress)
        exportingSuccess,
  }) {
    return loadingVideo(assetEntity, dismissProgress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AssetEntity assetEntity, double dismissProgress)?
        loadingVideo,
    TResult? Function(AssetEntity assetEntity, double dismissProgress)?
        failedToLoad,
    TResult? Function(
            AssetEntity assetEntity,
            VideoPlayerController videoController,
            EditingEntry entry,
            bool isPlaying,
            Duration seekPosition,
            double dismissProgress,
            bool previewing)?
        editing,
    TResult? Function(EditingEntry entry, ProcessValue<dynamic> exportProgress,
            double dismissProgress)?
        exporting,
    TResult? Function(SavedEntry entry, double dismissProgress)?
        exportingSuccess,
  }) {
    return loadingVideo?.call(assetEntity, dismissProgress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AssetEntity assetEntity, double dismissProgress)?
        loadingVideo,
    TResult Function(AssetEntity assetEntity, double dismissProgress)?
        failedToLoad,
    TResult Function(
            AssetEntity assetEntity,
            VideoPlayerController videoController,
            EditingEntry entry,
            bool isPlaying,
            Duration seekPosition,
            double dismissProgress,
            bool previewing)?
        editing,
    TResult Function(EditingEntry entry, ProcessValue<dynamic> exportProgress,
            double dismissProgress)?
        exporting,
    TResult Function(SavedEntry entry, double dismissProgress)?
        exportingSuccess,
    required TResult orElse(),
  }) {
    if (loadingVideo != null) {
      return loadingVideo(assetEntity, dismissProgress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoEditorLoadingVideo value) loadingVideo,
    required TResult Function(VideoEditorFailedToLoad value) failedToLoad,
    required TResult Function(VideoEditorEditing value) editing,
    required TResult Function(VideoEditorExporting value) exporting,
    required TResult Function(VideoEditorExportingSuccess value)
        exportingSuccess,
  }) {
    return loadingVideo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VideoEditorLoadingVideo value)? loadingVideo,
    TResult? Function(VideoEditorFailedToLoad value)? failedToLoad,
    TResult? Function(VideoEditorEditing value)? editing,
    TResult? Function(VideoEditorExporting value)? exporting,
    TResult? Function(VideoEditorExportingSuccess value)? exportingSuccess,
  }) {
    return loadingVideo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoEditorLoadingVideo value)? loadingVideo,
    TResult Function(VideoEditorFailedToLoad value)? failedToLoad,
    TResult Function(VideoEditorEditing value)? editing,
    TResult Function(VideoEditorExporting value)? exporting,
    TResult Function(VideoEditorExportingSuccess value)? exportingSuccess,
    required TResult orElse(),
  }) {
    if (loadingVideo != null) {
      return loadingVideo(this);
    }
    return orElse();
  }
}

abstract class VideoEditorLoadingVideo implements VideoEditorState {
  const factory VideoEditorLoadingVideo(
      {required final AssetEntity assetEntity,
      final double dismissProgress}) = _$VideoEditorLoadingVideo;

  AssetEntity get assetEntity;
  @override
  double get dismissProgress;
  @override
  @JsonKey(ignore: true)
  _$$VideoEditorLoadingVideoCopyWith<_$VideoEditorLoadingVideo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VideoEditorFailedToLoadCopyWith<$Res>
    implements $VideoEditorStateCopyWith<$Res> {
  factory _$$VideoEditorFailedToLoadCopyWith(_$VideoEditorFailedToLoad value,
          $Res Function(_$VideoEditorFailedToLoad) then) =
      __$$VideoEditorFailedToLoadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AssetEntity assetEntity, double dismissProgress});
}

/// @nodoc
class __$$VideoEditorFailedToLoadCopyWithImpl<$Res>
    extends _$VideoEditorStateCopyWithImpl<$Res, _$VideoEditorFailedToLoad>
    implements _$$VideoEditorFailedToLoadCopyWith<$Res> {
  __$$VideoEditorFailedToLoadCopyWithImpl(_$VideoEditorFailedToLoad _value,
      $Res Function(_$VideoEditorFailedToLoad) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetEntity = null,
    Object? dismissProgress = null,
  }) {
    return _then(_$VideoEditorFailedToLoad(
      assetEntity: null == assetEntity
          ? _value.assetEntity
          : assetEntity // ignore: cast_nullable_to_non_nullable
              as AssetEntity,
      dismissProgress: null == dismissProgress
          ? _value.dismissProgress
          : dismissProgress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$VideoEditorFailedToLoad implements VideoEditorFailedToLoad {
  const _$VideoEditorFailedToLoad(
      {required this.assetEntity, this.dismissProgress = 0.0});

  @override
  final AssetEntity assetEntity;
  @override
  @JsonKey()
  final double dismissProgress;

  @override
  String toString() {
    return 'VideoEditorState.failedToLoad(assetEntity: $assetEntity, dismissProgress: $dismissProgress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoEditorFailedToLoad &&
            (identical(other.assetEntity, assetEntity) ||
                other.assetEntity == assetEntity) &&
            (identical(other.dismissProgress, dismissProgress) ||
                other.dismissProgress == dismissProgress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, assetEntity, dismissProgress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoEditorFailedToLoadCopyWith<_$VideoEditorFailedToLoad> get copyWith =>
      __$$VideoEditorFailedToLoadCopyWithImpl<_$VideoEditorFailedToLoad>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AssetEntity assetEntity, double dismissProgress)
        loadingVideo,
    required TResult Function(AssetEntity assetEntity, double dismissProgress)
        failedToLoad,
    required TResult Function(
            AssetEntity assetEntity,
            VideoPlayerController videoController,
            EditingEntry entry,
            bool isPlaying,
            Duration seekPosition,
            double dismissProgress,
            bool previewing)
        editing,
    required TResult Function(EditingEntry entry,
            ProcessValue<dynamic> exportProgress, double dismissProgress)
        exporting,
    required TResult Function(SavedEntry entry, double dismissProgress)
        exportingSuccess,
  }) {
    return failedToLoad(assetEntity, dismissProgress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AssetEntity assetEntity, double dismissProgress)?
        loadingVideo,
    TResult? Function(AssetEntity assetEntity, double dismissProgress)?
        failedToLoad,
    TResult? Function(
            AssetEntity assetEntity,
            VideoPlayerController videoController,
            EditingEntry entry,
            bool isPlaying,
            Duration seekPosition,
            double dismissProgress,
            bool previewing)?
        editing,
    TResult? Function(EditingEntry entry, ProcessValue<dynamic> exportProgress,
            double dismissProgress)?
        exporting,
    TResult? Function(SavedEntry entry, double dismissProgress)?
        exportingSuccess,
  }) {
    return failedToLoad?.call(assetEntity, dismissProgress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AssetEntity assetEntity, double dismissProgress)?
        loadingVideo,
    TResult Function(AssetEntity assetEntity, double dismissProgress)?
        failedToLoad,
    TResult Function(
            AssetEntity assetEntity,
            VideoPlayerController videoController,
            EditingEntry entry,
            bool isPlaying,
            Duration seekPosition,
            double dismissProgress,
            bool previewing)?
        editing,
    TResult Function(EditingEntry entry, ProcessValue<dynamic> exportProgress,
            double dismissProgress)?
        exporting,
    TResult Function(SavedEntry entry, double dismissProgress)?
        exportingSuccess,
    required TResult orElse(),
  }) {
    if (failedToLoad != null) {
      return failedToLoad(assetEntity, dismissProgress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoEditorLoadingVideo value) loadingVideo,
    required TResult Function(VideoEditorFailedToLoad value) failedToLoad,
    required TResult Function(VideoEditorEditing value) editing,
    required TResult Function(VideoEditorExporting value) exporting,
    required TResult Function(VideoEditorExportingSuccess value)
        exportingSuccess,
  }) {
    return failedToLoad(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VideoEditorLoadingVideo value)? loadingVideo,
    TResult? Function(VideoEditorFailedToLoad value)? failedToLoad,
    TResult? Function(VideoEditorEditing value)? editing,
    TResult? Function(VideoEditorExporting value)? exporting,
    TResult? Function(VideoEditorExportingSuccess value)? exportingSuccess,
  }) {
    return failedToLoad?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoEditorLoadingVideo value)? loadingVideo,
    TResult Function(VideoEditorFailedToLoad value)? failedToLoad,
    TResult Function(VideoEditorEditing value)? editing,
    TResult Function(VideoEditorExporting value)? exporting,
    TResult Function(VideoEditorExportingSuccess value)? exportingSuccess,
    required TResult orElse(),
  }) {
    if (failedToLoad != null) {
      return failedToLoad(this);
    }
    return orElse();
  }
}

abstract class VideoEditorFailedToLoad implements VideoEditorState {
  const factory VideoEditorFailedToLoad(
      {required final AssetEntity assetEntity,
      final double dismissProgress}) = _$VideoEditorFailedToLoad;

  AssetEntity get assetEntity;
  @override
  double get dismissProgress;
  @override
  @JsonKey(ignore: true)
  _$$VideoEditorFailedToLoadCopyWith<_$VideoEditorFailedToLoad> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VideoEditorEditingCopyWith<$Res>
    implements $VideoEditorStateCopyWith<$Res> {
  factory _$$VideoEditorEditingCopyWith(_$VideoEditorEditing value,
          $Res Function(_$VideoEditorEditing) then) =
      __$$VideoEditorEditingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AssetEntity assetEntity,
      VideoPlayerController videoController,
      EditingEntry entry,
      bool isPlaying,
      Duration seekPosition,
      double dismissProgress,
      bool previewing});
}

/// @nodoc
class __$$VideoEditorEditingCopyWithImpl<$Res>
    extends _$VideoEditorStateCopyWithImpl<$Res, _$VideoEditorEditing>
    implements _$$VideoEditorEditingCopyWith<$Res> {
  __$$VideoEditorEditingCopyWithImpl(
      _$VideoEditorEditing _value, $Res Function(_$VideoEditorEditing) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetEntity = null,
    Object? videoController = null,
    Object? entry = freezed,
    Object? isPlaying = null,
    Object? seekPosition = null,
    Object? dismissProgress = null,
    Object? previewing = null,
  }) {
    return _then(_$VideoEditorEditing(
      assetEntity: null == assetEntity
          ? _value.assetEntity
          : assetEntity // ignore: cast_nullable_to_non_nullable
              as AssetEntity,
      videoController: null == videoController
          ? _value.videoController
          : videoController // ignore: cast_nullable_to_non_nullable
              as VideoPlayerController,
      entry: freezed == entry
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as EditingEntry,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      seekPosition: null == seekPosition
          ? _value.seekPosition
          : seekPosition // ignore: cast_nullable_to_non_nullable
              as Duration,
      dismissProgress: null == dismissProgress
          ? _value.dismissProgress
          : dismissProgress // ignore: cast_nullable_to_non_nullable
              as double,
      previewing: null == previewing
          ? _value.previewing
          : previewing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$VideoEditorEditing implements VideoEditorEditing {
  const _$VideoEditorEditing(
      {required this.assetEntity,
      required this.videoController,
      required this.entry,
      this.isPlaying = true,
      this.seekPosition = Duration.zero,
      this.dismissProgress = 0.0,
      this.previewing = true});

  @override
  final AssetEntity assetEntity;
  @override
  final VideoPlayerController videoController;
  @override
  final EditingEntry entry;
  @override
  @JsonKey()
  final bool isPlaying;
  @override
  @JsonKey()
  final Duration seekPosition;
  @override
  @JsonKey()
  final double dismissProgress;
  @override
  @JsonKey()
  final bool previewing;

  @override
  String toString() {
    return 'VideoEditorState.editing(assetEntity: $assetEntity, videoController: $videoController, entry: $entry, isPlaying: $isPlaying, seekPosition: $seekPosition, dismissProgress: $dismissProgress, previewing: $previewing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoEditorEditing &&
            (identical(other.assetEntity, assetEntity) ||
                other.assetEntity == assetEntity) &&
            (identical(other.videoController, videoController) ||
                other.videoController == videoController) &&
            const DeepCollectionEquality().equals(other.entry, entry) &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying) &&
            (identical(other.seekPosition, seekPosition) ||
                other.seekPosition == seekPosition) &&
            (identical(other.dismissProgress, dismissProgress) ||
                other.dismissProgress == dismissProgress) &&
            (identical(other.previewing, previewing) ||
                other.previewing == previewing));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      assetEntity,
      videoController,
      const DeepCollectionEquality().hash(entry),
      isPlaying,
      seekPosition,
      dismissProgress,
      previewing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoEditorEditingCopyWith<_$VideoEditorEditing> get copyWith =>
      __$$VideoEditorEditingCopyWithImpl<_$VideoEditorEditing>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AssetEntity assetEntity, double dismissProgress)
        loadingVideo,
    required TResult Function(AssetEntity assetEntity, double dismissProgress)
        failedToLoad,
    required TResult Function(
            AssetEntity assetEntity,
            VideoPlayerController videoController,
            EditingEntry entry,
            bool isPlaying,
            Duration seekPosition,
            double dismissProgress,
            bool previewing)
        editing,
    required TResult Function(EditingEntry entry,
            ProcessValue<dynamic> exportProgress, double dismissProgress)
        exporting,
    required TResult Function(SavedEntry entry, double dismissProgress)
        exportingSuccess,
  }) {
    return editing(assetEntity, videoController, entry, isPlaying, seekPosition,
        dismissProgress, previewing);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AssetEntity assetEntity, double dismissProgress)?
        loadingVideo,
    TResult? Function(AssetEntity assetEntity, double dismissProgress)?
        failedToLoad,
    TResult? Function(
            AssetEntity assetEntity,
            VideoPlayerController videoController,
            EditingEntry entry,
            bool isPlaying,
            Duration seekPosition,
            double dismissProgress,
            bool previewing)?
        editing,
    TResult? Function(EditingEntry entry, ProcessValue<dynamic> exportProgress,
            double dismissProgress)?
        exporting,
    TResult? Function(SavedEntry entry, double dismissProgress)?
        exportingSuccess,
  }) {
    return editing?.call(assetEntity, videoController, entry, isPlaying,
        seekPosition, dismissProgress, previewing);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AssetEntity assetEntity, double dismissProgress)?
        loadingVideo,
    TResult Function(AssetEntity assetEntity, double dismissProgress)?
        failedToLoad,
    TResult Function(
            AssetEntity assetEntity,
            VideoPlayerController videoController,
            EditingEntry entry,
            bool isPlaying,
            Duration seekPosition,
            double dismissProgress,
            bool previewing)?
        editing,
    TResult Function(EditingEntry entry, ProcessValue<dynamic> exportProgress,
            double dismissProgress)?
        exporting,
    TResult Function(SavedEntry entry, double dismissProgress)?
        exportingSuccess,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(assetEntity, videoController, entry, isPlaying,
          seekPosition, dismissProgress, previewing);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoEditorLoadingVideo value) loadingVideo,
    required TResult Function(VideoEditorFailedToLoad value) failedToLoad,
    required TResult Function(VideoEditorEditing value) editing,
    required TResult Function(VideoEditorExporting value) exporting,
    required TResult Function(VideoEditorExportingSuccess value)
        exportingSuccess,
  }) {
    return editing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VideoEditorLoadingVideo value)? loadingVideo,
    TResult? Function(VideoEditorFailedToLoad value)? failedToLoad,
    TResult? Function(VideoEditorEditing value)? editing,
    TResult? Function(VideoEditorExporting value)? exporting,
    TResult? Function(VideoEditorExportingSuccess value)? exportingSuccess,
  }) {
    return editing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoEditorLoadingVideo value)? loadingVideo,
    TResult Function(VideoEditorFailedToLoad value)? failedToLoad,
    TResult Function(VideoEditorEditing value)? editing,
    TResult Function(VideoEditorExporting value)? exporting,
    TResult Function(VideoEditorExportingSuccess value)? exportingSuccess,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(this);
    }
    return orElse();
  }
}

abstract class VideoEditorEditing implements VideoEditorState {
  const factory VideoEditorEditing(
      {required final AssetEntity assetEntity,
      required final VideoPlayerController videoController,
      required final EditingEntry entry,
      final bool isPlaying,
      final Duration seekPosition,
      final double dismissProgress,
      final bool previewing}) = _$VideoEditorEditing;

  AssetEntity get assetEntity;
  VideoPlayerController get videoController;
  EditingEntry get entry;
  bool get isPlaying;
  Duration get seekPosition;
  @override
  double get dismissProgress;
  bool get previewing;
  @override
  @JsonKey(ignore: true)
  _$$VideoEditorEditingCopyWith<_$VideoEditorEditing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VideoEditorExportingCopyWith<$Res>
    implements $VideoEditorStateCopyWith<$Res> {
  factory _$$VideoEditorExportingCopyWith(_$VideoEditorExporting value,
          $Res Function(_$VideoEditorExporting) then) =
      __$$VideoEditorExportingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EditingEntry entry,
      ProcessValue<dynamic> exportProgress,
      double dismissProgress});
}

/// @nodoc
class __$$VideoEditorExportingCopyWithImpl<$Res>
    extends _$VideoEditorStateCopyWithImpl<$Res, _$VideoEditorExporting>
    implements _$$VideoEditorExportingCopyWith<$Res> {
  __$$VideoEditorExportingCopyWithImpl(_$VideoEditorExporting _value,
      $Res Function(_$VideoEditorExporting) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entry = freezed,
    Object? exportProgress = null,
    Object? dismissProgress = null,
  }) {
    return _then(_$VideoEditorExporting(
      entry: freezed == entry
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as EditingEntry,
      exportProgress: null == exportProgress
          ? _value.exportProgress
          : exportProgress // ignore: cast_nullable_to_non_nullable
              as ProcessValue<dynamic>,
      dismissProgress: null == dismissProgress
          ? _value.dismissProgress
          : dismissProgress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$VideoEditorExporting implements VideoEditorExporting {
  const _$VideoEditorExporting(
      {required this.entry,
      required this.exportProgress,
      this.dismissProgress = 0.0});

  @override
  final EditingEntry entry;
  @override
  final ProcessValue<dynamic> exportProgress;
  @override
  @JsonKey()
  final double dismissProgress;

  @override
  String toString() {
    return 'VideoEditorState.exporting(entry: $entry, exportProgress: $exportProgress, dismissProgress: $dismissProgress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoEditorExporting &&
            const DeepCollectionEquality().equals(other.entry, entry) &&
            (identical(other.exportProgress, exportProgress) ||
                other.exportProgress == exportProgress) &&
            (identical(other.dismissProgress, dismissProgress) ||
                other.dismissProgress == dismissProgress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(entry),
      exportProgress,
      dismissProgress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoEditorExportingCopyWith<_$VideoEditorExporting> get copyWith =>
      __$$VideoEditorExportingCopyWithImpl<_$VideoEditorExporting>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AssetEntity assetEntity, double dismissProgress)
        loadingVideo,
    required TResult Function(AssetEntity assetEntity, double dismissProgress)
        failedToLoad,
    required TResult Function(
            AssetEntity assetEntity,
            VideoPlayerController videoController,
            EditingEntry entry,
            bool isPlaying,
            Duration seekPosition,
            double dismissProgress,
            bool previewing)
        editing,
    required TResult Function(EditingEntry entry,
            ProcessValue<dynamic> exportProgress, double dismissProgress)
        exporting,
    required TResult Function(SavedEntry entry, double dismissProgress)
        exportingSuccess,
  }) {
    return exporting(entry, exportProgress, dismissProgress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AssetEntity assetEntity, double dismissProgress)?
        loadingVideo,
    TResult? Function(AssetEntity assetEntity, double dismissProgress)?
        failedToLoad,
    TResult? Function(
            AssetEntity assetEntity,
            VideoPlayerController videoController,
            EditingEntry entry,
            bool isPlaying,
            Duration seekPosition,
            double dismissProgress,
            bool previewing)?
        editing,
    TResult? Function(EditingEntry entry, ProcessValue<dynamic> exportProgress,
            double dismissProgress)?
        exporting,
    TResult? Function(SavedEntry entry, double dismissProgress)?
        exportingSuccess,
  }) {
    return exporting?.call(entry, exportProgress, dismissProgress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AssetEntity assetEntity, double dismissProgress)?
        loadingVideo,
    TResult Function(AssetEntity assetEntity, double dismissProgress)?
        failedToLoad,
    TResult Function(
            AssetEntity assetEntity,
            VideoPlayerController videoController,
            EditingEntry entry,
            bool isPlaying,
            Duration seekPosition,
            double dismissProgress,
            bool previewing)?
        editing,
    TResult Function(EditingEntry entry, ProcessValue<dynamic> exportProgress,
            double dismissProgress)?
        exporting,
    TResult Function(SavedEntry entry, double dismissProgress)?
        exportingSuccess,
    required TResult orElse(),
  }) {
    if (exporting != null) {
      return exporting(entry, exportProgress, dismissProgress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoEditorLoadingVideo value) loadingVideo,
    required TResult Function(VideoEditorFailedToLoad value) failedToLoad,
    required TResult Function(VideoEditorEditing value) editing,
    required TResult Function(VideoEditorExporting value) exporting,
    required TResult Function(VideoEditorExportingSuccess value)
        exportingSuccess,
  }) {
    return exporting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VideoEditorLoadingVideo value)? loadingVideo,
    TResult? Function(VideoEditorFailedToLoad value)? failedToLoad,
    TResult? Function(VideoEditorEditing value)? editing,
    TResult? Function(VideoEditorExporting value)? exporting,
    TResult? Function(VideoEditorExportingSuccess value)? exportingSuccess,
  }) {
    return exporting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoEditorLoadingVideo value)? loadingVideo,
    TResult Function(VideoEditorFailedToLoad value)? failedToLoad,
    TResult Function(VideoEditorEditing value)? editing,
    TResult Function(VideoEditorExporting value)? exporting,
    TResult Function(VideoEditorExportingSuccess value)? exportingSuccess,
    required TResult orElse(),
  }) {
    if (exporting != null) {
      return exporting(this);
    }
    return orElse();
  }
}

abstract class VideoEditorExporting implements VideoEditorState {
  const factory VideoEditorExporting(
      {required final EditingEntry entry,
      required final ProcessValue<dynamic> exportProgress,
      final double dismissProgress}) = _$VideoEditorExporting;

  EditingEntry get entry;
  ProcessValue<dynamic> get exportProgress;
  @override
  double get dismissProgress;
  @override
  @JsonKey(ignore: true)
  _$$VideoEditorExportingCopyWith<_$VideoEditorExporting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VideoEditorExportingSuccessCopyWith<$Res>
    implements $VideoEditorStateCopyWith<$Res> {
  factory _$$VideoEditorExportingSuccessCopyWith(
          _$VideoEditorExportingSuccess value,
          $Res Function(_$VideoEditorExportingSuccess) then) =
      __$$VideoEditorExportingSuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SavedEntry entry, double dismissProgress});
}

/// @nodoc
class __$$VideoEditorExportingSuccessCopyWithImpl<$Res>
    extends _$VideoEditorStateCopyWithImpl<$Res, _$VideoEditorExportingSuccess>
    implements _$$VideoEditorExportingSuccessCopyWith<$Res> {
  __$$VideoEditorExportingSuccessCopyWithImpl(
      _$VideoEditorExportingSuccess _value,
      $Res Function(_$VideoEditorExportingSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entry = freezed,
    Object? dismissProgress = null,
  }) {
    return _then(_$VideoEditorExportingSuccess(
      entry: freezed == entry
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as SavedEntry,
      dismissProgress: null == dismissProgress
          ? _value.dismissProgress
          : dismissProgress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$VideoEditorExportingSuccess implements VideoEditorExportingSuccess {
  const _$VideoEditorExportingSuccess(
      {required this.entry, this.dismissProgress = 0.0});

  @override
  final SavedEntry entry;
  @override
  @JsonKey()
  final double dismissProgress;

  @override
  String toString() {
    return 'VideoEditorState.exportingSuccess(entry: $entry, dismissProgress: $dismissProgress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoEditorExportingSuccess &&
            const DeepCollectionEquality().equals(other.entry, entry) &&
            (identical(other.dismissProgress, dismissProgress) ||
                other.dismissProgress == dismissProgress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(entry), dismissProgress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoEditorExportingSuccessCopyWith<_$VideoEditorExportingSuccess>
      get copyWith => __$$VideoEditorExportingSuccessCopyWithImpl<
          _$VideoEditorExportingSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AssetEntity assetEntity, double dismissProgress)
        loadingVideo,
    required TResult Function(AssetEntity assetEntity, double dismissProgress)
        failedToLoad,
    required TResult Function(
            AssetEntity assetEntity,
            VideoPlayerController videoController,
            EditingEntry entry,
            bool isPlaying,
            Duration seekPosition,
            double dismissProgress,
            bool previewing)
        editing,
    required TResult Function(EditingEntry entry,
            ProcessValue<dynamic> exportProgress, double dismissProgress)
        exporting,
    required TResult Function(SavedEntry entry, double dismissProgress)
        exportingSuccess,
  }) {
    return exportingSuccess(entry, dismissProgress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AssetEntity assetEntity, double dismissProgress)?
        loadingVideo,
    TResult? Function(AssetEntity assetEntity, double dismissProgress)?
        failedToLoad,
    TResult? Function(
            AssetEntity assetEntity,
            VideoPlayerController videoController,
            EditingEntry entry,
            bool isPlaying,
            Duration seekPosition,
            double dismissProgress,
            bool previewing)?
        editing,
    TResult? Function(EditingEntry entry, ProcessValue<dynamic> exportProgress,
            double dismissProgress)?
        exporting,
    TResult? Function(SavedEntry entry, double dismissProgress)?
        exportingSuccess,
  }) {
    return exportingSuccess?.call(entry, dismissProgress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AssetEntity assetEntity, double dismissProgress)?
        loadingVideo,
    TResult Function(AssetEntity assetEntity, double dismissProgress)?
        failedToLoad,
    TResult Function(
            AssetEntity assetEntity,
            VideoPlayerController videoController,
            EditingEntry entry,
            bool isPlaying,
            Duration seekPosition,
            double dismissProgress,
            bool previewing)?
        editing,
    TResult Function(EditingEntry entry, ProcessValue<dynamic> exportProgress,
            double dismissProgress)?
        exporting,
    TResult Function(SavedEntry entry, double dismissProgress)?
        exportingSuccess,
    required TResult orElse(),
  }) {
    if (exportingSuccess != null) {
      return exportingSuccess(entry, dismissProgress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoEditorLoadingVideo value) loadingVideo,
    required TResult Function(VideoEditorFailedToLoad value) failedToLoad,
    required TResult Function(VideoEditorEditing value) editing,
    required TResult Function(VideoEditorExporting value) exporting,
    required TResult Function(VideoEditorExportingSuccess value)
        exportingSuccess,
  }) {
    return exportingSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VideoEditorLoadingVideo value)? loadingVideo,
    TResult? Function(VideoEditorFailedToLoad value)? failedToLoad,
    TResult? Function(VideoEditorEditing value)? editing,
    TResult? Function(VideoEditorExporting value)? exporting,
    TResult? Function(VideoEditorExportingSuccess value)? exportingSuccess,
  }) {
    return exportingSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoEditorLoadingVideo value)? loadingVideo,
    TResult Function(VideoEditorFailedToLoad value)? failedToLoad,
    TResult Function(VideoEditorEditing value)? editing,
    TResult Function(VideoEditorExporting value)? exporting,
    TResult Function(VideoEditorExportingSuccess value)? exportingSuccess,
    required TResult orElse(),
  }) {
    if (exportingSuccess != null) {
      return exportingSuccess(this);
    }
    return orElse();
  }
}

abstract class VideoEditorExportingSuccess implements VideoEditorState {
  const factory VideoEditorExportingSuccess(
      {required final SavedEntry entry,
      final double dismissProgress}) = _$VideoEditorExportingSuccess;

  SavedEntry get entry;
  @override
  double get dismissProgress;
  @override
  @JsonKey(ignore: true)
  _$$VideoEditorExportingSuccessCopyWith<_$VideoEditorExportingSuccess>
      get copyWith => throw _privateConstructorUsedError;
}
