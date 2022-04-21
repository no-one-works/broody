import 'dart:io';

import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:loading_value/loading_value.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/service/providers/video/video_gallery.providers.dart';
import 'package:broody/ui/shared/gallery_video/gallery_video.widget.dart';
import 'package:broody/ui/shared/loading_value_progress_bar/loading_value_progress_bar.widget.dart';
import 'package:broody/ui/shared/providers/video_tile.providers.dart';
import 'package:broody/ui/theme/transitions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';

class LoadingFromCloudPage extends HookConsumerWidget {
  const LoadingFromCloudPage({
    Key? key,
    required this.assetEntity,
  }) : super(key: key);
  final AssetEntity assetEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final colorScheme = useColorScheme();
    final pickedVideoAsync = ref.watch(pickedVideoProvider(assetEntity));
    ref.listen<LoadingValue<File>>(pickedVideoProvider(assetEntity),
        (prev, next) {
      next.whenOrNull(
        data: (file) {
          ref.refresh(galleryVideoIsLocalProvider(assetEntity));
          ref.refresh(assetEntityFileProvider(assetEntity));
          ref.refresh(galleryVideoControllerProvider(assetEntity));
          context.router.replace(VideoEditorRoute(assetEntity: assetEntity));
        },
        error: (_, __) => context.router.pop(),
      );
    });
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(),
        body: Stack(
          fit: StackFit.expand,
          children: [
            FittedBox(
              fit: BoxFit.cover,
              child: Hero(
                tag: assetEntity.id,
                createRectTween: linearRectTween,
                child: GalleryVideo(
                  assetEntity: assetEntity,
                  loadVideo: false,
                  overlayColor: colorScheme.surface.withOpacity(0.8),
                ),
              ),
            ),
            Center(
              child: LoadingValueProgressBar(
                loadingValue: pickedVideoAsync,
                description: l10n.downloadingVideo,
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ));
  }
}
