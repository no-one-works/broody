import 'package:auto_size_text/auto_size_text.dart';
import 'package:blur/blur.dart';
import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/generated/assets.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/ui/shared/better_blob_clipper/better_blob_clipper.dart';
import 'package:broody/ui/shared/providers/blob/blob.provider.dart';
import 'package:broody/ui/shared/providers/blob/request/blob_request.dart';
import 'package:broody/ui/shared/providers/video_player_controller.provider.dart';
import 'package:broody/ui/shared/tween_animation_builder_delay/tween_animation_builder_delay.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:broody/ui/theme/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

const _appearDuration = Duration(milliseconds: 900);
const _growDelay = Duration(milliseconds: 1000);
const _growDuration = Duration(milliseconds: 700);
const _textDelay = Duration(milliseconds: 400);
const _blurDelay = Duration(milliseconds: 1500);
const _blurDuration = Duration(seconds: 4);
const _staggerIncrement = Duration(milliseconds: 400);

class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final textTheme = useTextTheme();
    final colorScheme = useColorScheme();
    final videoController =
        ref.watch(loopingAssetVideoControllerProvider(Assets.videoCompilation));
    var autoSizeGroup = useMemoized(() => AutoSizeGroup());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: TweenAnimationBuilderDelay<double>(
        tween: tween01,
        delay: _appearDuration +
            _growDelay +
            _blurDelay +
            _textDelay +
            _staggerIncrement * 3,
        duration: _appearDuration,
        curve: Curves.ease,
        builder: _appearBuilder,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton.extended(
              onPressed: () => context.router.push(ProjectDetailsRoute()),
              label: Text(
                l10n.createProject,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Spacers.x2l, vertical: Spacers.s),
              child: Text(
                l10n.storageRequestInfo,
                style: textTheme.bodyMedium!.copyWith(color: Colors.white60),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
      backgroundColor: colorScheme.background,
      body: videoController.value == null
          ? const SizedBox()
          : TweenAnimationBuilder<double>(
              duration: _appearDuration,
              curve: Curves.ease,
              tween: tween01,
              builder: (context, value, child) => Transform.scale(
                scale: 0.5 + 0.5 * value,
                child: Opacity(
                  opacity: value,
                  child: child,
                ),
              ),
              child: TweenAnimationBuilderDelay<double>(
                delay: _appearDuration + _growDelay,
                duration: _growDuration,
                curve: Curves.ease,
                tween: tween01,
                builder: (context, value, child) => ClipPath(
                  clipper: BetterBlobClipper(
                    id: ref.watch(
                        blobProvider(const BlobRequest(day: 0, month: 0))),
                    scale: 1 + value * 8,
                  ),
                  child: child,
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    FittedBox(
                      fit: BoxFit.cover,
                      child: TweenAnimationBuilderDelay<double>(
                        tween: tween01,
                        delay: _appearDuration + _growDelay + _blurDelay,
                        duration: _blurDuration,
                        curve: Curves.easeOutCirc,
                        builder: (context, value, child) => Blur(
                          blur: 0,
                          blurColor: Colors.black,
                          colorOpacity: 0.6 * value,
                          child: child!,
                        ),
                        child: SizedBox.fromSize(
                          size: videoController.value!.value.size,
                          child: VideoPlayer(videoController.value!),
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(Spacers.l),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            TweenAnimationBuilderDelay<double>(
                              tween: tween01,
                              delay: _appearDuration +
                                  _growDelay +
                                  _blurDelay +
                                  _textDelay,
                              duration: _appearDuration,
                              curve: Curves.ease,
                              builder: _appearBuilder,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    "welcome",
                                    maxLines: 1,
                                    group: autoSizeGroup,
                                    style: textTheme.headline1?.copyWith(
                                        height: 1, color: Colors.white),
                                    textAlign: TextAlign.start,
                                  ),
                                  AutoSizeText(
                                    "to",
                                    maxLines: 1,
                                    group: autoSizeGroup,
                                    style: textTheme.headline1?.copyWith(
                                        height: 1, color: Colors.white),
                                    textAlign: TextAlign.start,
                                  ),
                                  AutoSizeText(
                                    "Broody",
                                    maxLines: 1,
                                    group: autoSizeGroup,
                                    style: textTheme.headline1?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        height: 1,
                                        color: Colors.white),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                            vSpace(Spacers.l),
                            TweenAnimationBuilderDelay<double>(
                              tween: tween01,
                              delay: _appearDuration +
                                  _growDelay +
                                  _blurDelay +
                                  _textDelay +
                                  _staggerIncrement * 1,
                              duration: _appearDuration,
                              curve: Curves.ease,
                              builder: _appearBuilder,
                              child: Text(
                                l10n.onboardingLine1,
                                style: textTheme.headline6
                                    ?.copyWith(color: Colors.white70),
                              ),
                            ),
                            TweenAnimationBuilderDelay<double>(
                              tween: tween01,
                              delay: _appearDuration +
                                  _growDelay +
                                  _blurDelay +
                                  _textDelay +
                                  _staggerIncrement * 2,
                              duration: _appearDuration,
                              curve: Curves.ease,
                              builder: _appearBuilder,
                              child: Text(
                                l10n.onboardingLine2,
                                style: textTheme.headline6
                                    ?.copyWith(color: Colors.white70),
                              ),
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
  }

  Widget _appearBuilder(BuildContext context, double value, Widget? child) {
    return Opacity(
      opacity: value,
      child: Transform.translate(
        offset: Offset(0, Spacers.l * (1 - value)),
        child: child,
      ),
    );
  }
}
