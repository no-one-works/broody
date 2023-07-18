import 'dart:io';

import 'package:broody/core/constants/blob_params.dart';
import 'package:broody/core/extensions/date_time.x.dart';
import 'package:broody/model/entry/entry.dart';
import 'package:broody/model/project/project.dart';
import 'package:broody/service/providers/project/active_project.notifier.dart';
import 'package:broody/service/repositories/entry.repository.dart';
import 'package:broody/service/repositories/project.repository.dart';
import 'package:collection/collection.dart';
import 'package:dartx/dartx.dart';
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
    FutureProvider.autoDispose<List<SavedEntry>>((ref) async {
  final project = ref.watch(selectedProjectProvider);
  if (project == null) {
    return [];
  }
  return await ref.watch(projectEntriesProvider(project.uid).future);
});

final projectMonthProvider =
    FutureProvider.autoDispose.family<ProjectMonth?, DateTime>((ref, month) {
  final nextMonth = DateTime(month.year, month.month + 1, 1);
  final days = DateTime(month.year, month.month + 1, 0).day;
  final project = ref.watch(selectedProjectProvider);
  if (project == null) return null;
  return ref.watch(
    selectedProjectEntriesProvider.selectAsync((entries) {
      final entriesInMonth = entries.where(
        (entry) =>
            entry.day.year == month.year && entry.day.month == month.month,
      );
      final ended = DateTime.now().isAfter(nextMonth);
      return ProjectMonth._(
        project: project,
        month: month,
        ended: ended,
        complete: entriesInMonth.length == days,
        canCompile: ended && entriesInMonth.isNotEmpty,
      );
    }),
  );
});

class ProjectMonth {
  ProjectMonth._({
    required this.project,
    required this.month,
    required this.ended,
    required this.complete,
    required this.canCompile,
  });

  final Project project;
  final DateTime month;
  final bool ended;
  final bool complete;
  final bool canCompile;
}
