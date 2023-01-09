import 'dart:io';

import 'package:broody/core/extensions/video_player_controller.x.dart';
import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/ui/creating_compilation/pages/video_full_screen.page.dart';
import 'package:broody/ui/creating_compilation/widgets/video_controls.widget.dart';
import 'package:broody/ui/shared/interactive_viewer_plus/widgets/custom_dismissible.widget.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:broody/ui/theme/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

class CompilationSuccessWidget extends HookWidget {
  const CompilationSuccessWidget({
    required this.width,
    required this.height,
    required this.videoController,
    required this.onSaveToGallery,
    required this.onShare,
    Key? key,
  }) : super(key: key);

  final double width;
  final double height;
  final VideoPlayerController videoController;
  final VoidCallback onSaveToGallery;
  final VoidCallback onShare;
  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final theme = useTheme();
    return SafeArea(
      child: Column(
        children: [
          vSpace(Spacers.l),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacers.xl),
              child: CustomDismissible(
                onDismissed: context.router.pop,
                child: Stack(
                  children: [
                    Hero(
                      tag: VideoFullScreenPage.heroTag,
                      createRectTween: linearRectTween,
                      child: Card(
                        elevation: 24,
                        clipBehavior: Clip.hardEdge,
                        color: theme.colorScheme.secondary,
                        shadowColor: theme.colorScheme.shadow,
                        child: AspectRatio(
                          aspectRatio: width / height,
                          child: VideoPlayer(
                            videoController,
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: InkWell(
                        onTap: () => videoController.togglePlayback(),
                      ),
                    ),
                    Positioned(
                      bottom: Spacers.m,
                      left: Spacers.m,
                      right: Spacers.m,
                      child: Hero(
                        tag: VideoFullScreenPage.controlsHeroTag,
                        child: VideoControls(
                          controller: videoController,
                        ),
                      ),
                    ),
                    Positioned(
                      top: Spacers.xs,
                      right: Spacers.xs,
                      child: Hero(
                        tag: VideoFullScreenPage.fullscreenHeroTag,
                        child: Material(
                          color: Colors.transparent,
                          child: IconButton(
                            splashRadius: Spacers.l,
                            color: theme.colorScheme.surface,
                            icon: const Icon(Icons.fullscreen_rounded),
                            onPressed: () => context.router.push(
                              VideoFullScreenRoute(controller: videoController),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          vSpace(Spacers.l),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: onSaveToGallery,
                tooltip: l10n.saveToGallery,
                color: theme.colorScheme.primary,
                icon: const Icon(Icons.save_alt_rounded),
              ),
              hSpace(Spacers.l),
              IconButton(
                onPressed: onShare,
                tooltip: l10n.share,
                color: theme.colorScheme.primary,
                icon: theme.platform == TargetPlatform.iOS
                    ? const Icon(Icons.ios_share_rounded)
                    : const Icon(Icons.share_rounded),
              ),
            ],
          ),
          vSpace(Spacers.l)
        ],
      ),
    );
  }
}
