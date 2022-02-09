import 'package:broody/model/entry/entry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'compilation.freezed.dart';
part 'compilation.g.dart';

const compilationAlgorithmVersion = 2;

@freezed
class Compilation with _$Compilation {
  const factory Compilation.create({
    required String uid,
    required String projectUid,
    required String projectTitle,
    int? month,
    required String destination,
    required List<SavedEntry> usedEntries,
    required double width,
    required double height,
    required String projectPath,
    required DateTime created,
  }) = CreateCompilation;

  const factory Compilation.saved({
    required String uid,
    required String filename,
    required String projectUid,
    int? month,
    required List<SavedEntry> usedEntries,
    required double width,
    required double height,
    @Default(compilationAlgorithmVersion) int algorithmVersion,
    required DateTime created,
  }) = SavedCompilation;

  factory Compilation.fromJson(Map<String, dynamic> json) =>
      _$CompilationFromJson(json);
}
