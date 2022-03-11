import 'dart:io';

import 'package:broody/core/extensions/date_time.x.dart';
import 'package:broody/model/entry/entry.dart';
import 'package:broody/model/project/project.dart';
import 'package:broody/service/providers/project/active_project.notifier.dart';
import 'package:broody/service/repositories/entry.repository.dart';
import 'package:broody/service/repositories/project.repository.dart';
import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final projectsProvider = StreamProvider.autoDispose(
    (ref) => ref.watch(projectRepositoryProvider).projects$);

final selectedProjectProvider =
    StateNotifierProvider<ActiveProjectNotifier, Project?>(
        (ref) => ActiveProjectNotifier(ref.watch(projectRepositoryProvider)));

final projectIsCompleteProvider =
    Provider.autoDispose.family<bool, Project?>((ref, project) {
  if (project == null) return false;
  final entriesCount = ref.watch(
      projectEntriesProvider(project.uid).select((e) => e.value?.length));
  return project.numberOfClips == entriesCount;
});

final projectHasEndedProvider =
    Provider.autoDispose.family<bool, Project?>((ref, project) {
  if (project == null) return false;
  return project.endDate.isBefore(DateTime.now());
});

final projectDatesProvider = Provider.autoDispose<List<DateTime>>((ref) {
  final project = ref.watch(selectedProjectProvider);
  if (project == null) return [];
  return project.startDate
      .startOfDay()
      .getDaysUntil(project.endDate, inclusive: true)
      .map((d) => d.startOfDay())
      .where((d) => !d.isAfter(DateTime.now().startOfDay()))
      .sorted((a, b) => Platform.isIOS ? a.compareTo(b) : -a.compareTo(b))
      .toList();
});

final projectTitleProvider = Provider.autoDispose((ref) {
  final project = ref.watch(selectedProjectProvider);
  return project?.title ?? "";
});

final projectClipDurationProvider = Provider.autoDispose<Duration?>((ref) {
  final project = ref.watch(selectedProjectProvider);
  if (project == null) return null;
  return project.entryDuration;
});

final projectEntriesProvider =
    StreamProvider.autoDispose.family<List<SavedEntry>, String>(
  (ref, projectId) => ref
      .watch(entryRepositoryProvider)
      .watchEntriesForProject(projectId: projectId),
);

final selectedProjectReadOnlyProvider = Provider.autoDispose<bool>((ref) {
  final project = ref.watch(selectedProjectProvider);
  if (project == null) return false;
  return ref
          .watch(projectOutdatedEntriesProvider(project.uid))
          .value
          ?.isNotEmpty ??
      false;
});

final projectOutdatedEntriesProvider =
    StreamProvider.autoDispose.family<List<SavedEntry>, String>(
  (ref, projectId) => ref
      .watch(entryRepositoryProvider)
      .watchOutdatedEntries(projectId: projectId),
);

final selectedProjectEntriesProvider =
    Provider.autoDispose<AsyncValue<List<SavedEntry>>>((ref) {
  final project = ref.watch(selectedProjectProvider);
  return project == null
      ? const AsyncValue.data([])
      : ref.watch(projectEntriesProvider(project.uid));
});

final projectMonthCompleteProvider =
    Provider.autoDispose.family<ProjectMonth?, DateTime>((ref, month) {
  final days = DateTime(month.year, month.month + 1, 0).day;
  final project = ref.watch(selectedProjectProvider);
  if (project == null) return null;
  return ref.watch(selectedProjectEntriesProvider.select(
    (value) => value.maybeWhen(
      data: (entries) => ProjectMonth._(
        project,
        month,
        entries
                .where((entry) =>
                    entry.day.year == month.year &&
                    entry.day.month == month.month)
                .length ==
            days,
      ),
      orElse: () => null,
    ),
  ));
});

final projectMonthEndedProvider =
    Provider.autoDispose.family<ProjectMonth?, DateTime>((ref, month) {
  final lastDay = DateTime(month.year, month.month + 1, 0);
  final project = ref.watch(selectedProjectProvider);
  if (project == null) return null;
  return ref.watch(selectedProjectEntriesProvider.select(
    (value) => value.maybeWhen(
      data: (entries) => ProjectMonth._(
        project,
        month,
        entries
                    .where((entry) =>
                        entry.day.year == month.year &&
                        entry.day.month == month.month)
                    .length >
                1 &&
            lastDay.endOfDay().isBefore(DateTime.now()),
      ),
      orElse: () => null,
    ),
  ));
});

class ProjectMonth {
  ProjectMonth._(this.project, this.month, this.complete);

  final Project project;
  final DateTime month;
  final bool complete;
}
