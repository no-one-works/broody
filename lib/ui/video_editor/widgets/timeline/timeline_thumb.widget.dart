import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/ui/shared/video_progress_builder/video_progress_builder.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

class TimelineThumb extends HookConsumerWidget {
  const TimelineThumb({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = useColorScheme();
    final duration = useValueListenable(controller).duration;
    return VideoProgressBuilder(
      controller: controller,
      builder: (context, position, child) {
        final relativeValue = position.inMilliseconds / duration.inMilliseconds;
        return LayoutBuilder(
          builder: (context, constraints) => Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                left: relativeValue * (constraints.maxWidth),
                top: 0,
                bottom: 0,
                child: child!,
              )
            ],
          ),
        );
      },
      child: Card(
        elevation: 4,
        color: colorScheme.primaryContainer,
        margin: const EdgeInsets.symmetric(
          horizontal: Spacers.xxs,
          vertical: Spacers.xxs,
        ),
        child: const SizedBox(
          width: Spacers.xxs,
        ),
      ),
    );
  }
}
