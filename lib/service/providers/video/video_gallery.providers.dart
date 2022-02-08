import 'dart:async';
import 'dart:io';

import 'package:broody/model/common/loading_value/loading_value.dart';
import 'package:broody/service/providers/project.providers.dart';
import 'package:broody/service/repositories/video_gallery.repository.dart';
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
