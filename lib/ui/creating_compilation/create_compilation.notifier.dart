import 'dart:io';

import 'package:broody/service/repositories/project.repository.dart';
import 'package:broody/ui/creating_compilation/state/create_compilation.state.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_value/loading_value.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

final createCompilationStateProvider = StateNotifierProvider.autoDispose.family<
    CreateCompilationNotifier,
    CreateCompilationState,
    CreateCompilationState>((ref, state) {
  return CreateCompilationNotifier(
    ref.read,
    state,
  );
});

class CreateCompilationNotifier extends StateNotifier<CreateCompilationState> {
  CreateCompilationNotifier(this.reader, CreateCompilationState initialState)
      : super(initialState) {
    _init();
  }

  final Reader reader;

  void _init() async {
    if (_compilationNeedsUpdate()) {
      debugPrint("update needed for compilation");
      state = CreateCompilationState.exporting(
        projectUid: state.projectUid,
        month: state.month,
        exportProgress: const LoadingValue.loading(0),
      );
      _saveCompilation();
    } else {
      debugPrint("No compilation update is needed");
      final projectRepo = reader(projectRepositoryProvider);
      final savedCompilation = projectRepo.getCompilationForProject(
        projectUid: state.projectUid,
        month: state.month,
      );
      if (savedCompilation == null) {
        state = CreateCompilationExportFailed(
          projectUid: state.projectUid,
          month: state.month,
        );
      } else {
        final file = await projectRepo.getFileForCompilation(savedCompilation);

        state = CreateCompilationState.exportSuccess(
            projectUid: state.projectUid,
            month: state.month,
            savedCompilation: savedCompilation,
            file: file,
            videoController: await _createPlayerController(
              file,
            ));
      }
    }
  }

  Future<bool> saveToGallery() async {
    final s = state;
    if (s is CreateCompilationExportSuccess) {
      final repo = reader(projectRepositoryProvider);
      final project = repo.getProject(s.projectUid)!;
      final assetEntity = await repo.saveCompilationInGallery(
        project: project,
        month: s.month,
      );
      return assetEntity != null;
    }
    return false;
  }

  void share() async {
    final s = state;
    if (s is CreateCompilationExportSuccess) {
      Share.shareFiles(
        [s.file.path],
      );
    }
  }

  bool _compilationNeedsUpdate() {
    final s = state;
    if (s is! CreateCompilationPrepareExport) {
      return false;
    }
    final projectRepo = reader(projectRepositoryProvider);
    return projectRepo.compilationNeedsUpdate(
      projectUid: s.projectUid,
      month: s.month,
    );
  }

  Future<VideoPlayerController> _createPlayerController(File file) async {
    final playerController = VideoPlayerController.file(file);
    await playerController.initialize();
    await playerController.setVolume(1);
    await playerController.play();
    return playerController;
  }

  Future<void> _saveCompilation() async {
    await _saveCompilation$().forEach((element) {});
  }

  Stream<void> _saveCompilation$() async* {
    final s = state;
    if (s is! CreateCompilationExporting) {
      return;
    }
    debugPrint("lets export...");
    final repo = reader(projectRepositoryProvider);
    final compilationProgress = repo.createCompilation(
      projectUid: state.projectUid,
      month: s.month,
    );
    await for (final loadingValue in compilationProgress) {
      debugPrint("compilation exporting...");
      state = s.copyWith(exportProgress: loadingValue);
      loadingValue.whenOrNull(
        data: (savedCompilation) async {
          if (savedCompilation != null) {
            final file = await repo.getFileForCompilation(savedCompilation);
            state = CreateCompilationState.exportSuccess(
              projectUid: state.projectUid,
              month: state.month,
              savedCompilation: savedCompilation,
              file: file,
              videoController: await _createPlayerController(file),
            );
          } else {
            state = CreateCompilationState.exportFailed(
              projectUid: state.projectUid,
              month: state.month,
            );
          }
        },
      );
    }
  }

  @override
  void dispose() {
    final s = state;
    if (s is CreateCompilationExportSuccess) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        s.videoController.dispose();
      });
    }
    super.dispose();
  }
}
