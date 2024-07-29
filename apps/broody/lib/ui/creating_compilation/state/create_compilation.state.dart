import 'dart:io';

import 'package:broody/model/compilation/compilation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:process_value/process_value.dart';
import 'package:video_player/video_player.dart';

part 'create_compilation.state.freezed.dart';

@freezed
class CreateCompilationState with _$CreateCompilationState {
  const factory CreateCompilationState.prepareExport({
    required String projectUid,
    required DateTime? monthOfYear,
  }) = CreateCompilationPrepareExport;

  const factory CreateCompilationState.exporting({
    required String projectUid,
    required DateTime? monthOfYear,
    required ProcessValue exportProgress,
  }) = CreateCompilationExporting;

  const factory CreateCompilationState.exportSuccess({
    required String projectUid,
    required DateTime? monthOfYear,
    required SavedCompilation savedCompilation,
    required File file,
    required VideoPlayerController videoController,
  }) = CreateCompilationExportSuccess;

  const factory CreateCompilationState.exportFailed({
    required String projectUid,
    required DateTime? monthOfYear,
  }) = CreateCompilationExportFailed;
}
