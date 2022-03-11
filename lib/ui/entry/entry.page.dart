import 'package:broody/core/extensions/color.x.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/model/entry/entry.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/service/providers/project/project.providers.dart';
import 'package:broody/service/repositories/entry.repository.dart';
import 'package:broody/ui/entry/day_page/day_page.widget.dart';
import 'package:broody/ui/shared/interactive_viewer_plus/widgets/custom_dismissible.widget.dart';
import 'package:broody/ui/shared/providers/color/color.providers.dart';
import 'package:broody/ui/shared/providers/color/request/color_scheme_request.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EntryPage extends HookConsumerWidget {
  const EntryPage({
    Key? key,
    this.entry,
    required this.projectId,
    required this.date,
  }) : super(key: key);

  final SavedEntry? entry;
  final String projectId;
  final DateTime date;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = useTheme();
    final isMounted = useIsMounted();
    final entries = ref.watch(selectedProjectEntriesProvider);
    final readOnly = ref.watch(selectedProjectReadOnlyProvider);
    final dates = ref.watch(projectDatesProvider);
    final pageController = usePageController(
      initialPage: dates.indexWhere(
        (d) => date == d,
      ),
      keys: [entries],
    );
    final dismissProgress = useState(0.0);
    final page = useState(0.0);
    final muted = useState(false);
    useEffect(() {
      pageController.addListener(() {
        page.value =
            pageController.positions.isNotEmpty ? pageController.page! : 0.0;
      });
      page.value = dates.indexWhere((d) => date == d).toDouble();
    }, [pageController]);

    final currentEntry = entries.whenOrNull(
        data: (entries) => entries
            .firstWhereOrNull((e) => e.day == dates[page.value.round()]));
    final entryColorScheme = currentEntry != null
        ? ref.watch(
            colorSchemeProvider(
              ColorSchemeRequest.entry(
                brightness: theme.brightness,
                projectColor: theme.colorScheme.primary,
                entry: currentEntry,
              ),
            ),
          )
        : null;

    final colorScheme = entryColorScheme ?? theme.colorScheme;

    final entryIsDark =
        (currentEntry?.color?.toColor() ?? colorScheme.background).isDark();
    final foregroundColor = entryIsDark == (theme.brightness == Brightness.dark)
        ? colorScheme.primary
        : colorScheme.inversePrimary;
    final backgroundColor = colorScheme.surface;

    return TweenAnimationBuilder(
      tween: ColorTween(
        begin: backgroundColor,
        end: backgroundColor,
      ),
      duration: kThemeAnimationDuration,
      builder: (context, Color? backgroundColor, child) =>
          TweenAnimationBuilder(
        tween: ColorTween(
          begin: foregroundColor,
          end: dismissProgress.value > 0 ? Colors.transparent : foregroundColor,
        ),
        duration: kThemeAnimationDuration,
        builder: (context, Color? foregroundColor, child) => Scaffold(
          backgroundColor: backgroundColor,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            systemOverlayStyle: entryIsDark
                ? SystemUiOverlayStyle.light
                : SystemUiOverlayStyle.dark,
            leading: IconButton(
              color: foregroundColor,
              onPressed: context.router.pop,
              icon: const Icon(Icons.close_rounded),
            ),
            actions: [
              AnimatedSwitcher(
                duration: kThemeAnimationDuration,
                child: currentEntry == null || readOnly
                    ? const SizedBox()
                    : IconButton(
                        color: foregroundColor,
                        onPressed: () async {
                          ref
                              .read(entryRepositoryProvider)
                              .shareEntry(entry: currentEntry);
                        },
                        icon: const Icon(Icons.ios_share_rounded),
                      ),
              ),
              AnimatedSwitcher(
                duration: kThemeAnimationDuration,
                child: currentEntry == null || readOnly
                    ? const SizedBox()
                    : IconButton(
                        color: foregroundColor,
                        onPressed: () async {
                          muted.value = true;
                          await context.router.push(
                            VideoPickerRoute(
                              forDate: dates[pageController.page!.round()],
                            ),
                          );
                          if (isMounted()) muted.value = false;
                        },
                        icon: const Icon(Icons.edit_rounded),
                      ),
              ),
            ],
          ),
          body: CustomDismissible(
            onDismissUpdated: (v) => dismissProgress.value = v,
            onDismissed: context.router.pop,
            child: entries.when(
              data: (entries) => PageView.builder(
                clipBehavior: Clip.hardEdge,
                itemCount: dates.length,
                controller: pageController,
                itemBuilder: (context, index) => DayPage(
                  date: dates[index],
                  pageOffset: (page.value - index).clamp(-1, 1),
                  entry: entries.firstWhereOrNull((e) => e.day == dates[index]),
                  muted: muted.value,
                  dismissProgress: dismissProgress.value,
                ),
              ),
              error: (_, __) => const SizedBox(),
              loading: () => DayPage(
                date: date,
                entry: entry,
                pageOffset: 0,
                muted: muted.value,
                dismissProgress: dismissProgress.value,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
