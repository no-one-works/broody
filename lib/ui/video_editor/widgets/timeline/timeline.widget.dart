import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_state_notifier.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/service/providers/onboarding.providers.dart';
import 'package:broody/ui/shared/providers/video_tile.providers.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:broody/ui/video_editor/state/video_editor_state.dart';
import 'package:broody/ui/video_editor/video_editor.notifier.dart';
import 'package:broody/ui/video_editor/widgets/timeline/thumbnail_bar.widget.dart';
import 'package:broody/ui/video_editor/widgets/timeline/timeline_thumb.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Timeline extends HookConsumerWidget {
  const Timeline({
    Key? key,
    required this.editorNotifier,
    this.height = 64,
    this.quality = 50,
  }) : super(key: key);

  final VideoEditorNotifier editorNotifier;
  final double height;
  final int quality;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final state = useStateNotifier(editorNotifier);
    final textTheme = useTextTheme();
    final colorScheme = useColorScheme();

    final knowsTimeline = ref.watch(
        onboardingConfigProvider.select((o) => o.value?.knowsTimeline ?? true));

    return state.maybeMap(
      editing: (state) {
        final duration = state.videoController.value.duration;

        final assetThumbnail =
            ref.watch(galleryVideoThumbnailProvider(state.assetEntity));
        final relativeClipStart =
            state.entry.startPoint.inMilliseconds / duration.inMilliseconds;
        final relativeClipDuration =
            state.entry.duration.inMilliseconds / duration.inMilliseconds;
        final relativeLastStartPoint =
            (duration - state.entry.duration).inMilliseconds /
                duration.inMilliseconds;
        final relativeSeekPosition =
            state.seekPosition.inMilliseconds / duration.inMilliseconds;

        final scrollController = useScrollController();
        final animationController = useAnimationController(
            duration: duration,
            lowerBound: 0,
            upperBound: 1,
            initialValue: relativeClipStart,
            keys: [
              state.entry.startPoint,
            ]);

        useEffect(() {
          void jumpToValue() {
            if (scrollController.positions.isNotEmpty) {
              scrollController.jumpTo(
                ((animationController.value - relativeClipDuration) /
                            relativeLastStartPoint)
                        .clamp(0, 1) *
                    scrollController.position.maxScrollExtent,
              );
            }
          }

          if (state.previewing) {
            animationController.addListener(jumpToValue);
            return () => animationController.removeListener(jumpToValue);
          }
          return null;
        }, [animationController, state.previewing]);

        useEffect(() {
          if (state.isPlaying) {
            animationController.forward(from: relativeSeekPosition);
          }
          return null;
        }, [state.seekPosition, state.isPlaying]);

        final aspectRatio =
            ref.watch(assetEntitySizeProvider(state.assetEntity)).aspectRatio;
        final thumbnailWidth = height * aspectRatio;

        return LayoutBuilder(
          builder: (context, constraints) {
            final totalWidth = (duration.inMilliseconds /
                    state.entry.duration.inMilliseconds) *
                constraints.maxWidth;
            final thumbnailCount = (totalWidth / thumbnailWidth).ceil();
            final isMinLength = totalWidth <= constraints.maxWidth;
            return Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                GestureDetector(
                  onTapDown: isMinLength
                      ? (_) {
                          editorNotifier.pause();
                          animationController.stop();
                        }
                      : null,
                  onTapUp: isMinLength ? (_) => editorNotifier.loop() : null,
                  onTapCancel: isMinLength ? () => editorNotifier.loop() : null,
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (n) => state.previewing
                        ? _onScrollNotificationPreview(n, animationController)
                        : _onScrollNotification(n, animationController, state),
                    child: SizedBox(
                      height: height,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.none,
                        child: SizedBox(
                          width: totalWidth,
                          child: Stack(
                            children: [
                              AnimatedOpacity(
                                opacity: state.dismissProgress > 0
                                    ? 0
                                    : state.isPlaying
                                        ? 0.5
                                        : 1,
                                curve: Curves.ease,
                                duration: kThemeAnimationDuration,
                                child: ThumbnailBar(
                                  videoPath: state.entry.videoPath,
                                  videoDuration: duration,
                                  thumbnailWidth: thumbnailWidth.toInt(),
                                  thumbnailHeight: height.toInt(),
                                  thumbnailCount: thumbnailCount,
                                  placeholder: assetThumbnail.maybeWhen(
                                    data: (img) => Image(image: img),
                                    orElse: () => Container(),
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: TimelineThumb(
                                  controller: state.videoController,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  duration: kThemeAnimationDuration,
                  opacity: state.isPlaying ? 0 : 1,
                  curve: Curves.ease,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: FractionalTranslation(
                      translation: const Offset(0, -1),
                      child: MediaQuery.removePadding(
                        context: context,
                        child: Card(
                          elevation: 0,
                          color: colorScheme.surface,
                          margin: const EdgeInsets.only(
                            left: Spacers.xs,
                            bottom: Spacers.xs,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Spacers.xxs,
                              vertical: 2,
                            ),
                            child: Text(
                              state.entry.startPoint
                                  .toString()
                                  .substring(2, 10),
                              style: textTheme.subtitle2!
                                  .copyWith(color: colorScheme.onSurface),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //Timeline Onboarding
                Positioned.fill(
                  child: IgnorePointer(
                    child: Center(
                      child: AnimatedOpacity(
                        duration: kThemeAnimationDuration,
                        opacity: !knowsTimeline && state.isPlaying ? 1 : 0,
                        curve: Curves.ease,
                        child: MediaQuery.removePadding(
                          context: context,
                          child: Card(
                            elevation: 0,
                            color: colorScheme.surface,
                            margin: const EdgeInsets.all(Spacers.s),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: Spacers.xxs,
                                vertical: 2,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.arrow_left_rounded),
                                  Flexible(
                                    child: Text(l10n.timelineOnboarding),
                                  ),
                                  const Icon(Icons.arrow_right_rounded),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        );
      },
      orElse: () => const SizedBox(),
    );
  }

  bool _onScrollNotificationPreview(
    ScrollNotification notification,
    AnimationController controller,
  ) {
    if (notification is ScrollStartNotification &&
        notification.dragDetails != null) {
      editorNotifier.pause();
      controller.stop();
    }
    return false;
  }

  bool _onScrollNotification(
    ScrollNotification notification,
    AnimationController controller,
    VideoEditorEditing state,
  ) {
    if (notification is ScrollStartNotification) {
      editorNotifier.pause();
    } else if (notification is ScrollEndNotification) {
      editorNotifier.loop();
    } else if (notification is ScrollUpdateNotification) {
      final seekingPointMillis = (state.videoController.value.duration -
                  state.entry.duration)
              .inMilliseconds *
          (notification.metrics.pixels / notification.metrics.maxScrollExtent)
              .clamp(0, 1);
      editorNotifier
          .setStartPoint(Duration(milliseconds: seekingPointMillis.toInt()));
    }
    return false;
  }
}
