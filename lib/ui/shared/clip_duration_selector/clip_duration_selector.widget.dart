import 'dart:math';

import 'package:broody/core/constants/clip_durations.dart';
import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ClipDurationSelector extends HookConsumerWidget {
  const ClipDurationSelector({
    Key? key,
    required this.selected,
    required this.onSelect,
  }) : super(key: key);

  final Duration selected;
  final Function(Duration?) onSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final colorScheme = useColorScheme();

    final animationController = useAnimationController();
    useEffect(() {
      animationController.reset();
      animationController.duration = selected;
      animationController.repeat();
    }, [animationController, selected]);

    final progressTween = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
    ));

    final progress = useAnimation(progressTween);
    return CupertinoSlidingSegmentedControl<Duration>(
        groupValue: selected,
        thumbColor: colorScheme.background,
        children: {
          laplaceLimitDuration: _buildItem(
              context,
              colorScheme,
              l10n.laplaceLimit,
              laplaceLimit,
              progress,
              selected == laplaceLimitDuration),
          goldenRatioDuration: _buildItem(
              context,
              colorScheme,
              l10n.goldenRatio,
              goldenRatio,
              progress,
              selected == goldenRatioDuration),
          piDuration: _buildItem(context, colorScheme, l10n.pi, pi, progress,
              selected == piDuration),
        },
        onValueChanged: onSelect);
  }

  Widget _buildItem(BuildContext context, ColorScheme colorScheme, String name,
      double value, double progress, bool isSelected) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        vSpace(Spacers.xxs),
        Expanded(child: Text(name)),
        vSpace(Spacers.xxs),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.circular(4))),
          child: LinearProgressIndicator(
            minHeight: Spacers.xxs,
            backgroundColor:
                isSelected ? colorScheme.background : Colors.transparent,
            color: isSelected ? colorScheme.primaryVariant : Colors.transparent,
            value: isSelected ? progress : 1,
          ),
        ),
      ],
    );
  }
}
