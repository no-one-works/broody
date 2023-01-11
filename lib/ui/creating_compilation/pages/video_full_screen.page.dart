import 'package:broody/core/extensions/video_player_controller.x.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/core/hook/use_wakelock.hook.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/ui/creating_compilation/widgets/video_controls.widget.dart';
import 'package:broody/ui/shared/interactive_viewer_plus/widgets/custom_dismissible.widget.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:broody/ui/theme/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

class VideoFullScreenPage extends HookConsumerWidget {
  const VideoFullScreenPage({
    Key? key,
    required this.controller,
  }) : super(key: key);
  static const String heroTag = "videoFullScreen";
  static const String controlsHeroTag = "videoFullScreenControls";
  static const String fullscreenHeroTag = "videoFullScreenFullScreen";
  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = useTheme();
    final timer = useAnimationController(duration: const Duration(seconds: 2))
      ..forward();

    final interacting = useState(false);
    final controlsVisible = useValueListenable(timer) != 1 || interacting.value;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: CustomDismissible(
        onDismissed: context.router.pop,
        child: GestureDetector(
          onTap: () {
            if (timer.value != 1) {
              timer.stop();
              timer.value = 1;
            } else {
              timer.forward(from: 0);
            }
          },
          onDoubleTap: () => Navigator.pop(context),
          child: Stack(
            fit: StackFit.expand,
            children: [
              FittedBox(
                fit: BoxFit.cover,
                child: Hero(
                  tag: heroTag,
                  createRectTween: linearRectTween,
                  child: SizedBox(
                    width: controller.value.size.width,
                    height: controller.value.size.height,
                    child: VideoPlayer(controller),
                  ),
                ),
              ),
              Positioned(
                top: Spacers.s,
                right: Spacers.s,
                child: SafeArea(
                  child: Hero(
                    tag: fullscreenHeroTag,
                    child: AnimatedOpacity(
                      duration: kThemeAnimationDuration,
                      opacity: controlsVisible ? 1 : 0,
                      child: Card(
                        color: theme.colorScheme.secondary,
                        shape: const CircleBorder(),
                        child: IconButton(
                          onPressed: context.router.pop,
                          style: IconButton.styleFrom(
                            visualDensity: VisualDensity.compact,
                            foregroundColor: theme.colorScheme.onSecondary,
                          ),
                          icon: const Icon(Icons.fullscreen_exit_rounded),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: Spacers.m,
                left: Spacers.m,
                right: Spacers.m,
                child: AnimatedOpacity(
                  duration: kThemeAnimationDuration,
                  opacity: controlsVisible ? 1 : 0,
                  child: SafeArea(
                    child: Hero(
                      tag: controlsHeroTag,
                      child: Listener(
                        onPointerDown: (_) => interacting.value = true,
                        onPointerCancel: (_) => _pointerUp(interacting, timer),
                        onPointerUp: (_) => _pointerUp(interacting, timer),
                        child: VideoControls(
                          controller: controller,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _pointerUp(
    ValueNotifier<bool> interactingNotifier,
    AnimationController timer,
  ) {
    timer.forward(from: 0);
    interactingNotifier.value = false;
  }
}
