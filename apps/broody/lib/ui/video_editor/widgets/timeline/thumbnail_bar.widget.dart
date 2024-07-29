import 'package:broody/ui/theme/transitions.dart';
import 'package:broody/ui/video_editor/widgets/timeline/providers/request/thumbnail_request.dart';
import 'package:broody/ui/video_editor/widgets/timeline/providers/thumbnail_viewer.provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThumbnailBar extends HookConsumerWidget {
  const ThumbnailBar({
    Key? key,
    required this.videoPath,
    required this.videoDuration,
    required this.thumbnailWidth,
    required this.thumbnailHeight,
    required this.thumbnailCount,
    required this.placeholder,
  }) : super(key: key);

  final String videoPath;
  final Duration videoDuration;
  final int thumbnailHeight;
  final int thumbnailWidth;
  final int thumbnailCount;
  final Widget placeholder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final request = ThumbnailRequest(
      videoPath: videoPath,
      videoDuration: videoDuration,
      thumbnailHeight: thumbnailHeight * 2,
      aspectRatio: thumbnailWidth / thumbnailHeight,
      quality: 50,
      thumbnailCount: thumbnailCount,
    );
    final thumbnails = ref.watch(thumbnailListProvider(request));
    return SizedBox(
      height: thumbnailHeight.toDouble(),
      child: thumbnails.maybeWhen(
        data: (thumbnails) {
          return OverflowBox(
            maxWidth: thumbnailWidth * thumbnailCount.toDouble(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < thumbnailCount; i++)
                  SizedBox(
                      height: thumbnailHeight.toDouble(),
                      width: thumbnailWidth.toDouble(),
                      child: Stack(
                        children: [
                          Positioned.fill(child: placeholder),
                          if (i < thumbnails.length)
                            TweenAnimationBuilder<double>(
                              duration: kThemeAnimationDuration,
                              tween: tween01,
                              builder: (context, value, child) => Opacity(
                                opacity: value,
                                child: child,
                              ),
                              child: Image.memory(
                                thumbnails[i],
                                gaplessPlayback: true,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            ),
                        ],
                      )),
              ],
            ),
          );
        },
        orElse: () => Container(),
      ),
    );
  }
}
