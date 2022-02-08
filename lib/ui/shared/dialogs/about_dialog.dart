import 'package:broody/ui/shared/app_icon/app_icon.widget.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

void showLicenseDialog(BuildContext context) async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  showAboutDialog(
    context: context,
    applicationIcon: const AppIcon(),
    applicationName: "Broody",
    applicationVersion: packageInfo.version + "+" + packageInfo.buildNumber,
    applicationLegalese:
        "© 2022 by Jesper Bellenbaum & Tim Lehmann • published under GNU GPLv3",
  );
}
