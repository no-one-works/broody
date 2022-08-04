import 'package:broody/model/entry/entry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'compilation.freezed.dart';
part 'compilation.g.dart';

const compilationAlgorithmVersion = 2;

@freezed
class Compilation with _$Compilation {
  const Compilation._();

  const factory Compilation.create({
    required String uid,
    required String projectUid,
    required String projectTitle,
    DateTime? monthOfYear,
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
    DateTime? monthOfYear,
    required List<SavedEntry> usedEntries,
    required double width,
    required double height,
    @Default(compilationAlgorithmVersion) int algorithmVersion,
    required DateTime created,
  }) = SavedCompilation;

  factory Compilation.fromJson(Map<String, dynamic> json) =>
      _$CompilationFromJson(json);

  String get filename => map(
        create: (c) {
          {
            final outputCompilationName = c.monthOfYear == null
                ? c.projectTitle
                : "${c.projectTitle}-${c.monthOfYear}";
            final filename = Uri.encodeFull(outputCompilationName)
                .replaceAll(RegExp(r'[ /\\?%*:|"<>]'), '-');
            return filename;
          }
        },
        saved: (saved) => saved.filename,
      );
}
