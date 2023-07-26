import 'package:process_value/process_value.dart';
import 'package:broody/model/entry/entry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:video_player/video_player.dart';

part 'video_editor_state.freezed.dart';

@freezed
class VideoEditorState with _$VideoEditorState {
  const factory VideoEditorState.loadingVideo({
    required AssetEntity assetEntity,
    @Default(0.0) double dismissProgress,
  }) = VideoEditorLoadingVideo;

  const factory VideoEditorState.failedToLoad({
    required AssetEntity assetEntity,
    @Default(0.0) double dismissProgress,
  }) = VideoEditorFailedToLoad;

  const factory VideoEditorState.editing({
    required AssetEntity assetEntity,
    required VideoPlayerController videoController,
    required EditingEntry entry,
    @Default(true) bool isPlaying,
    @Default(Duration.zero) Duration seekPosition,
    @Default(0.0) double dismissProgress,
    @Default(true) bool previewing,
  }) = VideoEditorEditing;

  const factory VideoEditorState.exporting({
    required EditingEntry entry,
    required ProcessValue exportProgress,
    @Default(0.0) double dismissProgress,
  }) = VideoEditorExporting;

  const factory VideoEditorState.exportingSuccess({
    required SavedEntry entry,
    @Default(0.0) double dismissProgress,
  }) = VideoEditorExportingSuccess;
}
