import 'package:auto_route/auto_route.dart';
import 'package:broody/routing/router.dart';
import 'package:broody/service/providers/version.provider.dart';
import 'package:broody/ui/shared/app_icon/app_icon.widget.dart';
import 'package:broody/ui/whats_new/widgets/changelog_items.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info/package_info.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:version/version.dart';

void showLicenseDialog(
  BuildContext context,
  WidgetRef ref,
) async {
  final l10n = L10n.of(context)!;
  final version = await ref.watch(versionProvider.future);

  final changelogItems = ChangelogItem.getChangelogFor(
    version,
    Theme.of(context).platform,
  );
  showAboutDialog(
    context: context,
    applicationIcon: const AppIcon(),
    applicationName: "Broody",
    applicationVersion: version.toString(),
    applicationLegalese:
        "© 2022 by Jesper Bellenbaum & Tim Lehmann • published under GNU GPLv3",
    children: [
      if (changelogItems.isNotEmpty)
        TextButton.icon(
            onPressed: () => context.router.navigate(
                  WhatsNewRoute(
                    items: changelogItems,
                  ),
                ),
            icon: const Icon(Icons.new_releases_rounded),
            label: Text(l10n.whatsNew))
    ],
  );
}
