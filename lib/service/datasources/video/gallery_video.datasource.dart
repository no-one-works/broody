import 'dart:io';

import 'package:broody/core/extensions/date_time.x.dart';
import 'package:collection/collection.dart';
import 'package:dartx/dartx_io.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';

abstract class IGalleryVideoDatasource {
  Future<AssetPathEntity?> getFilteredAlbum({
    required Duration minDuration,
    required DateTime date,
  });

  Future<List<AssetEntity>> getVideos(
    AssetPathEntity pathEntity, {
    required int page,
    required int perPage,
  });

  Future<AssetEntity?> saveVideoFile(File file);

  Future<void> deleteVideo(AssetEntity entity);
}

final galleryVideoDatasourceProvider =
    Provider<IGalleryVideoDatasource>((ref) => GalleryVideoDatasource());

class GalleryVideoDatasource implements IGalleryVideoDatasource {
  @override
  Future<AssetPathEntity?> getFilteredAlbum(
      {required Duration minDuration, required DateTime date}) async {
    var result = await PhotoManager.requestPermissionExtend();
    if (!result.isAuth) {
      throw const FileSystemException(
          "Couldn't access gallery since there was no permission!");
    }
    final albums = await PhotoManager.getAssetPathList(
      type: RequestType.video,
      //onlyAll: true,
      hasAll: true,
      filterOption: FilterOptionGroup(
        containsLivePhotos: false,
        orders: const [
          OrderOption(type: OrderOptionType.createDate, asc: false)
        ],
        createTimeCond: DateTimeCond(
          min: date.startOfDay(),
          max: date.endOfDay(),
        ),
        videoOption: FilterOption(
          durationConstraint: DurationConstraint(
            min: minDuration,
          ),
        ),
      ),
    );
    return albums.firstWhereOrNull((album) => album.isAll);
  }

  @override
  Future<List<AssetEntity>> getVideos(
    AssetPathEntity pathEntity, {
    required int page,
    required int perPage,
  }) {
    return pathEntity.getAssetListPaged(page: page, size: perPage);
  }

  @override
  Future<AssetEntity?> saveVideoFile(File file) {
    return PhotoManager.editor.saveVideo(file, title: file.name);
  }

  @override
  Future<void> deleteVideo(AssetEntity entity) {
    return PhotoManager.editor.deleteWithIds([entity.id]);
  }
}
