import 'dart:math';

import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/ui/shared/bouncy_pressable/bouncy_pressable.widget.dart';
import 'package:broody/ui/theme/colors.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const double _size = 64;

class ProjectColorPicker extends HookConsumerWidget {
  const ProjectColorPicker({
    Key? key,
    required this.selected,
    required this.onSelect,
    this.padding = const EdgeInsets.symmetric(horizontal: Spacers.l),
  }) : super(key: key);
  final Color? selected;
  final Function(Color color)? onSelect;
  final EdgeInsets padding;

  final List<Color> colors = projectColors3;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = useColorScheme();

    useEffect(() {
      if (selected != null) return;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        onSelect?.call(colors[Random().nextInt(colors.length - 1)]);
      });
    }, [colors]);
    return LayoutBuilder(
      builder: (context, constraints) => HookBuilder(
        builder: (context) {
          final scrollController = useScrollController();
          useEffect(() {
            if (selected == null) return;
            if (!scrollController.hasClients) return;
            final selectedIndex = colors.indexOf(selected!);
            final scrollTarget = padding.left +
                selectedIndex * _size -
                constraints.maxWidth / 2 +
                0.5 * _size;
            scrollController.animateTo(
              scrollTarget.clamp(
                0,
                scrollController.position.maxScrollExtent,
              ),
              duration: kThemeAnimationDuration,
              curve: Curves.ease,
            );
          }, [scrollController, selected, scrollController.hasClients]);

          return SizedBox(
            height: _size,
            child: ListView.builder(
              padding: padding,
              controller: scrollController,
              itemBuilder: (context, index) {
                final scheme = ColorScheme.fromSeed(
                  seedColor: colors[index],
                  brightness: colorScheme.brightness,
                );

                return BouncyPressable(
                  pressedScale: 0.7,
                  onTap: () => onSelect?.call(colors[index]),
                  child: Center(
                    child: AnimatedPadding(
                      duration: kThemeAnimationDuration,
                      curve: Curves.ease,
                      padding: selected == colors[index]
                          ? const EdgeInsets.symmetric(
                              vertical: Spacers.s,
                              horizontal: 0,
                            )
                          : const EdgeInsets.symmetric(
                              vertical: Spacers.m,
                              horizontal: 0,
                            ),
                      child: Card(
                        margin: EdgeInsets.zero,
                        shadowColor: colorScheme.shadow,
                        elevation: selected == colors[index] ? 4 : 0,
                        color: scheme.inversePrimary,
                        shape: const CircleBorder(),
                        child: const SizedBox(
                          width: _size,
                          height: _size,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: colors.length,
              scrollDirection: Axis.horizontal,
            ),
          );
        },
      ),
    );
  }
}
