import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/service/providers/project.providers.dart';
import 'package:broody/ui/shared/bouncy_pressable/bouncy_pressable.widget.dart';
import 'package:broody/ui/shared/constants/date_formats.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:broody/ui/theme/transitions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProjectNotStarted extends HookConsumerWidget {
  const ProjectNotStarted({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();
    final project = ref.watch(selectedProjectProvider)!;
    final dateFormat = useDateFormat(timeFormat);
    return Padding(
      padding: const EdgeInsets.all(Spacers.l),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            l10n.projectNotStartedDescription(
              project.startDate,
            ),
            textAlign: TextAlign.center,
          ),
          vSpace(Spacers.l),
          AnimatedSwitcher(
            duration: kThemeAnimationDuration,
            transitionBuilder: switcherFadeThroughTransition,
            child: BouncyPressable(
              key: ValueKey(project.notificationTime == null),
              child: CupertinoButton(
                child: project.notificationTime == null
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.notifications_rounded,
                            color: colorScheme.secondaryContainer,
                          ),
                          hSpace(Spacers.s),
                          Text(
                            l10n.projectNotStartedReminderButton,
                            style: textTheme.bodyLarge!
                                .copyWith(color: colorScheme.onPrimary),
                          ),
                        ],
                      )
                    : Text(
                        l10n.projectNotStartedReminderDescription(
                          dateFormat.format(project.notificationTime!),
                        ),
                        textAlign: TextAlign.center,
                      ),
                color: project.notificationTime == null
                    ? colorScheme.primary
                    : null,
                onPressed: () {
                  context.router.navigate(
                      ProjectDetailsRoute(projectToEdit: project.uid));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
