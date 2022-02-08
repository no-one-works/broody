import 'dart:io';
import 'dart:math';

import 'package:broody/core/extensions/video_player_controller.x.dart';
import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/model/entry/entry.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/service/providers/entry.providers.dart';
import 'package:broody/service/providers/video/video_gallery.providers.dart';
import 'package:broody/ui/shared/better_blob_clipper/better_blob_clipper.dart';
import 'package:broody/ui/shared/gallery_video/video_thumbnail.widget.dart';
import 'package:broody/ui/shared/providers/blob/blob.provider.dart';
import 'package:broody/ui/shared/providers/blob/request/blob_request.dart';
import 'package:broody/ui/shared/providers/color/color.providers.dart';
import 'package:broody/ui/shared/providers/color/request/color_scheme_request.dart';
import 'package:broody/ui/shared/tween_animation_builder_delay/tween_animation_builder_delay.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:broody/ui/theme/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

const _animationDelay = Duration(milliseconds: 1000);
const _animationDelay2 = Duration(milliseconds: 500);

class DayPage extends HookConsumerWidget {
  const DayPage({
    Key? key,
    required this.date,
    required this.entry,
    required this.pageOffset,
    required this.dismissProgress,
    required this.muted,
  }) : super(key: key);

  final SavedEntry? entry;
  final DateTime date;
  final double pageOffset;
  final double dismissProgress;
  final bool muted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = useTextTheme();
    final themeColorScheme = useColorScheme();
    final blobId =
        ref.watch(blobProvider(BlobRequest(day: date.day, month: date.month)));
    // On Android, we only load the VideoController once we are exactly on the right page
    final loadVideoController =
        (pageOffset == 0 || !Platform.isAndroid && pageOffset.round() == 0);

    final videoControllerAsync = entry != null && loadVideoController
        ? ref.watch(entryVideoControllerProvider(entry!))
        : null;

    final blurHashImage = entry != null ? BlurHashImage(entry!.blurHash) : null;

    final videoController = videoControllerAsync?.asData?.value;

    final dateFormat = useDateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY);

    final videoVolume =
        muted ? 0.0 : 1.0 - max(dismissProgress, pageOffset.abs());
    final dismissing = pageOffset != 0 || dismissProgress > 0;

    useEffect(() {
      if (videoController != null) {
        videoController.setVolume(Curves.easeIn.transform(videoVolume));
      }
    }, [videoController, videoVolume]);

    final entryColorScheme = entry == null
        ? null
        : ref.watch(
            colorSchemeProvider(
              ColorSchemeRequest.entry(
                entry: entry!,
                projectColor: themeColorScheme.primary,
                brightness: themeColorScheme.brightness,
              ),
            ),
          );
    final colorScheme = entryColorScheme ?? themeColorScheme;
    final textColor = colorScheme.secondary;

    _precacheGalleryVideos(ref);

    return GestureDetector(
      onTap: () => videoController?.togglePlayback(),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Align(
            alignment: const Alignment(-1, -0.5),
            child: Padding(
              padding: const EdgeInsets.only(left: Spacers.xl),
              child: AnimatedDefaultTextStyle(
                duration: kThemeAnimationDuration,
                style: textTheme.headline3!.copyWith(color: textColor),
                child: Transform.translate(
                  offset: Offset(pageOffset * -Spacers.x4l, 0),
                  child: Text(
                    dateFormat.format(date),
                  ),
                ),
              ),
            ),
          ),
          TweenAnimationBuilderDelay<double>(
            delayOnlyOnce: true,
            delay: entry == null ? Duration.zero : _animationDelay,
            duration: _animationDelay2,
            tween: tween01,
            curve: Curves.easeOutQuint,
            builder: (context, value, child) => Opacity(
              opacity: value,
              child: child,
            ),
            child: TweenAnimationBuilderDelay<double>(
              duration: const Duration(milliseconds: 700),
              curve: Curves.ease,
              delay: _animationDelay + _animationDelay2,
              tween: Tween(
                begin: 1,
                end: entry == null || videoController == null || dismissing
                    ? 1
                    : 8,
              ),
              builder: (context, value, child) => ClipPath(
                clipper: BetterBlobClipper(
                  id: blobId,
                  scale: value,
                ),
                child: child,
              ),
              child: entry == null
                  ? Hero(
                      tag: date,
                      child: Material(
                        color: themeColorScheme.secondaryContainer,
                        child: InkWell(
                          onTap: () => context.router.navigate(
                            VideoPickerRoute(forDate: date),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add_rounded,
                              color: colorScheme.secondary,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Stack(
                      fit: StackFit.expand,
                      children: [
                        FittedBox(
                          fit: BoxFit.cover,
                          child: Hero(
                            tag: entry!.assetEntityId,
                            flightShuttleBuilder: fadeShuttle,
                            createRectTween: linearRectTween,
                            transitionOnUserGestures: true,
                            child: VideoAndThumbnail(
                              size: Size(
                                entry!.width.toDouble(),
                                entry!.height.toDouble(),
                              ),
                              videoPlayerController: videoController,
                              thumbnail: blurHashImage,
                            ),
                          ),
                        ),
                        if (videoController != null)
                          HookBuilder(builder: (context) {
                            final isPlaying =
                                useListenable(videoController).value.isPlaying;
                            return Positioned(
                              bottom: Spacers.m +
                                  MediaQuery.of(context).padding.bottom,
                              left: Spacers.m,
                              child: Material(
                                color: colorScheme.primary,
                                shape: const CircleBorder(),
                                child: AnimatedSwitcher(
                                  duration: kThemeAnimationDuration,
                                  transitionBuilder: (child, animation) =>
                                      ScaleTransition(
                                    scale: animation,
                                    child: child,
                                  ),
                                  switchInCurve: Curves.ease,
                                  child: IconButton(
                                    key: ValueKey(isPlaying),
                                    splashRadius: Spacers.l,
                                    color: colorScheme.onPrimary,
                                    onPressed: () =>
                                        videoController.togglePlayback(),
                                    icon: Icon(
                                      isPlaying
                                          ? Icons.pause_rounded
                                          : Icons.play_arrow_rounded,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                      ],
                    ),
            ),
          ),
          if (entry != null)
            TweenAnimationBuilderDelay<double>(
              tween: Tween(begin: 1, end: videoController == null ? 1 : 0),
              delay: _animationDelay,
              duration: _animationDelay2,
              builder: (context, value, child) => Opacity(
                opacity: value,
                child: child,
              ),
              child: Hero(
                tag: pageOffset.round() == 0 ? entry!.day : "",
                child: ClipPath(
                  clipper: BetterBlobClipper(id: blobId),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: entry!.width.toDouble(),
                      height: entry!.height.toDouble(),
                      child: Image(
                        fit: BoxFit.fill,
                        image: blurHashImage!,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          if (videoControllerAsync is AsyncError)
            Center(
              child: Material(
                color: colorScheme.error,
                elevation: 2,
                shape: const CircleBorder(),
                child: Padding(
                  padding: const EdgeInsets.all(Spacers.xxs),
                  child: Icon(
                    Icons.error_rounded,
                    color: colorScheme.onError,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }

  void _precacheGalleryVideos(WidgetRef ref) {
    ref.watch(videosProvider(date));
  }
}
