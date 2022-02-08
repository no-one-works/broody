import 'dart:io';

import 'package:broody/core/extensions/date_time.x.dart';
import 'package:broody/model/entry/entry.dart';
import 'package:broody/service/datasources/entry/entry.datasource.dart';
import 'package:broody/service/providers/project.providers.dart';
import 'package:broody/service/repositories/entry.repository.dart';
import 'package:broody/ui/shared/providers/video_player_controller.provider.dart';
import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

final activeEntriesProvider =
    StreamProvider.autoDispose<List<SavedEntry>>((ref) {
  final activeProject = ref.watch(selectedProjectProvider);
  if (activeProject == null) {
    return Stream.value(<SavedEntry>[]);
  }
  final datasource = ref.read(entryDatasourceProvider(activeProject.uid));
  return datasource.entries$;
});

final entryForDateProvider =
    Provider.autoDispose.family<AsyncValue<SavedEntry?>, DateTime>((ref, date) {
  final entries = ref.watch(activeEntriesProvider);

  return entries.when(
    data: (event) => AsyncValue.data(event.firstWhereOrNull(
      (entry) => entry.timestamp.startOfDay() == date.startOfDay(),
    )),
    loading: () => const AsyncValue.loading(),
    error: (e, s) => AsyncValue.error(e, stackTrace: s),
  );
});

final todaysEntriesProvider =
    FutureProvider.autoDispose<List<SavedEntry>>((ref) async {
  final projects = await ref.watch(projectsProvider.future);
  final entries = await Future.wait(
      projects.map((p) => ref.watch(projectEntriesProvider(p.uid).future)));
  return entries
      .map((projectEntries) =>
          projectEntries.firstWhereOrNull((entry) => entry.day.isToday()))
      .where((e) => e != null)
      .toList()
      .cast();
});

final entryThumbnailProvider =
    FutureProvider.autoDispose.family<File?, SavedEntry>((ref, entry) {
  final repo = ref.watch(entryRepositoryProvider);
  return repo.getEntryThumbnail(entry);
});

final entryVideoProvider =
    FutureProvider.autoDispose.family<File, SavedEntry>((ref, entry) {
  final repo = ref.watch(entryRepositoryProvider);
  return repo.getEntryClip(entry).then((file) => file!);
});

final entryVideoControllerProvider = FutureProvider.autoDispose
    .family<VideoPlayerController, SavedEntry>((ref, entry) async {
  final file = await ref.watch(entryVideoProvider(entry).future);
  return await ref.watch(loopingFileVideoControllerProvider(file.path).future);
});
