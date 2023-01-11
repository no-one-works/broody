import 'dart:io';

import 'package:broody/service/repositories/project.repository.dart';
import 'package:broody/ui/creating_compilation/state/create_compilation.state.dart';
import 'package:broody_video/broody_video.dart';
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
    ref,
    state,
  );
});

class CreateCompilationNotifier extends StateNotifier<CreateCompilationState> {
  CreateCompilationNotifier(this.ref, CreateCompilationState initialState)
      : super(initialState) {
    _init();
  }

  final Ref ref;

  void _init() async {
    if (_compilationNeedsUpdate()) {
      debugPrint("update needed for compilation");
      state = CreateCompilationState.exporting(
        projectUid: state.projectUid,
        monthOfYear: state.monthOfYear,
        exportProgress: const LoadingValue.loading(0),
      );
      _saveCompilation();
    } else {
      debugPrint("No compilation update is needed");
      final projectRepo = ref.read(projectRepositoryProvider);
      final savedCompilation = projectRepo.getCompilationForProject(
        projectUid: state.projectUid,
        monthOfYear: state.monthOfYear,
      );
      if (savedCompilation == null) {
        state = CreateCompilationExportFailed(
          projectUid: state.projectUid,
          monthOfYear: state.monthOfYear,
        );
      } else {
        final file = await projectRepo.getFileForCompilation(savedCompilation);

        state = CreateCompilationState.exportSuccess(
            projectUid: state.projectUid,
            monthOfYear: state.monthOfYear,
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
      final repo = ref.read(projectRepositoryProvider);
      final project = repo.getProject(s.projectUid)!;
      final assetEntity = await repo.saveCompilationInGallery(
        project: project,
        monthOfYear: s.monthOfYear,
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
    final projectRepo = ref.read(projectRepositoryProvider);
    return projectRepo.compilationNeedsUpdate(
      projectUid: s.projectUid,
      monthOfYear: s.monthOfYear,
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
    final repo = ref.read(projectRepositoryProvider);
    final compilationProgress = repo.createCompilation(
      projectUid: state.projectUid,
      monthOfYear: state.monthOfYear,
    );
    await for (final loadingValue in compilationProgress) {
      if (mounted == false) {
        return;
      }
      state = s.copyWith(exportProgress: loadingValue);
      loadingValue.whenOrNull(
        data: (savedCompilation) async {
          if (savedCompilation != null) {
            final file = await repo.getFileForCompilation(savedCompilation);
            state = CreateCompilationState.exportSuccess(
              projectUid: state.projectUid,
              monthOfYear: state.monthOfYear,
              savedCompilation: savedCompilation,
              file: file,
              videoController: await _createPlayerController(file),
            );
          } else {
            state = CreateCompilationState.exportFailed(
              projectUid: state.projectUid,
              monthOfYear: state.monthOfYear,
            );
          }
        },
      );
    }
  }

  @override
  void dispose() {
    final s = state;
    if (s is CreateCompilationExporting) {
      ref.read(projectRepositoryProvider).cancelCompilationCreation();
    }
    if (s is CreateCompilationExportSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        s.videoController.dispose();
      });
    }
    super.dispose();
  }
}
