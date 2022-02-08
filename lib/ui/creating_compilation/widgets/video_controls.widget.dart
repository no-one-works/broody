import 'package:broody/core/extensions/video_player_controller.x.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/ui/shared/video_progress_builder/video_progress_builder.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

class VideoControls extends HookWidget {
  const VideoControls({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final value = useValueListenable(controller);
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Card(
            margin: EdgeInsets.zero,
            color: colorScheme.secondary,
            clipBehavior: Clip.hardEdge,
            shape: const CircleBorder(),
            child: IconButton(
              onPressed: () => controller.togglePlayback(),
              color: colorScheme.onSecondary,
              icon: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: value.isPlaying ? 1 : 0),
                duration: kThemeAnimationDuration,
                curve: Curves.ease,
                builder: (context, value, child) => AnimatedIcon(
                  progress: AlwaysStoppedAnimation(value),
                  icon: AnimatedIcons.play_pause,
                ),
              ),
            ),
          ),
          Expanded(
            child: VideoProgressBuilder(
              controller: controller,
              builder: (context, position, child) => Slider(
                thumbColor: colorScheme.secondaryContainer,
                activeColor: colorScheme.secondary,
                inactiveColor: colorScheme.secondary.withOpacity(0.5),
                onChangeStart: (_) => controller.pause(),
                onChangeEnd: (_) => controller.play(),
                onChanged: (value) =>
                    controller.seekTo(Duration(milliseconds: value.toInt())),
                value: position.inMilliseconds.toDouble(),
                min: 0,
                max: value.duration.inMilliseconds.toDouble(),
              ),
            ),
          ),
          Card(
            color: colorScheme.secondary,
            elevation: 0,
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacers.xxs),
              child: Text(
                value.position.toString().substring(2, 7),
                style: useTextTheme().button!.copyWith(
                      color: colorScheme.onSecondary,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
