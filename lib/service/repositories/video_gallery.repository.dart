import 'dart:io';

import 'package:broody/service/datasources/video/gallery_video.datasource.dart';
import 'package:broody/service/repositories/repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_value/loading_value.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:riverpod/src/provider.dart';

abstract class VideoGalleryRepository extends RepositoryBase {
  VideoGalleryRepository(ProviderRef ref) : super(ref);

  Future<AssetPathEntity?> getFilteredAlbum({
    required Duration minDuration,
    required DateTime date,
  });

  Future<List<AssetEntity>> getVideos({
    required AssetPathEntity pathEntity,
  });

  Future<AssetEntity?> recordVideo();

  Stream<LoadingValue<File>> pickVideo(AssetEntity entity);

  Future<void> deleteVideo(AssetEntity entity);
}

final videoGalleryRepositoryProvider =
    Provider<VideoGalleryRepository>((ref) => GalleryClipRepository(ref));

class GalleryClipRepository extends VideoGalleryRepository {
  GalleryClipRepository(ProviderRef ref) : super(ref);

  final ImagePicker picker = ImagePicker();

  @override
  Future<AssetPathEntity?> getFilteredAlbum(
          {required Duration minDuration, required DateTime date}) =>
      ref
          .read(galleryVideoDatasourceProvider)
          .getFilteredAlbum(minDuration: minDuration, date: date);

  @override
  Future<List<AssetEntity>> getVideos(
      {required AssetPathEntity pathEntity}) async {
    final videos = await ref.read(galleryVideoDatasourceProvider).getVideos(
          pathEntity,
          page: 0,
          perPage: pathEntity.assetCount,
        );
    return videos;
  }

  @override
  Future<AssetEntity?> recordVideo() async {
    final xFile = await picker.pickVideo(
      source: ImageSource.camera,
    );
    if (xFile == null) {
      return null;
    }
    final entity = await ref
        .read(galleryVideoDatasourceProvider)
        .saveVideoFile(File(xFile.path));
    return entity;
  }

  @override
  Stream<LoadingValue<File>> pickVideo(AssetEntity entity) async* {
    final isLocal = await entity.isLocallyAvailable;
    if (isLocal) {
      final file = await entity.file;
      if (file != null) {
        yield LoadingValue.data(file);
        return;
      }
    }
    final progressHandler = PMProgressHandler();
    final fileAsync = entity.loadFile(progressHandler: progressHandler);
    await for (final progressValue in progressHandler.stream) {
      if (progressValue.state == PMRequestState.success) {
        break;
      }
      yield LoadingValue.loading(progressValue.progress);
    }
    final file = await fileAsync;
    if (file == null) {
      throw Exception("Failed to load video!");
    }
    yield LoadingValue.data(file);
    return;
  }

  @override
  Future<void> deleteVideo(AssetEntity entity) {
    return ref.read(galleryVideoDatasourceProvider).deleteVideo(entity);
  }
}
