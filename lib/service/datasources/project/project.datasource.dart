import 'dart:async';
import 'dart:convert';

import 'package:broody/core/constants/box_keys.dart';
import 'package:broody/core/constants/box_type_ids.dart';
import 'package:broody/core/extensions/hive_box.x.dart';
import 'package:broody/model/project/project.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';

abstract class IProjectDatasource {
  List<Project> get projects;

  Stream<List<Project>> get projects$;

  FutureOr<void> setProject(Project project);

  FutureOr<void> deleteProject(String uid);

  Project? getProject(String uid);

  Stream<Project?> watchProject(String uid);

  Project? get activeProject;

  Stream<Project?> get activeProject$;

  FutureOr<void> setActiveProject(Project? project);
}

final projectDatasourceProvider =
    Provider<IProjectDatasource>((ref) => ProjectDatasourceImpl());

class ProjectDatasourceImpl implements IProjectDatasource {
  late final Box<Project> _box = Hive.box<Project>(projectBoxKey);
  late final Box<String> _activeProjectBox =
      Hive.box<String>(activeProjectBoxKey);

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

  @override
  Stream<Project?> watchProject(String uid) {
    return _box
        .watch(key: uid)
        .map((event) => event.value as Project?)
        .startWith(getProject(uid));
  }

  @override
  Project? get activeProject {
    String? uid = _activeProjectBox.get(activeProjectBoxKey);
    return uid == null ? null : getProject(uid);
  }

  @override
  Stream<Project?> get activeProject$ => _activeProjectBox
      .watch(key: activeProjectBoxKey)
      .switchMap(
        (event) => event.value == null
            ? Stream.value(null)
            : watchProject(event.value),
      )
      .startWith(activeProject);

  @override
  FutureOr<void> setActiveProject(Project? project) {
    if (project == null) {
      _activeProjectBox.delete(activeProjectBoxKey);
    } else {
      _activeProjectBox.put(activeProjectBoxKey, project.uid);
    }
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
