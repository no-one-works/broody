import 'dart:async';
import 'dart:convert';

import 'package:broody/core/constants/box_keys.dart';
import 'package:broody/core/constants/box_type_ids.dart';
import 'package:broody/core/extensions/hive_box.x.dart';
import 'package:broody/model/project/project.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class IProjectDatasource {
  List<Project> get projects;

  Stream<List<Project>> get projects$;

  FutureOr<void> setProject(Project project);

  FutureOr<void> deleteProject(String uid);

  Project? getProject(String uid);
}

final projectDatasourceProvider =
    Provider<IProjectDatasource>((ref) => ProjectDatasourceImpl());

class ProjectDatasourceImpl implements IProjectDatasource {
  late final Box<Project> _box = Hive.box<Project>(projectBoxKey);

  @override
  List<Project> get projects => _box.values.toList();

  @override
  Stream<List<Project>> get projects$ => _box.watchValues();

  @override
  FutureOr<void> setProject(Project project) {
    _box.put(project.uid, project);
  }

  @override
  FutureOr<void> deleteProject(String uid) async {
    await _box.delete(uid);
  }

  @override
  Project? getProject(String uid) {
    return _box.get(uid);
  }
}

class ProjectAdapter extends TypeAdapter<Project> {
  @override
  int get typeId => projectTypeId;

  @override
  Project read(BinaryReader reader) {
    return Project.fromJson(jsonDecode(reader.readString()));
  }

  @override
  void write(BinaryWriter writer, Project obj) {
    writer.writeString(jsonEncode(obj.toJson()));
  }
}
