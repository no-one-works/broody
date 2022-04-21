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
import 'package:loading_value/loading_value.dart';
import 'package:photo_manager/photo_manager.dart';

abstract class ProjectRepository extends RepositoryBase {
  ProjectRepository(ProviderRef ref) : super(ref);

  Project? get activeProject;

  Stream<Project?> get activeProject$;

  FutureOr<void> setActiveProject(Project? project);

  List<Project> get projects;

  Stream<List<Project>> get projects$;

  FutureOr<void> setProject(Project project);

  Stream<LoadingValue<List<SavedEntry>>> updateProjectEntries(Project project);

  void deleteProject(Project project);

  void endProject(Project project);

  Project? getProject(String uid);

  Project get newProject;

  Stream<LoadingValue<SavedCompilation?>> createCompilation({
    required String projectUid,
    int? month,
  });

  bool compilationNeedsUpdate({
    required String projectUid,
    int? month,
  });

  SavedCompilation? getCompilationForProject({
    required String projectUid,
    int? month,
  });

  Future<AssetEntity?> saveCompilationInGallery({
    required Project project,
    int? month,
  });

  Future<File> getFileForCompilation(SavedCompilation compilation);
}

final projectRepositoryProvider =
    Provider<ProjectRepository>((ref) => ProjectRepositoryImpl(ref));

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
  Stream<LoadingValue<List<SavedEntry>>> updateProjectEntries(
      Project project) async* {
    final outdated =
        await ref.read(projectOutdatedEntriesProvider(project.uid).future);
    final updated = <SavedEntry>[];
    final failed = <SavedEntry>[];

    for (final entry in outdated) {
      final process =
          ref.read(entryRepositoryProvider).updateEntryVersion(entry: entry);
      await for (final loadingValue in process) {
        if (loadingValue is ValueLoading<SavedEntry?>) {
          final progress =
              (updated.length + failed.length + loadingValue.progress) /
                  outdated.length;
          yield LoadingValue.loading(progress);
        } else if (loadingValue is LoadingError<SavedEntry?>) {
          failed.add(entry);
        } else if (loadingValue is LoadedData<SavedEntry?>) {
          if (loadingValue.value == null) {
            failed.add(entry);
            continue;
          }
          updated.add(loadingValue.value!);
        }
      }
    }
    if (failed.isNotEmpty) {
      yield LoadingValue.error(
          Exception("${failed.length} entries failed to export!"));
    } else {
      yield LoadingValue.data(updated);
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
  Stream<LoadingValue<SavedCompilation?>> createCompilation({
    required String projectUid,
    int? month,
  }) async* {
    final project = getProject(projectUid);
    if (project == null) {
      yield const LoadingValue.data(null);
      return;
    }
    yield const LoadingValue.loading(0);
    final compilationDatasource = ref.read(compilationDatasourceProvider);
    final entriesForProject =
        await ref.read(projectEntriesProvider(projectUid).future);
    final projectDir =
        await ref.read(projectDirectoryProvider(projectUid).future);
    final compilationDir =
        await ref.read(compilationDirectoryProvider(projectUid).future);

    final entries = entriesForProject
        .where((e) => month == null || e.day.month == month)
        .toList();

    debugPrint("CREATING COMPILATION");

    final createCompilation = CreateCompilation(
      uid: ref.read(uidProvider),
      projectTitle: project.title,
      month: month,
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

    await for (final loadingValue in progress) {
      yield loadingValue;
    }
  }

  @override
  Future<AssetEntity?> saveCompilationInGallery(
      {required Project project, int? month}) async {
    final compilation = getCompilationForProject(
      projectUid: project.uid,
      month: month,
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
    int? month,
  }) {
    final project = getProject(projectUid);
    if (project == null) {
      return false;
    }
    final compilationDatasource = ref.read(compilationDatasourceProvider);
    final compilation = compilationDatasource.getCompilationForProject(
      projectUid: projectUid,
      month: month,
    );

    final entryRepo = ref.read(entryRepositoryProvider);
    final entries = entryRepo.getEntriesForProject(projectId: projectUid).where(
          (e) => month == null || e.day.month == month,
        );
    if (entries.isEmpty) {
      return false;
    }
    if (compilation == null) {
      return true;
    }
    final lastChange = entries.sortedBy((e) => e.changedWhen).last.changedWhen;
    if (compilation.algorithmVersion < compilationAlgorithmVersion ||
        lastChange.isAfter(compilation.created)) {
      return true;
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
    int? month,
  }) {
    final datasource = ref.read(compilationDatasourceProvider);
    return datasource.getCompilationForProject(
      projectUid: projectUid,
      month: month,
    );
  }
}
