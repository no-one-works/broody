import 'package:blur/blur.dart';
import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/service/providers/video/video_gallery.providers.dart';
import 'package:broody/ui/shared/bouncy_pressable/bouncy_pressable.widget.dart';
import 'package:broody/ui/shared/providers/video_player_controller.provider.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:broody/ui/theme/transitions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:video_player/video_player.dart';

class NoPermissionInfoPage extends HookConsumerWidget {
  const NoPermissionInfoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final textTheme = useTextTheme();
    final colorScheme = useColorScheme();
    final videoController = ref.watch(
        loopingAssetVideoControllerProvider("assets/video/compilation.mp4"));

    final loopCheckController = useAnimationController(
      duration: const Duration(seconds: 3),
    );

    useEffect(() {
      loopCheckController.forward(from: 0);
      loopCheckController.addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            ref.refresh(videoGalleryPermissionProvider);
            loopCheckController.forward(from: 0);
          }
        },
      );
      return null;
    }, [loopCheckController]);

    ref.listen<AsyncValue<bool>>(videoGalleryPermissionProvider,
        (previous, next) {
      if (next.value ?? false) {
        context.router.replaceAll([const HomeRoute()]);
      }
    });

    return Scaffold(
      backgroundColor: colorScheme.errorContainer,
      body: Stack(
        children: [
          if (videoController.asData?.value != null)
            Positioned.fill(
              child: FittedBox(
                fit: BoxFit.cover,
                child: Blur(
                  blurColor: colorScheme.errorContainer,
                  colorOpacity: 0.7,
                  blur: 50,
                  child: SizedBox.fromSize(
                      size: videoController.value!.value.size,
                      child: VideoPlayer(videoController.value!)),
                ),
              ),
            ),
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
                        Icons.warning_rounded,
                        color: colorScheme.onErrorContainer,
                      ),
                      hSpace(Spacers.s),
                      Text(
                        l10n.missingPermissionDialogTitle,
                        style: textTheme.headline5!.copyWith(
                          color: colorScheme.onErrorContainer,
                        ),
                      ),
                    ],
                  ),
                  vSpace(Spacers.s),
                  Text(
                    l10n.missingGalleryPermissionPageContent,
                    style: textTheme.subtitle2!.copyWith(
                      color: colorScheme.onErrorContainer,
                    ),
                  ),
                  vSpace(Spacers.l),
                  vSpace(Spacers.s),
                  BouncyPressable(
                    child: CupertinoButton(
                      child: Text(
                        l10n.missingGalleryPermissionPageOk,
                        style: textTheme.bodyLarge!
                            .copyWith(color: colorScheme.onInverseSurface),
                      ),
                      color: colorScheme.inverseSurface,
                      onPressed: () => PhotoManager.openSetting(),
                    ),
                  ),
                  vSpace(Spacers.s),
                  if (false)
                    CupertinoButton(
                      child: Text(
                        l10n.learnMore,
                        style: textTheme.bodyLarge!
                            .copyWith(color: colorScheme.onErrorContainer),
                      ),
                      onPressed: () {},
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
