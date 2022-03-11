import 'dart:io';

import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/service/providers/notification.providers.dart';
import 'package:broody/service/providers/project.providers.dart';
import 'package:broody/ui/home/widgets/home_app_bar.widget.dart';
import 'package:broody/ui/home/widgets/month_sliver_grid.widget.dart';
import 'package:broody/ui/home/widgets/project_completed_info.widget.dart';
import 'package:broody/ui/home/widgets/project_not_started.widget.dart';
import 'package:broody/ui/home/widgets/two_finger_drag.widget.dart';
import 'package:broody/ui/info/widgets/reveal_info.widget.dart';
import 'package:broody/ui/shared/record_button/record_button.widget.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    ref.watch(scheduleNotificationProvider(l10n));
    final colorScheme = useColorScheme();
    final project = ref.watch(selectedProjectProvider)!;
    final title = project.title;
    final dates = ref.watch(projectDatesProvider);
    final entriesCount = ref.watch(
      selectedProjectEntriesProvider.select((e) => e.value?.length ?? 0),
    );
    final readOnly = ref.watch(selectedProjectReadOnlyProvider);
    final hasEnded = ref.watch(projectHasEndedProvider(project));
    final isComplete = ref.watch(projectIsCompleteProvider(project));
    final datesPerMonth = useMemoized(
      () => groupBy(dates, (DateTime date) => date.month).values.toList(),
      [dates],
    );

    final showThumbnails = useState(false);
    final scrollController = useScrollController();

    final scrollToBottom = scrollController.positions.isNotEmpty &&
        !(hasEnded && entriesCount > 0) &&
        !readOnly &&
        Platform.isIOS;

    //Scroll to bottom
    useEffect(
      () {
        if (scrollToBottom) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: kThemeAnimationDuration * 3,
            curve: Curves.easeOutCubic,
          );
        }
        return null;
      },
      [scrollToBottom, project.uid],
    );

    return Stack(
      children: [
        Scaffold(
          backgroundColor: colorScheme.background,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton:
              hasEnded || dates.isEmpty ? null : const RecordButton(),
          body: Scrollbar(
            controller: scrollController,
            child: TwoFingerPointerWidget(
              onStart: () => showThumbnails.value = true,
              onEnd: () => showThumbnails.value = false,
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  HomeAppBar(
                    title: title,
                  ),
                  if (entriesCount > 0)
                    SliverToBoxAdapter(
                      child: ProjectCompletedInfo(
                        hasEnded: hasEnded,
                        isComplete: isComplete,
                        datesCount: dates.length,
                        entriesCount: entriesCount,
                      ),
                    ),
                  if (dates.isNotEmpty)
                    for (var datesInMonth in datesPerMonth)
                      MonthSliverGrid(
                        dates: datesInMonth,
                        showThumbnails: showThumbnails.value,
                      ),
                  if (dates.isEmpty)
                    const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: ProjectNotStarted(),
                      ),
                    ),
                  if (dates.isNotEmpty)
                    SliverToBoxAdapter(
                      child: vSpace(Spacers.x4l),
                    )
                ],
              ),
            ),
          ),
        ),
        const RevealInfo(),
      ],
    );
  }
}
