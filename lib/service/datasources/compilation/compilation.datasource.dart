import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:broody/core/constants/box_keys.dart';
import 'package:broody/core/constants/box_type_ids.dart';
import 'package:broody/core/extensions/hive_box.x.dart';
import 'package:broody/model/common/loading_value/loading_value.dart';
import 'package:broody/model/compilation/compilation.dart';
import 'package:collection/src/iterable_extensions.dart';
import 'package:dartx/dartx_io.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/ffmpeg_kit_config.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/log.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/return_code.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

abstract class ICompilationDatasource {
  List<SavedCompilation> get compilations;

  Stream<List<SavedCompilation>> get compilations$;

  FutureOr<void> setCompilation(SavedCompilation compilation);

  SavedCompilation? getCompilationForProject(
      {required String projectUid, int? month});

  Stream<LoadingValue<SavedCompilation?>> createCompilation(
      {required CreateCompilation createCompilation});

  Future<bool> deleteCompilation({required File file});

  Future<File?> loadCompilation({required File file});
}

final compilationDatasourceProvider =
    Provider<ICompilationDatasource>((ref) => CompilationDatasource());

class CompilationDatasource extends ICompilationDatasource {
  late final Box<SavedCompilation> _box =
      Hive.box<SavedCompilation>(compilationBoxKey);

  @override
  List<SavedCompilation> get compilations => _box.values.toList();

  @override
  Stream<List<SavedCompilation>> get compilations$ => _box.watchValues();

  @override
  FutureOr<void> setCompilation(SavedCompilation compilation) {
    _box.put(compilation.projectUid, compilation);
  }

  @override
  Stream<LoadingValue<SavedCompilation?>> createCompilation(
      {required CreateCompilation createCompilation}) async* {
    final extension =
        File(createCompilation.usedEntries.first.clipFileName).extension;
    final outputCompilationName = createCompilation.month == null
        ? "${createCompilation.projectTitle}$extension"
        : "${createCompilation.projectTitle}-${createCompilation.month}$extension";
    final dir = Directory(createCompilation.destination);
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    final outputPath = "${dir.path}/$outputCompilationName";

    final path = await getTemporaryDirectory();
    debugPrint(path.path);
    debugPrint(outputPath);
    final videoSourcesStringFile = File("${path.path}/videoSources.txt");
    final videoSourcesString = createCompilation.usedEntries.map(
        (e) => "file '${createCompilation.projectPath}/${e.clipFileName}'");
    await videoSourcesStringFile.writeAsString(videoSourcesString.join("\n"));

    var command =
        '-y -f concat -safe 0 -i ${videoSourcesStringFile.path} -c copy "$outputPath"';

    final Completer<File?> completer = Completer<File?>();
    FFmpegKit.executeAsync(
      command,
      (session) async {
        final state =
            FFmpegKitConfig.sessionStateToString(await session.getState());
        final returnCode = await session.getReturnCode();
        debugPrint(
            "FFmpeg process exited with state $state and rc $returnCode");
        if (ReturnCode.isSuccess(returnCode)) {
          debugPrint("FFmpeg processing completed successfully.");
          debugPrint('Video successfully saved');
          completer.complete(File(outputPath));
        } else {
          debugPrint("FFmpeg processing failed.");
          debugPrint("Couldn't save the video");
          completer.complete(null);
        }
      },
      (Log log) => debugPrint(log.getMessage()),
    );
    final file = await completer.future;

    final savedCompilation = file == null
        ? null
        : SavedCompilation(
            uid: createCompilation.uid,
            filename: file.name,
            projectUid: createCompilation.projectUid,
            month: createCompilation.month,
            usedEntries: createCompilation.usedEntries,
            created: DateTime.now(),
            width: createCompilation.width,
            height: createCompilation.height,
          );

    if (savedCompilation != null) {
      setCompilation(savedCompilation);
    }
    yield LoadingValue.data(value: savedCompilation);
  }

  @override
  Future<bool> deleteCompilation({required File file}) async {
    try {
      await file.delete();
      return true;
    } catch (e) {
      debugPrint("Could not delete file: $e");
      return false;
    }
  }

  @override
  Future<File?> loadCompilation({required File file}) async {
    if (await file.exists()) {
      return file;
    }
    return null;
  }

  @override
  SavedCompilation? getCompilationForProject({
    required String projectUid,
    int? month,
  }) {
    return compilations.firstWhereOrNull(
      (c) => c.projectUid == projectUid && c.month == month,
    );
  }
}

class SavedCompilationAdapter extends TypeAdapter<SavedCompilation> {
  @override
  int get typeId => compilationTypeId;

  @override
  SavedCompilation read(BinaryReader reader) {
    return SavedCompilation.fromJson(jsonDecode(reader.readString()));
  }

  @override
  void write(BinaryWriter writer, Compilation obj) {
    writer.writeString(jsonEncode(obj.toJson()));
  }
}
