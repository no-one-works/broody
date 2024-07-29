import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_request.freezed.dart';

@freezed
class VideoRequest with _$VideoRequest {
  const factory VideoRequest({
    required DateTime date,
    required int page,
  }) = _VideoRequest;
}
