import 'package:broody/service/providers/video/video_gallery.providers.dart';
import 'package:broody/ui/shared/gallery_video/video_thumbnail.widget.dart';
import 'package:broody/ui/shared/providers/video_tile.providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';

class GalleryVideo extends HookConsumerWidget {
  const GalleryVideo({
    Key? key,
    required this.assetEntity,
    this.overlayColor = Colors.transparent,
    this.fit = BoxFit.contain,
    this.loadVideo = true,
    this.showProgressIndicator = false,
  }) : super(key: key);

  final AssetEntity assetEntity;
  final Color overlayColor;
  final BoxFit fit;
  final bool loadVideo;
  final bool showProgressIndicator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoControllerAsync = loadVideo
        ? ref.watch(galleryVideoControllerProvider(assetEntity))
        : null;
    final thumbnailImageAsync =
        ref.watch(galleryVideoThumbnailProvider(assetEntity));
    final videoController = videoControllerAsync?.asData?.value;
    final spinner =
        showProgressIndicator && loadVideo && videoController == null;
    return Stack(
      children: [
        VideoAndThumbnail(
          fit: fit,
          size: ref.watch(assetEntitySizeProvider(assetEntity)),
          videoPlayerController: videoController,
          thumbnail: thumbnailImageAsync.value,
          overlayColor: overlayColor,
        ),
        if (spinner)
          const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
      ],
    );
  }
}
