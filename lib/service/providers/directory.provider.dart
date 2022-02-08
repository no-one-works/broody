import 'dart:io';

import 'package:dartx/dartx_io.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

final directoryProvider = FutureProvider<Directory>((ref) {
  return getApplicationDocumentsDirectory();
});

final projectDirectoryProvider =
    FutureProvider.family<Directory, String>((ref, projectId) async {
  final directory = await ref.watch(directoryProvider.future);
  return Directory("${directory.path}/$projectId");
});

final compilationDirectoryProvider =
    FutureProvider.family<Directory, String>((ref, projectId) async {
  final directory = await ref.watch(projectDirectoryProvider(projectId).future);
  final subdir = directory.subdir("compilation");
  if (!await subdir.exists()) {
    await subdir.create(recursive: true);
  }
  return subdir;
});
