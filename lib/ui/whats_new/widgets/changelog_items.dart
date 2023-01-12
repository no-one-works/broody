import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:version/version.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class ChangelogItem {
  const ChangelogItem._({
    required this.version,
    this.targetPlatform,
  });

  final Version version;
  final TargetPlatform? targetPlatform;

  Widget buildWidget(BuildContext context, L10n l10n);

  static List<ChangelogItem> getChangelogFor(
          Version version, TargetPlatform targetPlatform) =>
      _items
          .where((element) => element.version.major == version.major)
          .where((element) => element.version.minor == version.minor)
          .where((element) => element.version.patch == version.patch)
          .where((element) =>
              element.targetPlatform == targetPlatform ||
              element.targetPlatform == null)
          .toList();

  static List<ChangelogItem> getChangelogAfter(
    Version version,
    TargetPlatform targetPlatform,
  ) =>
      _items
          .where((element) => element.version > version)
          .where(
            (element) =>
                element.targetPlatform == targetPlatform ||
                element.targetPlatform == null,
          )
          .toList();

  static final _items = <ChangelogItem>[
    ExportSpeedItem(),
    UiPerformanceItem(),
    HdrItem(),
    PreviewContentItem(),
  ];
}

class ChangelogItemWidget extends HookConsumerWidget {
  const ChangelogItemWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.explainer,
  });

  final Widget icon;
  final Widget title;
  final Widget explainer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = useTheme();
    return Row(
      children: [
        IconTheme(
          data: IconThemeData(
            color: theme.colorScheme.secondary,
            size: Spacers.x2l,
          ),
          child: icon,
        ),
        hSpace(Spacers.l),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultTextStyle(
                style: theme.textTheme.titleMedium!,
                textAlign: TextAlign.start,
                child: title,
              ),
              vSpace(Spacers.xxs),
              DefaultTextStyle(
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.onBackground.withOpacity(0.7),
                ),
                textAlign: TextAlign.start,
                child: explainer,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ExportSpeedItem extends ChangelogItem {
  ExportSpeedItem() : super._(version: Version(1, 2, 0));
  @override
  Widget buildWidget(BuildContext context, L10n l10n) {
    return ChangelogItemWidget(
      icon: const Icon(Icons.speed_rounded),
      title: Text("Faster Saving"),
      explainer: Text(
        "Your entries are now saved much faster than ever before.",
      ),
    );
  }
}

class UiPerformanceItem extends ChangelogItem {
  UiPerformanceItem() : super._(version: Version(1, 2, 0));
  @override
  Widget buildWidget(BuildContext context, L10n l10n) {
    return ChangelogItemWidget(
      icon: const Icon(Icons.water_drop_rounded),
      title: Text("Smoother Performance"),
      explainer: Text(
        "The whole app got a major performance upgrade. Larger projects especially run significantly smoother now.",
      ),
    );
  }
}

class HdrItem extends ChangelogItem {
  HdrItem() : super._(version: Version(1, 2, 0));
  @override
  Widget buildWidget(BuildContext context, L10n l10n) {
    return ChangelogItemWidget(
      icon: const Icon(Icons.hdr_on_rounded),
      title: Text("HDR Video support"),
      explainer: Text(
        "Broody now has full support for HDR video without shifting the colors.",
      ),
    );
  }
}

class PreviewContentItem extends ChangelogItem {
  PreviewContentItem()
      : super._(version: Version(1, 2, 0), targetPlatform: TargetPlatform.iOS);
  @override
  Widget buildWidget(BuildContext context, L10n l10n) {
    return ChangelogItemWidget(
      icon: const Icon(Icons.remove_red_eye_rounded),
      title: Text("Gallery Peek"),
      explainer: Text(
        "You can now easily see if your gallery contains videos for a day even without opening it.",
      ),
    );
  }
}
