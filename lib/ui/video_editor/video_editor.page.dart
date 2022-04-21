import 'dart:typed_data';

import 'package:blur/blur.dart';
import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/ui/shared/better_blob_clipper/better_blob_clipper.dart';
import 'package:broody/ui/shared/bouncy_pressable/bouncy_pressable.widget.dart';
import 'package:broody/ui/shared/gallery_video/gallery_video.widget.dart';
import 'package:broody/ui/shared/gallery_video/video_thumbnail.widget.dart';
import 'package:broody/ui/shared/interactive_viewer_plus/widgets/custom_dismissible.widget.dart';
import 'package:broody/ui/shared/loading_value_progress_bar/loading_value_progress_bar.widget.dart';
import 'package:broody/ui/shared/providers/blob/blob.provider.dart';
import 'package:broody/ui/shared/providers/blob/request/blob_request.dart';
import 'package:broody/ui/shared/providers/video_tile.providers.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:broody/ui/theme/transitions.dart';
import 'package:broody/ui/video_editor/state/video_editor_state.dart';
import 'package:broody/ui/video_editor/video_editor.notifier.dart';
import 'package:broody/ui/video_editor/widgets/timeline/timeline.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_value/loading_value.dart';
import 'package:photo_manager/photo_manager.dart';

class VideoEditorPage extends HookConsumerWidget {
  const VideoEditorPage({
    required this.assetEntity,
    Key? key,
  }) : super(key: key);

  final AssetEntity assetEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(videoEditorStateProvider(assetEntity));
    final notifier = ref.watch(videoEditorStateProvider(assetEntity).notifier);

    final l10n = useL10n();
    final textTheme = useTextTheme();
    final colorScheme = useColorScheme();
    final mounted = useIsMounted();
    ref.listen(videoEditorStateProvider(assetEntity), (prev, next) async {
      if (next is VideoEditorExporting) {
        if (next.exportProgress is LoadedData) {
          context.router.navigate(const HomeRoute());
        } else if (next.exportProgress is LoadingError) {
          await Future.delayed(const Duration(seconds: 1));
          context.router.pop();
        }
      } else if (next is VideoEditorFailedToLoad) {
        if (prev is VideoEditorFailedToLoad) return;
        HapticFeedback.lightImpact();
        await Future.delayed(const Duration(milliseconds: 130));
        HapticFeedback.mediumImpact();
        await Future.delayed(const Duration(seconds: 3));
        if (mounted()) {
          context.router.pop();
        }
      }
    });

