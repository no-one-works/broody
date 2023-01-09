import 'package:broody/service/providers/entry.providers.dart';
import 'package:broody/service/providers/project/project.providers.dart';
import 'package:broody/service/repositories/notification.repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final scheduleNotificationProvider =
    FutureProvider.autoDispose.family<void, L10n>((ref, l10n) async {
  final repo = ref.watch(notificationRepositoryProvider);
  final projects = ref.watch(projectsProvider.future);
  final todaysEntries = await ref.watch(todaysEntriesProvider.future);
  final projectsWithEntryToday = todaysEntries.map((e) => e.projectId).toList();
  repo.scheduleNotifications(
    projects: await projects,
    projectsWithEntryToday: projectsWithEntryToday,
    l10n: l10n,
  );
});
