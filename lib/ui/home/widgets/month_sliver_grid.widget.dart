import 'dart:io';

import 'package:blur/blur.dart';
import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/service/providers/project/project.providers.dart';
import 'package:broody/ui/shared/bouncy_pressable/bouncy_pressable.widget.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'entry_bubble.widget.dart';

class MonthSliverGrid extends HookConsumerWidget {
  const MonthSliverGrid({
    required this.dates,
    required this.showThumbnails,
    this.zoomFactor = 1,
    Key? key,
  }) : super(key: key);

  final List<DateTime> dates;
  final bool showThumbnails;
  final double zoomFactor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthOfYear = DateTime(dates.first.year, dates.first.month);
    ref.listen<AsyncValue<ProjectMonth?>>(projectMonthProvider(dates.first),
        (previousAsync, nextAsync) {
      final next = nextAsync.valueOrNull;
      final previous = previousAsync?.valueOrNull;
      if (next != null &&
          previous != null &&
          next.project == previous.project &&
          next.complete &&
          !previous.complete) {
        context.router.navigate(
          MonthCompleteInfoRoute(
            monthOfYear: monthOfYear,
          ),
        );
      }
    });

    final textTheme = useTextTheme();
    final colorScheme = useColorScheme();
    final dateFormat = useDateFormat();
    final monthName = dateFormat.dateSymbols.MONTHS[monthOfYear.month - 1];
    final selectedProject = ref.watch(selectedProjectProvider)!;
    final projectMonth =
        ref.watch(projectMonthProvider(dates.first)).valueOrNull;

    return SliverStickyHeader.builder(
      builder: (context, state) => Stack(
        children: [
          Positioned.fill(
            child: Platform.isIOS
                ? Blur(
                    blur: state.isPinned ? 24 : 0,
                    child: const SizedBox.expand(),
                    blurColor: colorScheme.background,
                  )
                : Container(
                    color: colorScheme.background,
                  ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: Platform.isIOS
                      ? Spacers.s
                      : MediaQuery.of(context).viewPadding.top + Spacers.s,
                  left: Spacers.m,
                  bottom: Spacers.s,
                  right: Spacers.l + 2,
                ),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          monthName,
                          style: Platform.isIOS
                              ? textTheme.headline6
                              : textTheme.headline5,
                        ),
                      ),
                      if (projectMonth != null && projectMonth.canCompile)
                        BouncyPressable(
                          onTap: () {
                            context.router.navigate(
                              CreateCompilationRoute(
                                projectUid: selectedProject.uid,
                                monthOfYear: monthOfYear,
                              ),
                            );
                          },
                          child: Icon(
                            Icons.movie_rounded,
                            color: colorScheme.secondary,
                          ),
                        )
                    ],
                  ),
                ),
              ),
              if (Platform.isIOS)
                AnimatedOpacity(
                  duration: kThemeAnimationDuration,
                  opacity: state.isPinned ? 1 : 0,
                  child: const Divider(
                    height: 1,
                  ),
                ),
            ],
          ),
        ],
      ),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: Spacers.x5l * zoomFactor,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          childAspectRatio: 1.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => EntryBubbleWidget(
            date: dates[index],
            showThumbnail: showThumbnails,
          ),
          childCount: dates.length,
        ),
      ),
    );
  }
}
