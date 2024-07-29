import 'dart:async';
import 'dart:math';

import 'package:broody/model/entry/entry.dart';
import 'package:broody/service/providers/project/project.providers.dart';
import 'package:broody/service/providers/video/video_gallery.providers.dart';
import 'package:broody/service/repositories/entry.repository.dart';
import 'package:broody/service/repositories/onboarding.repository.dart';
import 'package:broody/ui/shared/providers/video_player_controller.provider.dart';
import 'package:broody/ui/video_editor/state/video_editor_state.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:process_value/process_value.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

final videoEditorStateProvider = StateNotifierProvider.autoDispose
    .family<VideoEditorNotifier, VideoEditorState, AssetEntity>(
        (ref, assetEntity) {
  final size = ref.watch(assetEntitySizeProvider((assetEntity)));
  final file = ref.watch(assetEntityFileProvider(assetEntity));
  final state = file.whenOrNull(
        data: (file) => file == null
            ? VideoEditorState.failedToLoad(assetEntity: assetEntity)
            : ref
                .watch(loopingFileVideoControllerProvider(file.path))
                .whenOrNull(
                    data: (videoController) => VideoEditorState.editing(
                          assetEntity: assetEntity,
                          videoController: videoController,
                          entry: EditingEntry(
                            projectId: ref.watch(selectedProjectProvider)!.uid,
                            duration: ref.watch(projectClipDurationProvider)!,
                            videoPath: file.path,
                            assetEntityId: assetEntity.id,
                            height: size.height.toInt(),
                            width: size.width.toInt(),
                            timestamp: assetEntity.createDateTime,
                            startPoint: Duration.zero,
                          ),
                        )),
      ) ??
      VideoEditorState.loadingVideo(assetEntity: assetEntity);

  return VideoEditorNotifier(ref, state);
});

class VideoEditorNotifier extends StateNotifier<VideoEditorState> {
  VideoEditorNotifier(this.ref, VideoEditorState initialState)
      : super(initialState) {
    init();
  }

  final Ref ref;

  Timer? _loopTimer;

  void init() async {
    final s = state;
    if (s is VideoEditorEditing) {
      s.videoController.addListener(_videoControllerListener);
      s.videoController.setVolume(1);
    }
  }

  void pause() {
    if (!mounted) return;
    final s = state;
    if (s is! VideoEditorEditing) return;
    s.videoController.setLooping(false);
    _loopTimer?.cancel();
    final onboarding = ref.read(onboardingRepositoryProvider).onboardingConfig;
    ref
        .read(onboardingRepositoryProvider)
        .setOnboardingConfig(onboarding.copyWith(
          knowsTimeline: true,
        ));
    s.videoController.pause();
    state = s.copyWith(
      isPlaying: false,
      previewing: false,
    );
  }

  void loop() async {
    if (!mounted) return;
    final s = state;
    if (s is! VideoEditorEditing) return;
    s.videoController.setLooping(false);
    _loopTimer?.cancel();
    await s.videoController.seekTo(s.entry.startPoint);
    await s.videoController.play();
    _loopTimer = Timer(s.entry.duration, () => loop());
    state = s.copyWith(
      isPlaying: true,
      seekPosition: s.entry.startPoint,
      previewing: false,
    );
  }

  void seekTo(Duration value) {
    final s = state;
    if (s is! VideoEditorEditing || s.previewing) return;
    s.videoController.seekTo(value);
    state = s.copyWith(
      seekPosition: value,
    );
  }

  void setStartPoint(Duration value) {
    final s = state;
    if (s is! VideoEditorEditing || s.previewing) return;
    s.videoController.seekTo(value);
    state = s.copyWith(
      seekPosition: value,
      entry: s.entry.copyWith(
        startPoint: value,
      ),
    );
  }

  Future<void> saveClip() async {
    await _saveClip().last;
  }

  Stream<void> _saveClip() async* {
    final s = state;
    if (s is! VideoEditorEditing) {
      return;
    }
    s.videoController.pause();
    final newEntry = s.entry.copyWith(
      thumbnailBytes: await VideoThumbnail.thumbnailData(
        video: s.entry.videoPath,
        timeMs: s.entry.startPoint.inMilliseconds,
        imageFormat: ImageFormat.JPEG,
        maxHeight: s.entry.height ~/ 2,
        maxWidth: s.entry.width ~/ 2,
        quality: 10,
      ),
    );

    state = VideoEditorState.exporting(
      entry: newEntry,
      exportProgress: const ProcessValue.loading(0),
      dismissProgress: state.dismissProgress,
    );
    final repo = ref.read(entryRepositoryProvider);

    final entryProgress = repo.saveEntry(entry: newEntry);
    await for (final loadingValue in entryProgress) {
      if (loadingValue is ProcessError) {
        debugPrint(loadingValue.toString());
      }
      state = VideoEditorState.exporting(
        entry: newEntry,
        exportProgress: loadingValue,
        dismissProgress: state.dismissProgress,
      );
    }
  }

  @override
  void dispose() {
    final s = state;
    if (s is VideoEditorEditing) {
      s.videoController.setVolume(0);
      s.videoController.setLooping(true);
      if (!s.videoController.value.isPlaying) {
        s.videoController.play();
      }
      s.videoController.removeListener(_videoControllerListener);
    }
    super.dispose();
  }

  void updateDismissProgress(double progress) {
    state = state.copyWith(dismissProgress: progress);
    final s = state;
    if (s is VideoEditorEditing) {
      s.videoController.setVolume(1 - progress);
    }
  }

  void _videoControllerListener() {
    if (!mounted) return;
    final s = state;
    if (s is! VideoEditorEditing) return;
    final videoPosition = s.videoController.value.position;
    if (!s.previewing &&
        videoPosition >= s.entry.startPoint + s.entry.duration) {
    } else {
      final startPoint = Duration(
        milliseconds: max(
          (videoPosition - s.entry.duration).inMilliseconds,
          0,
        ),
      );
      state = s.copyWith(
        seekPosition: s.videoController.value.position,
        entry: s.entry.copyWith(
          startPoint: s.previewing ? startPoint : s.entry.startPoint,
        ),
      );
    }
  }
}
