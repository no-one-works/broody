import 'dart:async';
import 'dart:convert';

import 'package:broody/core/constants/box_keys.dart';
import 'package:broody/core/constants/box_type_ids.dart';
import 'package:broody/core/extensions/date_time.x.dart';
import 'package:broody/core/extensions/hive_box.x.dart';
import 'package:broody/model/entry/entry.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class IEntryDatasource {
  FutureOr<void> initNewProject();

  List<SavedEntry> get entries;

  Stream<List<SavedEntry>> get entries$;

  FutureOr<void> setEntry(SavedEntry entry);

  FutureOr<void> deleteEntry(DateTime timestamp);

  SavedEntry? getEntry(DateTime timestamp);

  FutureOr<void> deleteProject();
}

final entryDatasourceProvider = Provider.autoDispose
    .family<IEntryDatasource, String>(
        (ref, projectUid) => LocalEntryDatasource(projectUid: projectUid));

class LocalEntryDatasource extends IEntryDatasource {
  LocalEntryDatasource({
    required this.projectUid,
  });

  final String projectUid;
  late final Box<SavedEntry> _box =
      Hive.box<SavedEntry>(entryBoxKey(projectUid));

  @override
  Future<void> initNewProject() async {
    await Hive.openBox<SavedEntry>(entryBoxKey(projectUid));
  }

  @override
  List<SavedEntry> get entries => _box.values.toList();

  @override
  Stream<List<SavedEntry>> get entries$ => _box.watchValues();

  @override
  FutureOr<void> setEntry(SavedEntry entry) {
    _box.put(entry.uid, entry);
  }

  @override
  FutureOr<void> deleteEntry(DateTime timestamp) {
    _box.delete(timestamp.startOfDay().toIso8601String());
  }

  @override
  SavedEntry? getEntry(DateTime timestamp) {
    return _box.get(timestamp.startOfDay().toIso8601String());
  }

  @override
  FutureOr<void> deleteProject() async {
    await _box.deleteFromDisk();
  }
}

class EntryAdapter extends TypeAdapter<SavedEntry> {
  @override
  int get typeId => entryTypeId;

  @override
  SavedEntry read(BinaryReader reader) {
    return SavedEntry.fromJson(jsonDecode(reader.readString()));
  }

  @override
  void write(BinaryWriter writer, SavedEntry obj) {
    writer.writeString(jsonEncode(obj.toJson()));
  }
}
