import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VideoOrientationPicker extends HookConsumerWidget {
  const VideoOrientationPicker({
    Key? key,
    required this.selected,
    required this.onSelect,
  }) : super(key: key);

  final bool selected;
  final Function(bool? poratrait) onSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final colorScheme = useColorScheme();

    return CupertinoSlidingSegmentedControl<bool>(
        groupValue: selected,
        thumbColor: colorScheme.background,
        children: {
          true: _buildItem(
            context,
            colorScheme,
            l10n.portrait,
            Icons.stay_current_portrait_rounded,
            selected,
          ),
          false: _buildItem(
            context,
            colorScheme,
            l10n.landscape,
            Icons.stay_current_landscape_rounded,
            !selected,
          ),
        },
        onValueChanged: onSelect);
  }

  Widget _buildItem(BuildContext context, ColorScheme colorScheme, String name,
      IconData iconData, bool isSelected) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedSwitcher(
            key: ValueKey(isSelected),
            duration: kThemeAnimationDuration,
            child: Icon(
              iconData,
              color:
                  isSelected ? colorScheme.primary : colorScheme.onBackground,
            )),
        hSpace(Spacers.s),
        Text(name),
      ],
    );
  }
}
