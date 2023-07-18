import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:broody/core/constants/box_type_ids.dart';
import 'package:broody/model/compilation/compilation.dart';
import 'package:broody/service/datasources/compilation/broody_compilation.datasource.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_value/loading_value.dart';

abstract class CompilationDatasource {
  List<SavedCompilation> get compilations;

  Stream<List<SavedCompilation>> get compilations$;

  FutureOr<void> setCompilation(SavedCompilation compilation);

  SavedCompilation? getCompilationForProject({
    required String projectUid,
    DateTime? monthOfYear,
  });

  Stream<LoadingValue<SavedCompilation?>> createCompilation(
      {required CreateCompilation createCompilation});

  Future<void> cancelCompilationCreation();

  Future<void> clearCompilations(List<Directory> compilationDirectories);

  Future<bool> deleteCompilation({
    required SavedCompilation compilation,
    File? file,
  });

  Future<File?> loadCompilation({required File file});
}

final compilationDatasourceProvider = Provider<CompilationDatasource>(
  (ref) => BroodyCompilationDatasource(),
);

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
