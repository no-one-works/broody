import 'package:blur/blur.dart';
import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/service/providers/onboarding.providers.dart';
import 'package:broody/service/repositories/onboarding.repository.dart';
import 'package:broody/ui/shared/providers/onboarding_view/onboarding_view.providers.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RevealInfo extends HookConsumerWidget {
  const RevealInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = useColorScheme();
    final config = ref.watch(onboardingConfigProvider).valueOrNull;
    final show = ref.watch(showRevealOnboardingProvider) && config != null;
    return AnimatedSwitcher(
      duration: kThemeAnimationDuration,
      child: show
          ? HookBuilder(builder: (context) {
              final l10n = useL10n();
              final theme = useTheme();
              final animationController = useAnimationController(
                duration: const Duration(milliseconds: 2000),
              );
              useEffect(() {
                animationController.repeat(
                  reverse: true,
                );
                return null;
              }, [animationController]);
              final animationValue = useAnimation(CurvedAnimation(
                parent: animationController,
                curve: Curves.easeInOutCubic,
              ));
              return Listener(
                behavior: HitTestBehavior.translucent,
                onPointerDown: (_) =>
                    ref.read(onboardingRepositoryProvider).setOnboardingConfig(
                          config!.copyWith(
                            knowsTwoFingerSwipe: true,
                          ),
                        ),
                child: IgnorePointer(
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Stack(
                      children: [
                        Container().frosted(
                          blur: Spacers.l,
                          frostColor: colorScheme.background,
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(Spacers.x2l),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Flexible(child: SizedBox()),
                                Flexible(
                                  flex: 1,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Align(
                                        alignment: Alignment(
                                          0.5,
                                          -1 + 2 * animationValue,
                                        ),
                                        child: buildFinger(theme),
                                      ),
                                      Align(
                                        alignment: Alignment(
                                          -0.5,
                                          -1 + 2 * animationValue,
                                        ),
                                        child: buildFinger(theme),
                                      ),
                                    ],
                                  ),
                                ),
                                vSpace(Spacers.l),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.info_outline_rounded),
                                    hSpace(Spacers.xxs),
                                    Text(
                                      l10n.tip,
                                      style: theme.textTheme.headline5,
                                    ),
                                  ],
                                ),
                                vSpace(Spacers.s),
                                Text(
                                  l10n.revealTipText,
                                  style: theme.textTheme.subtitle2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })
          : const SizedBox(),
    );
  }

  Material buildFinger(ThemeData theme) {
    return Material(
      color: Colors.transparent,
      shape: CircleBorder(
        side: BorderSide(
          color: theme.colorScheme.primary,
          width: 2,
        ),
      ),
      child: const SizedBox(
        height: Spacers.l,
        width: Spacers.l,
      ),
    );
  }
}
