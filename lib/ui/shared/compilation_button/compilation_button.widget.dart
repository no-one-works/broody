import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/ui/shared/bouncy_pressable/bouncy_pressable.widget.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CompilationButton extends HookWidget {
  const CompilationButton({
    Key? key,
    required this.onPressed,
    this.monthOfYear,
  }) : super(key: key);

  final VoidCallback onPressed;
  final DateTime? monthOfYear;

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return BouncyPressable(
      child: CupertinoButton(
        color: colorScheme.secondary,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              monthOfYear == null
                  ? Icons.movie_filter_rounded
                  : Icons.movie_rounded,
              size: Spacers.m,
              color: colorScheme.secondaryContainer,
            ),
            hSpace(Spacers.s),
            Text(
              l10n.exportCompilation,
              style: textTheme.button!.copyWith(color: colorScheme.onSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
