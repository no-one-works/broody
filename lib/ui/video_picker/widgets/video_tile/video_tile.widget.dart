import 'dart:io';
import 'dart:ui';

import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/service/providers/video/video_gallery.providers.dart';
import 'package:broody/ui/shared/bouncy_pressable/bouncy_pressable.widget.dart';
import 'package:broody/ui/shared/constants/date_formats.dart';
import 'package:broody/ui/shared/gallery_video/gallery_video.widget.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:broody/ui/theme/transitions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';

class VideoTile extends HookConsumerWidget {
  const VideoTile({
    Key? key,
    required this.assetEntity,
    required this.loadVideo,
    required this.distanceFromCenter,
  }) : super(key: key);

  final AssetEntity assetEntity;
  final bool loadVideo;
  final double distanceFromCenter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = useTextTheme();
    final colorScheme = useColorScheme();
    final dateFormat = useDateFormat(timeFormat);
    final localAsync = ref.watch(galleryVideoIsLocalProvider(assetEntity));
    final distanceFromCenterAbs = distanceFromCenter.abs();
    final opacity = 1 - distanceFromCenterAbs * 0.5;
    final align =
        Platform.isIOS ? -1 * distanceFromCenter : 1 * distanceFromCenter;

    return Align(
      alignment: Alignment(0, align),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacers.l,
          vertical: Spacers.xs,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).viewPadding.top,
                bottom: Spacers.m,
              ),
              child: Opacity(
                opacity: opacity,
                child: Text(
                  dateFormat.format(assetEntity.createDateTime),
                  style: textTheme.headline6,
                ),
              ),
            ),
            Flexible(
              child: Hero(
                tag: assetEntity.id,
                flightShuttleBuilder: fadeShuttle,
                createRectTween: linearRectTween,
                transitionOnUserGestures: true,
                child: AnimatedSize(
                  duration: kThemeAnimationDuration,
                  child: BouncyPressable(
                    child: Material(
                      animationDuration: Duration.zero,
                      elevation: 24 - distanceFromCenterAbs * 24,
                      color: colorScheme.background,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: AspectRatio(
                        aspectRatio: ref
                            .watch(assetEntitySizeProvider(assetEntity))
                            .aspectRatio,
                        child: Stack(
                          children: [
                            Opacity(
                              opacity: opacity,
                              child: GalleryVideo(
                                assetEntity: assetEntity,
                                loadVideo: loadVideo,
                                showProgressIndicator:
                                    localAsync.value ?? false,
                                fit: BoxFit.cover,
                              ),
                            ),
                            AnimatedOpacity(
                              duration: kThemeAnimationDuration,
                              opacity: (localAsync.value ?? true) ? 0 : 1,
                              child: const SizedBox.expand(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    gradient: RadialGradient(
                                      center: Alignment.topRight,
                                      radius: 0.5,
                                      colors: [
                                        Colors.black26,
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: Spacers.l,
                              right: Spacers.l,
                              child: AnimatedOpacity(
                                duration: kThemeAnimationDuration,
                                opacity: (localAsync.value ?? true) ? 0 : 1,
                                child: const Icon(
                                  Icons.cloud_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: Spacers.s,
                              right: Spacers.s,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Spacers.xxs, vertical: 2),
                                color: Colors.black54,
                                child: Text(
                                  assetEntity.videoDuration
                                      .toString()
                                      .split('.')
                                      .first
                                      .substring(2),
                                  style: textTheme.subtitle2!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor:
                                      colorScheme.primary.withOpacity(0.3),
                                  onTap: localAsync.value != null
                                      ? () => localAsync.value!
                                          ? context.router.push(
                                              VideoEditorRoute(
                                                  assetEntity: assetEntity),
                                            )
                                          : context.router.push(
                                              LoadingFromCloudRoute(
                                                  assetEntity: assetEntity),
                                            )
                                      : null,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
