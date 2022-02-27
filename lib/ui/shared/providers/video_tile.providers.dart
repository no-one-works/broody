import 'package:broody/service/providers/video/video_gallery.providers.dart';
import 'package:broody/ui/shared/providers/video_player_controller.provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';

final galleryVideoControllerProviderOld =
    FutureProvider.autoDispose.family((ref, AssetEntity entity) async {
  final isLocallyAvailable = await entity.isLocallyAvailable;
  if (!isLocallyAvailable) {
    return null;
  }
  final file = await ref.watch(assetEntityFileProvider(entity).future);
  if (file == null) {
    throw Exception("Couldn't retrieve file for video!");
  }
  final videoController =
      await ref.watch(loopingFileVideoControllerProvider(file.path).future);
  return videoController;
});

final galleryVideoControllerProvider =
    FutureProvider.autoDispose.family((ref, AssetEntity entity) async {
  final isLocallyAvailable = await entity.isLocallyAvailable;
  if (!isLocallyAvailable) {
    return null;
  }
  final file = await ref.watch(assetEntityFileProvider(entity).future);
  if (file == null) {
    throw Exception("Couldn't retrieve media url for video!");
  }
  final videoController =
      await ref.watch(loopingFileVideoControllerProvider(file.path).future);
  return videoController;
});

final galleryVideoThumbnailProvider =
    FutureProvider.autoDispose.family((ref, AssetEntity entity) async {
  final thumb = await entity.thumbnailData;
  if (thumb == null) {
    throw Exception("Couldn't retrieve thumbnail for video!");
  }
  return MemoryImage(thumb);
});
