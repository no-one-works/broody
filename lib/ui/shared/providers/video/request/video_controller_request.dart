import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_controller_request.freezed.dart';

@freezed
class VideoControllerRequest with _$VideoControllerRequest {
  const factory VideoControllerRequest.file({
    required String path,
    @Default(true) bool looping,
    @Default(true) bool autoPlay,
    @Default(1) double initialVolume,
  }) = FileVideoControllerRequest;

  const factory VideoControllerRequest.asset({
    required String dataSource,
    @Default(true) bool looping,
    @Default(true) bool autoPlay,
    @Default(1) double initialVolume,
  }) = AssetVideoControllerRequest;
}
