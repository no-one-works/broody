import 'dart:typed_data';

import 'package:broody/ui/video_editor/widgets/timeline/providers/request/thumbnail_request.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

final thumbnailListProvider = StreamProvider.autoDispose
    .family<List<Uint8List>, ThumbnailRequest>((ref, request) async* {
  final thumbnailWidth =
      (request.thumbnailHeight * request.aspectRatio).toInt();
  final thumbnailDuration =
      request.videoDuration.inMilliseconds ~/ request.thumbnailCount;

  final list = <Uint8List>[];
  Uint8List lastBytes = Uint8List(0);
  for (int i = 1; i <= request.thumbnailCount; i++) {
    final bytes = await VideoThumbnail.thumbnailData(
      video: request.videoPath,
      timeMs: i * thumbnailDuration,
      imageFormat: ImageFormat.JPEG,
      maxHeight: request.thumbnailHeight,
      maxWidth: thumbnailWidth,
      quality: request.quality,
    );
    lastBytes = bytes ?? lastBytes;
    list.add(lastBytes);
    yield list;
  }
});

Future<Uint8List?> _generateThumbnail(_ThumbnailParams params) =>
    VideoThumbnail.thumbnailData(
      video: params.path,
      timeMs: params.timeMs,
      imageFormat: ImageFormat.JPEG,
      maxHeight: params.height,
      maxWidth: params.width,
      quality: params.quality,
    );

class _ThumbnailParams {
  const _ThumbnailParams({
    required this.path,
    required this.timeMs,
    required this.quality,
    required this.width,
    required this.height,
  });

  final String path;
  final int timeMs;
  final int quality;
  final int width;

  final int height;
}
