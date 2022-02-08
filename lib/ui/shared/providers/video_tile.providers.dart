import 'package:broody/core/extensions/image.x.dart';
import 'package:broody/ui/shared/providers/video_player_controller.provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';

final assetEntityFileProvider = FutureProvider.autoDispose.family(
  (ref, AssetEntity entity) async {
    print("Obtaining File");
    final realFile = await entity.file;
    if (realFile != null) return realFile;
    debugPrint("Fallback to originFile");
    return await entity.originFile;
  },
);

final assetEntitySizeProvider =
    Provider.autoDispose.family<Size, AssetEntity>((ref, entity) {
  return ref.watch(_assetEntitySizeProvider(entity)).value ??
      entity.orientatedSize;
});

final _assetEntitySizeProvider =
    StreamProvider.autoDispose.family<Size, AssetEntity>(
  (ref, AssetEntity entity) async* {
    yield entity.orientatedSize;
    final thumbData = await entity.thumbData;
    //TODO load video instead
    if (thumbData == null) return;
    final image = await decodeImageOnIsolate(thumbData);
    if (image == null) return;
    final entityAspect = entity.orientatedSize.aspectRatio;
    final imageAspect = image.width / image.height;
    final isFlipped =
        (1 / entityAspect - imageAspect).abs() < (entityAspect - imageAspect);
    if (isFlipped) {
      yield Size(entity.orientatedHeight.toDouble(),
          entity.orientatedWidth.toDouble());
    }
  },
);

final galleryVideoControllerProvider =
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

final galleryVideoThumbnailProvider =
    FutureProvider.autoDispose.family((ref, AssetEntity entity) async {
  final thumb = await entity.thumbData;
  if (thumb == null) {
    throw Exception("Couldn't retrieve thumbnail for video!");
  }
  return MemoryImage(thumb);
});

final galleryVideoIsLocalProvider =
    FutureProvider.autoDispose.family((ref, AssetEntity entity) async {
  return await entity.isLocallyAvailable;
});