    return Scaffold(
      backgroundColor:
          colorScheme.background.withOpacity(1 - state.dismissProgress),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: AnimatedOpacity(
          duration: kThemeAnimationDuration,
          opacity: state is VideoEditorExporting || state.dismissProgress > 0
              ? 0
              : 1,
          child: IconButton(
            icon: const Icon(Icons.close_rounded),
            onPressed: state.maybeMap(
              exporting: (_) => null,
              orElse: () => context.router.pop,
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTapUp: (_) => notifier.loop(),
        child: CustomDismissible(
          enabled: state.maybeMap(
            exporting: (_) => false,
            orElse: () => true,
          ),
          onDismissed: () => context.router.pop(),
          onDismissUpdated: notifier.updateDismissProgress,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              FittedBox(
                fit: BoxFit.cover,
                child: AnimatedSwitcher(
                  duration: kThemeAnimationDuration,
                  child: state.maybeMap(
                    editing: (state) => Hero(
                      tag: assetEntity.id,
                      createRectTween: linearRectTween,
                      child: Material(
                        color: colorScheme.background,
                        elevation: 24,
                        child: VideoAndThumbnail(
                          size: Size(
                            state.entry.width.toDouble(),
                            state.entry.height.toDouble(),
                          ),
                          videoPlayerController: state.videoController,
                          thumbnail: ref
                              .watch(galleryVideoThumbnailProvider(
                                  state.assetEntity))
                              .value,
                        ),
                      ),
                    ),
                    exporting: (state) => ProgressBuilder(
                      duration: kThemeAnimationDuration * 2,
                      progress:
                          state.exportProgress.whenOrNull(loading: (p) => p) ??
                              0,
                      builder: (context, value, child) => Hero(
                        tag: state.entry.day,
                        createRectTween: linearRectTween,
                        child: ClipPath(
                          clipper: BetterBlobClipper(
                            scale: 6 - 5 * value,
                            id: ref.watch(
                              blobProvider(
                                BlobRequest(
                                    day: state.entry.day.day,
                                    month: state.entry.day.month),
                              ),
                            ),
                          ),
                          child: child,
                        ),
                      ),
                      child: Stack(
                        children: [
                          VideoAndThumbnail(
                            size: Size(
                              state.entry.width.toDouble(),
                              state.entry.height.toDouble(),
                            ),
                            videoPlayerController: null,
                            blur: 200,
                            thumbnail: state.entry.thumbnailBytes != null
                                ? MemoryImage(Uint8List.fromList(
                                    state.entry.thumbnailBytes!))
                                : null,
                          ),
                        ],
                      ),
                    ),
                    orElse: () => Hero(
                      tag: assetEntity.id,
                      createRectTween: linearRectTween,
                      child: GalleryVideo(
                        assetEntity: assetEntity,
                        overlayColor: state.maybeMap(
                          loadingVideo: (_) =>
                              colorScheme.background.withOpacity(0.6),
                          failedToLoad: (_) =>
                              colorScheme.errorContainer.withOpacity(0.7),
                          orElse: () => Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Overlay
              AnimatedOpacity(
                duration: kThemeAnimationDuration,
                opacity: state.dismissProgress > 0 ? 0 : 1,
                child: AnimatedSwitcher(
                  duration: kThemeAnimationDuration * 2,
                  child: state.maybeMap(
                    exporting: (state) => LoadingValueProgressBar(
                      loadingValue: state.exportProgress,
                      color: colorScheme.inversePrimary,
                    ),
                    loadingVideo: (_) => const Center(
                        child: CircularProgressIndicator.adaptive()),
                    failedToLoad: (state) => IconTheme(
                      data: IconThemeData(
                        color: colorScheme.error,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(),
                          const Icon(Icons.error_rounded),
                          vSpace(Spacers.xs),
                          Text(
                            l10n.loadingVideoFailed,
                            style: textTheme.subtitle1
                                ?.copyWith(color: colorScheme.onErrorContainer),
                          ),
                        ],
                      ),
                    ),
                    orElse: () => const SizedBox(),
                  ),
                ),
              ),
              Positioned(
                bottom:
                    MediaQuery.of(context).viewPadding.bottom + Spacers.l + 64,
                child: AnimatedSwitcher(
                  duration: kThemeAnimationDuration * 2,
                  switchInCurve: Curves.elasticOut,
                  switchOutCurve: Curves.easeInQuint,
                  transitionBuilder: (child, animation) => ScaleTransition(
                    scale: animation,
                    child: child,
                  ),
                  child: state.maybeMap(
                    editing: (s) => s.previewing ||
                            !s.isPlaying ||
                            s.dismissProgress > 0
                        ? const SizedBox()
                        : BouncyPressable(
                            child: CupertinoButton(
                              padding: const EdgeInsets.symmetric(
                                horizontal: Spacers.m,
                              ),
                              child: Text(
                                l10n.save.toUpperCase(),
                                style: textTheme.subtitle1?.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () => notifier.saveClip(),
                            ).frosted(
                              borderRadius: BorderRadius.circular(Spacers.x5l),
                            ),
                          ),
                    orElse: () => const SizedBox(),
                  ),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).viewPadding.bottom + Spacers.s,
                right: 0,
                left: 0,
                child: AnimatedSwitcher(
                  duration: kThemeAnimationDuration,
                  child: state.maybeMap(
                    editing: (s) => Timeline(
                      editorNotifier: notifier,
                    ),
                    orElse: () => const SizedBox(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
