import 'package:blur/blur.dart';
import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/service/providers/project/project.providers.dart';
import 'package:broody/ui/shared/compilation_button/compilation_button.widget.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:broody/ui/theme/transitions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MonthCompleteInfoPage extends HookConsumerWidget {
  const MonthCompleteInfoPage({
    Key? key,
    required this.monthOfYear,
  }) : super(key: key);

  final DateTime monthOfYear;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final textTheme = useTextTheme();
    final nameOfMonth =
        useDateFormat().dateSymbols.MONTHS[monthOfYear.month - 1];
    final colorScheme = useColorScheme();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(Spacers.x2l),
        child: TweenAnimationBuilder<double>(
          duration: kThemeAnimationDuration * 5,
          tween: tween01,
          curve: Curves.elasticOut,
          builder: (context, value, child) => Transform.scale(
            scale: value,
            child: Opacity(
              opacity: value.clamp(0, 1),
              child: child,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.celebration_rounded),
                  hSpace(Spacers.s),
                  Text(
                    l10n.monthComplete(nameOfMonth),
                    style: textTheme.headline5,
                  ),
                ],
              ),
              vSpace(Spacers.s),
              Text(
                l10n.monthCompleteText,
                style: textTheme.subtitle2,
              ),
              vSpace(Spacers.l),
              CompilationButton(
                monthOfYear: monthOfYear,
                onPressed: () => context.router.replace(
                  CreateCompilationRoute(
                    projectUid: ref.read(selectedProjectProvider)!.uid,
                    monthOfYear: monthOfYear,
                  ),
                ),
              ),
              vSpace(Spacers.s),
              Center(
                child: CupertinoButton(
                  child: Text(l10n.maybeLater),
                  onPressed: () => context.router.pop(),
                ),
              ),
            ],
          ),
        ),
      ),
    ).frosted(
      blur: Spacers.x2l,
      frostColor: colorScheme.background,
    );
  }
}
