import 'dart:async';
import 'dart:io';

import 'package:broody/core/constants/clip_durations.dart';
import 'package:broody/core/extensions/date_time.x.dart';
import 'package:broody/model/compilation/compilation.dart';
import 'package:broody/model/entry/entry.dart';
import 'package:broody/model/project/project.dart';
import 'package:broody/service/datasources/compilation/compilation.datasource.dart';
import 'package:broody/service/datasources/entry/entry.datasource.dart';
import 'package:broody/service/datasources/project/project.datasource.dart';
import 'package:broody/service/providers/directory.provider.dart';
import 'package:broody/service/providers/project/project.providers.dart';
import 'package:broody/service/providers/uuid.provider.dart';
import 'package:broody/service/repositories/entry.repository.dart';
import 'package:broody/service/repositories/repository.dart';
import 'package:collection/src/iterable_extensions.dart';
import 'package:dartx/dartx.dart' show IterableExcept;
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:process_value/process_value.dart';
import 'package:photo_manager/photo_manager.dart';

abstract class ProjectRepository extends RepositoryBase {
  ProjectRepository(ProviderRef ref) : super(ref);

  Project? get activeProject;

  Stream<Project?> get activeProject$;

  FutureOr<void> setActiveProject(Project? project);

  List<Project> get projects;

  Stream<List<Project>> get projects$;

  FutureOr<void> setProject(Project project);

  Stream<ProcessValue<List<SavedEntry>>> updateProjectEntries(Project project);

  void deleteProject(Project project);

  void endProject(Project project);

  Project? getProject(String uid);

  Project get newProject;

  Future<void> deleteAllCompilations();

  Stream<ProcessValue<SavedCompilation?>> createCompilation({
    required String projectUid,
    DateTime? monthOfYear,
  });

  /// Attempts to cancel the creation of the current compilation.
  ///
  /// Does nothing if nothing is being generated.
  Future<void> cancelCompilationCreation();

  bool compilationNeedsUpdate({
    required String projectUid,
    DateTime? monthOfYear,
  });

  SavedCompilation? getCompilationForProject({
    required String projectUid,
    DateTime? monthOfYear,
  });

  Future<AssetEntity?> saveCompilationInGallery({
    required Project project,
    DateTime? monthOfYear,
  });

  Future<File> getFileForCompilation(SavedCompilation compilation);
}

final projectRepositoryProvider = Provider<ProjectRepository>((ref) {
  final repo = ProjectRepositoryImpl(ref);
  repo.deleteAllCompilations();
  return repo;
});

class ProjectRepositoryImpl extends ProjectRepository {
  ProjectRepositoryImpl(ProviderRef ref) : super(ref);

  @override
  Project? get activeProject =>
      ref.read(projectDatasourceProvider).activeProject ??
      _getActiveProjectFromProjects(projects);

  @override
  Stream<Project?> get activeProject$ => ref
      .read(projectDatasourceProvider)
      .activeProject$
      .map((p) => p ?? _getActiveProjectFromProjects(projects));

  Project? _getActiveProjectFromProjects(List<Project> projects) =>
      projects.lastWhereOrNull((p) => DateTime.now().isBetween(
            start: p.startDate,
            end: p.endDate,
          ));

  @override
  FutureOr<void> setActiveProject(Project? project) {
    // Only store if the project is active
    if (project == null ||
        DateTime.now()
            .isBetween(start: project.startDate, end: project.endDate)) {
      ref.read(projectDatasourceProvider).setActiveProject(project);
    }
  }

  @override
  FutureOr<void> deleteProject(Project project) async {
    final directory =
        await ref.read(projectDirectoryProvider(project.uid).future);
    if (await directory.exists()) {
      await directory.delete(recursive: true);
    }
    await ref.read(entryDatasourceProvider(project.uid)).deleteProject();
    await ref.read(projectDatasourceProvider).deleteProject(project.uid);
  }

  @override
  Project? getProject(String uid) {
    return ref.read(projectDatasourceProvider).getProject(uid);
  }

  @override
  List<Project> get projects => ref.read(projectDatasourceProvider).projects;

  @override
  Stream<List<Project>> get projects$ =>
      ref.read(projectDatasourceProvider).projects$;

  @override
  Future<void> setProject(Project project) async {
    final datasource = ref.read(projectDatasourceProvider);
    final old = datasource.getProject(project.uid);
    if (old == null) {
      // Project is new
      await ref.read(entryDatasourceProvider(project.uid)).initNewProject();
    } else {
      final lostDates = old.startDate
          .getDaysUntil(old.endDate)
          .map((d) => d.startOfDay())
          .except(project.startDate.getDaysUntil(project.endDate));
      final entries =
          await ref.read(projectEntriesProvider(project.uid).future);
      final lostEntries = entries.where((e) => lostDates.contains(e.day));

      await Future.wait(
          lostEntries.map(ref.read(entryRepositoryProvider).deleteEntry));
    }
    datasource.setProject(project);
  }

