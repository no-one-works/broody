import 'package:broody/core/extensions/video_player_controller.x.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
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
    final timer = useAnimationController(duration: const Duration(seconds: 2))
      ..forward();

    final interacting = useState(false);
    final controlsVisible = useValueListenable(timer) != 1 || interacting.value;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Hero(
            tag: fullscreenHeroTag,
            child: AnimatedOpacity(
              duration: kThemeAnimationDuration,
              opacity: controlsVisible ? 1 : 0,
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                  splashRadius: Spacers.l,
                  onPressed: context.router.pop,
                  color: useColorScheme().surface,
                  icon: const Icon(Icons.fullscreen_exit_rounded),
                ),
              ),
            ),
          )
        ],
      ),
      body: CustomDismissible(
        onDismissed: context.router.pop,
        child: GestureDetector(
          onTap: controller.togglePlayback,
          child: Listener(
            onPointerDown: (_) => interacting.value = true,
            onPointerCancel: (_) => _pointerUp(interacting, timer),
            onPointerUp: (_) => _pointerUp(interacting, timer),
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
                  bottom: Spacers.m,
                  left: Spacers.m,
                  right: Spacers.m,
                  child: AnimatedOpacity(
                    duration: kThemeAnimationDuration,
                    opacity: controlsVisible ? 1 : 0,
                    child: SafeArea(
                      child: Hero(
                        tag: controlsHeroTag,
                        child: VideoControls(
                          controller: controller,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _pointerUp(
      ValueNotifier<bool> interactingNotifier, AnimationController timer) {
    timer.forward(from: 0);
    interactingNotifier.value = false;
  }
}
