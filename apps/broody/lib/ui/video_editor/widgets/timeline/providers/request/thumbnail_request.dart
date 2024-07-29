import 'package:freezed_annotation/freezed_annotation.dart';

part 'thumbnail_request.freezed.dart';

@freezed
class ThumbnailRequest with _$ThumbnailRequest {
  const factory ThumbnailRequest({
    required String videoPath,
    required Duration videoDuration,
    required int thumbnailHeight,
    required double aspectRatio,
    required int thumbnailCount,
    required int quality,
  }) = _ThumbnailRequest;
}
