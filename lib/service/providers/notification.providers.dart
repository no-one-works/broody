import 'package:broody/service/providers/entry.providers.dart';
import 'package:broody/service/providers/project.providers.dart';
import 'package:broody/service/repositories/notification.repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final scheduleNotificationProvider =
    Provider.autoDispose.family<void, L10n>((ref, l10n) {
  final repo = ref.watch(notificationRepositoryProvider);
  final projects = ref.watch(projectsProvider).value;
  final todaysEntries = ref.watch(todaysEntriesProvider).value ?? [];
  final projectsWithEntryToday = todaysEntries.map((e) => e.projectId).toList();
  if (projects != null) {
    repo.scheduleNotifications(
        projects: projects,
        projectsWithEntryToday: projectsWithEntryToday,
        l10n: l10n);
  }
});
