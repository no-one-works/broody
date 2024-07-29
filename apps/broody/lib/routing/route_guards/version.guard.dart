import 'dart:io';

import 'package:broody/routing/router.dart';
import 'package:broody/service/providers/version.provider.dart';
import 'package:broody/service/repositories/version.repository.dart';
import 'package:broody/ui/whats_new/widgets/changelog_items.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:collection/collection.dart';

class VersionGuard extends AutoRouteGuard {
  VersionGuard(this.ref);

  final Ref ref;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final lastSeen = ref.read(lastSeenVersionProvider);
    final platform =
        Platform.isIOS ? TargetPlatform.iOS : TargetPlatform.android;
    final items = ChangelogItem.getChangelogAfter(lastSeen, platform);
    if (items.isNotEmpty) {
      ref
          .read(versionRepositoryProvider)
          .setLastSeen(items.sortedBy((e) => e.version).last.version);
      resolver.next(false);
      router.push(
        const ProjectsRoute(),
      );
      await Future.delayed(const Duration(seconds: 1));
      router.push(
        WhatsNewRoute(items: items.toList()),
      );
    } else {
      resolver.next(true);
    }
  }
}
