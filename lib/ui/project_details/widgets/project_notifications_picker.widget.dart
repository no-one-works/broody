import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_state_notifier.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/ui/project_details/project_details.notifier.dart';
import 'package:broody/ui/shared/constants/date_formats.dart';
import 'package:broody/ui/shared/dialogs/dialogs.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:broody/ui/theme/transitions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProjectNotificationsPicker extends HookConsumerWidget {
  const ProjectNotificationsPicker({
    Key? key,
    required this.notifier,
  }) : super(key: key);
  final ProjectDetailsNotifier notifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final colorScheme = useColorScheme();
    final state = useStateNotifier(notifier);
    final dateFormat = useDateFormat(timeFormat);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        vSpace(Spacers.l),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.dailyNotifications),
            Switch.adaptive(
              value: state.project.notificationTime != null,
              onChanged: (v) async {
                final success = await notifier.toggleNotifications(v);
                if (!success) {
                  showMissingNotificationPermissionDialog(context, ref);
                }
              },
              inactiveTrackColor: colorScheme.secondaryContainer,
              activeColor: colorScheme.primary,
            )
          ],
        ),
        vSpace(Spacers.xs),
        AnimatedSize(
          duration: kThemeAnimationDuration,
          child: AnimatedSwitcher(
            duration: kThemeAnimationDuration,
            transitionBuilder: switcherFadeThroughTransition,
            child: state.project.notificationTime != null
                ? SizedBox(
                    key: ValueKey(state.project.notificationTime != null),
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () async {
                        var time = await _pickTime(
                          context,
                          state.project.notificationTime != null
                              ? TimeOfDay.fromDateTime(
                                  state.project.notificationTime!)
                              : const TimeOfDay(hour: 12, minute: 0),
                        );
                        notifier.setNotificationTime(time);
                      },
                      child: Text(
                        dateFormat.format(state.project.notificationTime!),
                        key: ValueKey(state.project.notificationTime != null),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }

  Future<TimeOfDay?> _pickTime(BuildContext context, TimeOfDay initTime) async {
    return await showTimePicker(
      context: context,
      initialTime: initTime,
    );
  }
}