  @override
  Stream<ProcessValue<List<SavedEntry>>> updateProjectEntries(
      Project project) async* {
    print(project.resolution);
    final outdated =
        await ref.read(projectOutdatedEntriesProvider(project.uid).future);
    final updated = <SavedEntry>[];
    final failed = <SavedEntry>[];

    for (final entry in outdated) {
      final process =
          ref.read(entryRepositoryProvider).updateEntryVersion(entry: entry);
      await for (final processValue in process) {
        switch (processValue) {
          case ProcessLoading(:final progress):
            yield ProcessValue.loading(
              (updated.length + failed.length + progress) / outdated.length,
            );
          case ProcessError():
          case ProcessData(value: null):
            failed.add(entry);
            continue;
          case ProcessData(value: final updatedEntry?):
            updated.add(updatedEntry);
            continue;
        }
      }
    }
    if (failed.isNotEmpty) {
      yield ProcessValue.error(
          Exception("${failed.length} entries failed to export!"));
    } else {
      yield ProcessValue.data(updated);
    }
  }

  @override
  Project get newProject => Project(
        uid: ref.read(uidProvider),
        startDate: DateTime.now().startOfDay(),
        endDate: DateTime.now().add(const Duration(days: 364)).endOfDay(),
        entryDuration: goldenRatioDuration,
        thumbnailPath: null,
        notificationTime: null,
      );

  @override
  Future<void> deleteAllCompilations() async {
    final compilationDatasource = ref.read(compilationDatasourceProvider);
    debugPrint("Deleted all compilations");
    final dirs = await Future.wait(projects
        .map((e) => ref.read(compilationDirectoryProvider(e.uid).future)));
    await compilationDatasource.clearCompilations(dirs);
  }

  @override
  Stream<ProcessValue<SavedCompilation?>> createCompilation({
    required String projectUid,
    DateTime? monthOfYear,
  }) async* {
    final project = getProject(projectUid);
    if (project == null) {
      yield const ProcessValue.data(null);
      return;
    }
    yield const ProcessValue.loading(0);
    final compilationDatasource = ref.read(compilationDatasourceProvider);
    final entriesForProject =
        await ref.read(projectEntriesProvider(projectUid).future);
    final projectDir =
        await ref.read(projectDirectoryProvider(projectUid).future);
    final compilationDir =
        await ref.read(compilationDirectoryProvider(projectUid).future);

    final entries = entriesForProject
        .where((e) =>
            monthOfYear == null ||
            e.day.month == monthOfYear.month && e.day.year == monthOfYear.year)
        .toList();

    debugPrint("CREATING COMPILATION");

    final createCompilation = CreateCompilation(
      uid: ref.read(uidProvider),
      projectTitle: project.title,
      monthOfYear: monthOfYear,
      destination: compilationDir.path,
      projectUid: projectUid,
      usedEntries: entries,
      projectPath: projectDir.path,
      width: project.resolution.width,
      height: project.resolution.height,
      created: DateTime.now(),
    );
    final progress = compilationDatasource.createCompilation(
      createCompilation: createCompilation,
    );

    await for (final ProcessValue in progress) {
      yield ProcessValue;
    }
  }

  @override
  Future<void> cancelCompilationCreation() {
    final compilationDatasource = ref.read(compilationDatasourceProvider);
    return compilationDatasource.cancelCompilationCreation();
  }

  @override
  Future<AssetEntity?> saveCompilationInGallery({
    required Project project,
    DateTime? monthOfYear,
  }) async {
    final compilation = getCompilationForProject(
      projectUid: project.uid,
      monthOfYear: monthOfYear,
    );
    if (compilation == null) {
      throw Exception(
          "Can't save compilation for project ${project.uid}, cause it doesn't exist!");
    }
    final file = await getFileForCompilation(
      compilation,
    );
    final assetEntity = await PhotoManager.editor.saveVideo(
      file,
      title: project.title,
      desc: "made with Broody",
    );
    if (assetEntity != null) {
      setProject(project.copyWith(
        compilationAssetIds: [...project.compilationAssetIds, assetEntity.id],
      ));
    }
    return assetEntity;
  }

  @override
  void endProject(Project project) {
    setProject(project.copyWith(endDate: DateTime.now()));
  }

  @override
  bool compilationNeedsUpdate({
    required String projectUid,
    DateTime? monthOfYear,
  }) {
    final project = getProject(projectUid);
    if (project == null) {
      return false;
    }
    final compilationDatasource = ref.read(compilationDatasourceProvider);
    final compilation = compilationDatasource.getCompilationForProject(
      projectUid: projectUid,
      monthOfYear: monthOfYear,
    );

    final entryRepo = ref.read(entryRepositoryProvider);
    final entries = entryRepo.getEntriesForProject(projectId: projectUid).where(
          (e) =>
              monthOfYear == null ||
              e.day.month == monthOfYear.month &&
                  e.day.year == monthOfYear.year,
        );
    if (entries.isEmpty) {
      return false;
    }
    if (compilation == null) {
      return true;
    }
    if (entries.length != compilation.usedEntries.length) {
      return true;
    }
    for (final entry in entries) {
      final oldEntry =
          compilation.usedEntries.firstWhereOrNull((e) => e.uid == entry.uid);
      if (oldEntry == null ||
          oldEntry.changedWhen.isBefore(entry.changedWhen)) {
        return true;
      }
    }

    return false;
  }

  @override
  Future<File> getFileForCompilation(SavedCompilation compilation) async {
    final dir = await ref
        .read(compilationDirectoryProvider(compilation.projectUid).future);
    return File("${dir.path}/${compilation.filename}");
  }

  @override
  SavedCompilation? getCompilationForProject({
    required String projectUid,
    DateTime? monthOfYear,
  }) {
    final datasource = ref.read(compilationDatasourceProvider);
    return datasource.getCompilationForProject(
      projectUid: projectUid,
      monthOfYear: monthOfYear,
    );
  }
}
