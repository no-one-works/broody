import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/core/hook/use_wakelock.hook.dart';
import 'package:broody/model/common/loading_value/loading_value.dart';
import 'package:broody/model/entry/entry.dart';
import 'package:broody/model/project/project.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/service/providers/project.providers.dart';
import 'package:broody/service/repositories/project.repository.dart';
import 'package:broody/ui/shared/bouncy_pressable/bouncy_pressable.widget.dart';
import 'package:broody/ui/shared/loading_value_progress_bar/loading_value_progress_bar.widget.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:broody/ui/theme/transitions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UpdateEntriesPage extends HookConsumerWidget {
  const UpdateEntriesPage({
    Key? key,
    required this.project,
  }) : super(key: key);
  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final textTheme = useTextTheme();
    final colorScheme = useColorScheme();
    useWakelock();
    final outdatedEntries =
        ref.watch(projectOutdatedEntriesProvider(project.uid));

    final process = useState<Stream<LoadingValue<List<SavedEntry?>>>?>(null);
    final progress = useStream(process.value);
    final value = progress.data;
    useValueChanged<LoadingValue<List<SavedEntry?>>?, void>(value, (_, __) {
      progress.data?.mapOrNull(
          data: (_) => context.router.replaceAll([const HomeRoute()]),
          error: (_) async {
            await Future.delayed(const Duration(seconds: 2));
            process.value = null;
          });
    });

    return Scaffold(
      backgroundColor: colorScheme.primaryContainer,
      body: Stack(
        children: [
          Padding(
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.history_rounded,
                        color: colorScheme.onPrimaryContainer,
                      ),
                      hSpace(Spacers.s),
                      Text(
                        l10n.outdatedEntriesTitle,
                        style: textTheme.headline5!.copyWith(
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                  vSpace(Spacers.s),
                  AnimatedSize(
                    duration: kThemeAnimationDuration,
                    curve: Curves.ease,
                    child: AnimatedSwitcher(
                      duration: kThemeAnimationDuration,
                      child: Text(
                        process.value == null
                            ? l10n.outdatedEntriesDescription(
                                outdatedEntries.value?.length ?? 0)
                            : l10n.outdatedEntriesRunningDescription,
                        key: ValueKey(process.value == null),
                        style: textTheme.subtitle2!.copyWith(
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ),
                  vSpace(Spacers.xl),
                  AnimatedSwitcher(
                    duration: kThemeAnimationDuration,
                    child: process.value != null
                        ? LoadingValueProgressBar(
                            loadingValue: progress.data ??
                                const LoadingValue.loading(progress: 0),
                            color: colorScheme.primary,
                            description: l10n.updatingEntriesRemaining(
                                outdatedEntries.value?.length ?? 0),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              BouncyPressable(
                                child: CupertinoButton(
                                  child: Text(
                                    l10n.outdatedEntriesOk,
                                    style: textTheme.bodyLarge!
                                        .copyWith(color: colorScheme.onPrimary),
                                  ),
                                  color: colorScheme.primary,
                                  onPressed: () {
                                    process.value = ref
                                        .read(projectRepositoryProvider)
                                        .updateProjectEntries(project);
                                  },
                                ),
                              ),
                              vSpace(Spacers.s),
                              CupertinoButton(
                                child: Text(
                                  l10n.outdatedEntriesCancel,
                                  style: textTheme.bodyLarge!.copyWith(
                                      color: colorScheme.onPrimaryContainer),
                                ),
                                onPressed: context.router.pop,
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
