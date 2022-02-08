import 'package:blur/blur.dart';
import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

class VideoAndThumbnail extends HookConsumerWidget {
  const VideoAndThumbnail({
    Key? key,
    required this.size,
    required this.videoPlayerController,
    required this.thumbnail,
    this.blur = 20,
    this.fit = BoxFit.contain,
    this.overlayColor = Colors.transparent,
  }) : super(key: key);

  final BoxFit fit;
  final Size size;
  final double blur;
  final VideoPlayerController? videoPlayerController;
  final ImageProvider? thumbnail;
  final Color overlayColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    return FittedBox(
      fit: fit,
      alignment: Alignment.center,
      child: SizedBox.fromSize(
        size: size,
        child: Stack(
          children: [
            if (thumbnail != null)
              SizedBox.expand(
                child: Image(
                  fit: BoxFit.fill,
                  image: thumbnail!,
                  gaplessPlayback: true,
                ),
              ),
            if (videoPlayerController != null)
              VideoPlayer(
                videoPlayerController!,
              ),
            AnimatedOpacity(
              duration: kThemeAnimationDuration,
              opacity: videoPlayerController != null ? 0 : 1,
              child: thumbnail != null
                  ? TweenAnimationBuilder(
                      tween: ColorTween(begin: overlayColor, end: overlayColor),
                      duration: kThemeAnimationDuration,
                      builder: (context, Color? color, child) => Blur(
                        child: child!,
                        blur: blur,
                        blurColor: color!,
                        colorOpacity: color.opacity,
                      ),
                      child: SizedBox.expand(
                        child: Image(
                          fit: BoxFit.fill,
                          image: thumbnail!,
                          gaplessPlayback: true,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
