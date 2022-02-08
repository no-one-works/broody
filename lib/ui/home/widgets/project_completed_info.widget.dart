import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/service/providers/project.providers.dart';
import 'package:broody/ui/shared/bouncy_pressable/bouncy_pressable.widget.dart';
import 'package:broody/ui/shared/compilation_button/compilation_button.widget.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProjectCompletedInfo extends HookConsumerWidget {
  const ProjectCompletedInfo({
    Key? key,
    required this.hasEnded,
    required this.isComplete,
    required this.datesCount,
    required this.entriesCount,
  }) : super(key: key);
  final bool hasEnded;
  final bool isComplete;
  final int datesCount;
  final int entriesCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();
    final readOnly = ref.watch(selectedProjectReadOnlyProvider);
    return Padding(
      padding: const EdgeInsets.all(Spacers.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (readOnly)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(l10n.readOnlyModeDescription),
                vSpace(Spacers.m),
                BouncyPressable(
                  child: CupertinoButton(
                    color: colorScheme.secondaryContainer,
                    onPressed: () => context.router.navigate(
                      UpdateEntriesRoute(
                          project: ref.read(selectedProjectProvider)!),
                    ),
                    //color: colorScheme.primary,
                    child: Text(
                      l10n.outdatedEntriesOk,
                      style: textTheme.bodyLarge
                          ?.copyWith(color: colorScheme.secondary),
                    ),
                  ),
                ),
                vSpace(Spacers.s),
              ],
            ),
          if (entriesCount > 0 &&
              entriesCount < datesCount &&
              hasEnded &&
              !readOnly)
            Text(l10n.projectEndedDescription(datesCount - entriesCount)),
          if (isComplete && !readOnly) Text(l10n.projectDoneDescription),
          if (!readOnly) vSpace(Spacers.s),
          if (entriesCount > 0 && (hasEnded || isComplete))
            CompilationButton(
              onPressed: () => context.router.navigate(
                CreateCompilationRoute(
                    projectUid: ref.read(selectedProjectProvider)!.uid),
              ),
            ),
        ],
      ),
    );
  }
}
