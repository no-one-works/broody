import 'dart:async';
import 'dart:io';

import 'package:broody/core/extensions/image.x.dart';
import 'package:broody/model/common/loading_value/loading_value.dart';
import 'package:broody/service/providers/project.providers.dart';
import 'package:broody/service/repositories/video_gallery.repository.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';

final videosChangedProvider = StreamProvider.autoDispose<int>((ref) {
  final StreamController<int> controller = StreamController();
  void changeNotify(MethodCall call) {
    final count = call.arguments["newCount"];
    if (count != call.arguments["oldCount"]) {
      controller.add(count);
    }
  }

  PhotoManager.addChangeCallback((call) => changeNotify(call));
  PhotoManager.startChangeNotify();
  ref.onDispose(() {
    PhotoManager.removeChangeCallback(changeNotify);
    PhotoManager.stopChangeNotify();
    controller.close();
  });
  return controller.stream;
});

final videoGalleryPermissionProvider =
    FutureProvider.autoDispose<bool>((ref) async {
  final changes = ref.watch(videosChangedProvider);
  final permission = await PhotoManager.requestPermissionExtend();
  return permission.isAuth;
});

final _albumProvider =
    FutureProvider.autoDispose.family<AssetPathEntity?, DateTime>((ref, date) {
  ref.watch(videosChangedProvider);
  final project = ref.watch(selectedProjectProvider);
  if (project == null) {
    throw Exception("No active project, can't get videos!");
  }
  final repo = ref.watch(videoGalleryRepositoryProvider);
  return repo.getFilteredAlbum(
    minDuration: project.entryDuration,
    date: date,
  );
});

final dayHasVideosProvider =
    Provider.autoDispose.family<bool, DateTime>((ref, date) {
  //TODO Check this regularly, iOS is just too fucking slow
  if (Platform.isIOS) return true;
  final album = ref.watch(_albumProvider(date));
  return (album.asData?.value?.assetCount ?? 0) > 0;
});

final videosProvider = FutureProvider.autoDispose
    .family<List<AssetEntity>, DateTime>((ref, date) async {
  final repo = ref.watch(videoGalleryRepositoryProvider);
  final album = await ref.watch(_albumProvider(date).future);
  final activeProject = ref.watch(selectedProjectProvider);
  if (album == null || activeProject == null) {
    return [];
  }
  ref.onDispose(() {
    debugPrint("Clearing Photo Cache");
    PhotoManager.clearFileCache();
  });
  return await repo.getVideos(pathEntity: album);
});

final _pickedVideoStreamProvider = StreamProvider.autoDispose
    .family<LoadingValue<File>, AssetEntity>((ref, assetEntity) {
  final repo = ref.watch(videoGalleryRepositoryProvider);
  return repo.pickVideo(assetEntity);
});

final pickedVideoProvider = Provider.autoDispose
    .family<LoadingValue<File>, AssetEntity>((ref, assetEntity) {
  final asyncValue = ref.watch(_pickedVideoStreamProvider(assetEntity));
  return asyncValue.when(
    data: (v) => v,
    error: (e, s) => LoadingValue.error(error: e, stackTrace: s),
    loading: () => const LoadingValue.loading(progress: 0),
  );
});

final galleryVideoIsLocalProvider =
    FutureProvider.autoDispose.family((ref, AssetEntity entity) async {
  return await entity.isLocallyAvailable;
});

final assetEntityFileProvider =
    FutureProvider.autoDispose.family<File?, AssetEntity>(
  (ref, AssetEntity entity) async {
    debugPrint("Obtaining Converted File");
    File? file = await entity.file;
    if (file == null) {
      debugPrint("Fallback to originFile");
      file = await entity.originFile;
    }
    return file;
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
