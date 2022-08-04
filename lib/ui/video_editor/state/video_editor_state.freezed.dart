// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
            LoadingValue<dynamic> exportProgress, double dismissProgress)
        exporting,
    required TResult Function(SavedEntry entry, double dismissProgress)
        exportingSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
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
    TResult Function(EditingEntry entry, LoadingValue<dynamic> exportProgress,
            double dismissProgress)?
        exporting,
    TResult Function(SavedEntry entry, double dismissProgress)?
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
    TResult Function(EditingEntry entry, LoadingValue<dynamic> exportProgress,
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
    TResult Function(VideoEditorLoadingVideo value)? loadingVideo,
    TResult Function(VideoEditorFailedToLoad value)? failedToLoad,
    TResult Function(VideoEditorEditing value)? editing,
    TResult Function(VideoEditorExporting value)? exporting,
    TResult Function(VideoEditorExportingSuccess value)? exportingSuccess,
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
      _$VideoEditorStateCopyWithImpl<$Res>;
  $Res call({double dismissProgress});
}

/// @nodoc
class _$VideoEditorStateCopyWithImpl<$Res>
    implements $VideoEditorStateCopyWith<$Res> {
  _$VideoEditorStateCopyWithImpl(this._value, this._then);

  final VideoEditorState _value;
  // ignore: unused_field
  final $Res Function(VideoEditorState) _then;

  @override
  $Res call({
    Object? dismissProgress = freezed,
  }) {
    return _then(_value.copyWith(
      dismissProgress: dismissProgress == freezed
          ? _value.dismissProgress
          : dismissProgress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$VideoEditorLoadingVideoCopyWith<$Res>
    implements $VideoEditorStateCopyWith<$Res> {
  factory _$$VideoEditorLoadingVideoCopyWith(_$VideoEditorLoadingVideo value,
          $Res Function(_$VideoEditorLoadingVideo) then) =
      __$$VideoEditorLoadingVideoCopyWithImpl<$Res>;
  @override
  $Res call({AssetEntity assetEntity, double dismissProgress});
}

/// @nodoc
class __$$VideoEditorLoadingVideoCopyWithImpl<$Res>
    extends _$VideoEditorStateCopyWithImpl<$Res>
    implements _$$VideoEditorLoadingVideoCopyWith<$Res> {
  __$$VideoEditorLoadingVideoCopyWithImpl(_$VideoEditorLoadingVideo _value,
      $Res Function(_$VideoEditorLoadingVideo) _then)
      : super(_value, (v) => _then(v as _$VideoEditorLoadingVideo));

  @override
  _$VideoEditorLoadingVideo get _value =>
      super._value as _$VideoEditorLoadingVideo;

  @override
  $Res call({
    Object? assetEntity = freezed,
    Object? dismissProgress = freezed,
  }) {
    return _then(_$VideoEditorLoadingVideo(
      assetEntity: assetEntity == freezed
          ? _value.assetEntity
          : assetEntity // ignore: cast_nullable_to_non_nullable
              as AssetEntity,
      dismissProgress: dismissProgress == freezed
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
            const DeepCollectionEquality()
                .equals(other.assetEntity, assetEntity) &&
            const DeepCollectionEquality()
                .equals(other.dismissProgress, dismissProgress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(assetEntity),
      const DeepCollectionEquality().hash(dismissProgress));

  @JsonKey(ignore: true)
  @override
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
            LoadingValue<dynamic> exportProgress, double dismissProgress)
        exporting,
    required TResult Function(SavedEntry entry, double dismissProgress)
        exportingSuccess,
  }) {
    return loadingVideo(assetEntity, dismissProgress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
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
    TResult Function(EditingEntry entry, LoadingValue<dynamic> exportProgress,
            double dismissProgress)?
        exporting,
    TResult Function(SavedEntry entry, double dismissProgress)?
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
    TResult Function(EditingEntry entry, LoadingValue<dynamic> exportProgress,
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
    TResult Function(VideoEditorLoadingVideo value)? loadingVideo,
    TResult Function(VideoEditorFailedToLoad value)? failedToLoad,
    TResult Function(VideoEditorEditing value)? editing,
    TResult Function(VideoEditorExporting value)? exporting,
    TResult Function(VideoEditorExportingSuccess value)? exportingSuccess,
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
  $Res call({AssetEntity assetEntity, double dismissProgress});
}

/// @nodoc
class __$$VideoEditorFailedToLoadCopyWithImpl<$Res>
    extends _$VideoEditorStateCopyWithImpl<$Res>
    implements _$$VideoEditorFailedToLoadCopyWith<$Res> {
  __$$VideoEditorFailedToLoadCopyWithImpl(_$VideoEditorFailedToLoad _value,
      $Res Function(_$VideoEditorFailedToLoad) _then)
      : super(_value, (v) => _then(v as _$VideoEditorFailedToLoad));

  @override
  _$VideoEditorFailedToLoad get _value =>
      super._value as _$VideoEditorFailedToLoad;

  @override
  $Res call({
    Object? assetEntity = freezed,
    Object? dismissProgress = freezed,
  }) {
    return _then(_$VideoEditorFailedToLoad(
      assetEntity: assetEntity == freezed
          ? _value.assetEntity
          : assetEntity // ignore: cast_nullable_to_non_nullable
              as AssetEntity,
      dismissProgress: dismissProgress == freezed
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
            const DeepCollectionEquality()
                .equals(other.assetEntity, assetEntity) &&
            const DeepCollectionEquality()
                .equals(other.dismissProgress, dismissProgress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(assetEntity),
      const DeepCollectionEquality().hash(dismissProgress));

  @JsonKey(ignore: true)
  @override
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
            LoadingValue<dynamic> exportProgress, double dismissProgress)
        exporting,
    required TResult Function(SavedEntry entry, double dismissProgress)
        exportingSuccess,
  }) {
    return failedToLoad(assetEntity, dismissProgress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
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
    TResult Function(EditingEntry entry, LoadingValue<dynamic> exportProgress,
            double dismissProgress)?
        exporting,
    TResult Function(SavedEntry entry, double dismissProgress)?
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
    TResult Function(EditingEntry entry, LoadingValue<dynamic> exportProgress,
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
    TResult Function(VideoEditorLoadingVideo value)? loadingVideo,
    TResult Function(VideoEditorFailedToLoad value)? failedToLoad,
    TResult Function(VideoEditorEditing value)? editing,
    TResult Function(VideoEditorExporting value)? exporting,
    TResult Function(VideoEditorExportingSuccess value)? exportingSuccess,
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
    extends _$VideoEditorStateCopyWithImpl<$Res>
    implements _$$VideoEditorEditingCopyWith<$Res> {
  __$$VideoEditorEditingCopyWithImpl(
      _$VideoEditorEditing _value, $Res Function(_$VideoEditorEditing) _then)
      : super(_value, (v) => _then(v as _$VideoEditorEditing));

  @override
  _$VideoEditorEditing get _value => super._value as _$VideoEditorEditing;

  @override
  $Res call({
    Object? assetEntity = freezed,
    Object? videoController = freezed,
    Object? entry = freezed,
    Object? isPlaying = freezed,
    Object? seekPosition = freezed,
    Object? dismissProgress = freezed,
    Object? previewing = freezed,
  }) {
    return _then(_$VideoEditorEditing(
      assetEntity: assetEntity == freezed
          ? _value.assetEntity
          : assetEntity // ignore: cast_nullable_to_non_nullable
              as AssetEntity,
      videoController: videoController == freezed
          ? _value.videoController
          : videoController // ignore: cast_nullable_to_non_nullable
              as VideoPlayerController,
      entry: entry == freezed
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as EditingEntry,
      isPlaying: isPlaying == freezed
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      seekPosition: seekPosition == freezed
          ? _value.seekPosition
          : seekPosition // ignore: cast_nullable_to_non_nullable
              as Duration,
      dismissProgress: dismissProgress == freezed
          ? _value.dismissProgress
          : dismissProgress // ignore: cast_nullable_to_non_nullable
              as double,
      previewing: previewing == freezed
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
            const DeepCollectionEquality()
                .equals(other.assetEntity, assetEntity) &&
            const DeepCollectionEquality()
                .equals(other.videoController, videoController) &&
            const DeepCollectionEquality().equals(other.entry, entry) &&
            const DeepCollectionEquality().equals(other.isPlaying, isPlaying) &&
            const DeepCollectionEquality()
                .equals(other.seekPosition, seekPosition) &&
            const DeepCollectionEquality()
                .equals(other.dismissProgress, dismissProgress) &&
            const DeepCollectionEquality()
                .equals(other.previewing, previewing));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(assetEntity),
      const DeepCollectionEquality().hash(videoController),
      const DeepCollectionEquality().hash(entry),
      const DeepCollectionEquality().hash(isPlaying),
      const DeepCollectionEquality().hash(seekPosition),
      const DeepCollectionEquality().hash(dismissProgress),
      const DeepCollectionEquality().hash(previewing));

  @JsonKey(ignore: true)
  @override
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
            LoadingValue<dynamic> exportProgress, double dismissProgress)
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
    TResult Function(EditingEntry entry, LoadingValue<dynamic> exportProgress,
            double dismissProgress)?
        exporting,
    TResult Function(SavedEntry entry, double dismissProgress)?
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
    TResult Function(EditingEntry entry, LoadingValue<dynamic> exportProgress,
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
    TResult Function(VideoEditorLoadingVideo value)? loadingVideo,
    TResult Function(VideoEditorFailedToLoad value)? failedToLoad,
    TResult Function(VideoEditorEditing value)? editing,
    TResult Function(VideoEditorExporting value)? exporting,
    TResult Function(VideoEditorExportingSuccess value)? exportingSuccess,
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
  $Res call(
      {EditingEntry entry,
      LoadingValue<dynamic> exportProgress,
      double dismissProgress});
}

/// @nodoc
class __$$VideoEditorExportingCopyWithImpl<$Res>
    extends _$VideoEditorStateCopyWithImpl<$Res>
    implements _$$VideoEditorExportingCopyWith<$Res> {
  __$$VideoEditorExportingCopyWithImpl(_$VideoEditorExporting _value,
      $Res Function(_$VideoEditorExporting) _then)
      : super(_value, (v) => _then(v as _$VideoEditorExporting));

  @override
  _$VideoEditorExporting get _value => super._value as _$VideoEditorExporting;

  @override
  $Res call({
    Object? entry = freezed,
    Object? exportProgress = freezed,
    Object? dismissProgress = freezed,
  }) {
    return _then(_$VideoEditorExporting(
      entry: entry == freezed
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as EditingEntry,
      exportProgress: exportProgress == freezed
          ? _value.exportProgress
          : exportProgress // ignore: cast_nullable_to_non_nullable
              as LoadingValue<dynamic>,
      dismissProgress: dismissProgress == freezed
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
  final LoadingValue<dynamic> exportProgress;
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
            const DeepCollectionEquality()
                .equals(other.exportProgress, exportProgress) &&
            const DeepCollectionEquality()
                .equals(other.dismissProgress, dismissProgress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(entry),
      const DeepCollectionEquality().hash(exportProgress),
      const DeepCollectionEquality().hash(dismissProgress));

  @JsonKey(ignore: true)
  @override
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
            LoadingValue<dynamic> exportProgress, double dismissProgress)
        exporting,
    required TResult Function(SavedEntry entry, double dismissProgress)
        exportingSuccess,
  }) {
    return exporting(entry, exportProgress, dismissProgress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
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
    TResult Function(EditingEntry entry, LoadingValue<dynamic> exportProgress,
            double dismissProgress)?
        exporting,
    TResult Function(SavedEntry entry, double dismissProgress)?
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
    TResult Function(EditingEntry entry, LoadingValue<dynamic> exportProgress,
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
    TResult Function(VideoEditorLoadingVideo value)? loadingVideo,
    TResult Function(VideoEditorFailedToLoad value)? failedToLoad,
    TResult Function(VideoEditorEditing value)? editing,
    TResult Function(VideoEditorExporting value)? exporting,
    TResult Function(VideoEditorExportingSuccess value)? exportingSuccess,
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
      required final LoadingValue<dynamic> exportProgress,
      final double dismissProgress}) = _$VideoEditorExporting;

  EditingEntry get entry;
  LoadingValue<dynamic> get exportProgress;
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
  $Res call({SavedEntry entry, double dismissProgress});
}

/// @nodoc
class __$$VideoEditorExportingSuccessCopyWithImpl<$Res>
    extends _$VideoEditorStateCopyWithImpl<$Res>
    implements _$$VideoEditorExportingSuccessCopyWith<$Res> {
  __$$VideoEditorExportingSuccessCopyWithImpl(
      _$VideoEditorExportingSuccess _value,
      $Res Function(_$VideoEditorExportingSuccess) _then)
      : super(_value, (v) => _then(v as _$VideoEditorExportingSuccess));

  @override
  _$VideoEditorExportingSuccess get _value =>
      super._value as _$VideoEditorExportingSuccess;

  @override
  $Res call({
    Object? entry = freezed,
    Object? dismissProgress = freezed,
  }) {
    return _then(_$VideoEditorExportingSuccess(
      entry: entry == freezed
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as SavedEntry,
      dismissProgress: dismissProgress == freezed
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
            const DeepCollectionEquality()
                .equals(other.dismissProgress, dismissProgress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(entry),
      const DeepCollectionEquality().hash(dismissProgress));

  @JsonKey(ignore: true)
  @override
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
            LoadingValue<dynamic> exportProgress, double dismissProgress)
        exporting,
    required TResult Function(SavedEntry entry, double dismissProgress)
        exportingSuccess,
  }) {
    return exportingSuccess(entry, dismissProgress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
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
    TResult Function(EditingEntry entry, LoadingValue<dynamic> exportProgress,
            double dismissProgress)?
        exporting,
    TResult Function(SavedEntry entry, double dismissProgress)?
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
    TResult Function(EditingEntry entry, LoadingValue<dynamic> exportProgress,
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
    TResult Function(VideoEditorLoadingVideo value)? loadingVideo,
    TResult Function(VideoEditorFailedToLoad value)? failedToLoad,
    TResult Function(VideoEditorEditing value)? editing,
    TResult Function(VideoEditorExporting value)? exporting,
    TResult Function(VideoEditorExportingSuccess value)? exportingSuccess,
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
