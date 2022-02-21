import 'package:broody/core/extensions/date_time.x.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'entry.freezed.dart';
part 'entry.g.dart';

const int entryAlgorithmVersion = 5;

@freezed
class Entry with _$Entry {
  String get uid => day.toIso8601String();

  DateTime get day => timestamp.startOfDay();

  Entry._();

  factory Entry.editing({
    required DateTime timestamp,
    required String projectId,
    required String assetEntityId,
    required String videoPath,
    required Duration startPoint,
    required Duration duration,
    required int width,
    required int height,
    List<int>? thumbnailBytes,
  }) = EditingEntry;

  factory Entry.saved({
    @Default(entryAlgorithmVersion) int exportVersion,
    required DateTime timestamp,
    required DateTime changedWhen,
    required String projectId,
    required String assetEntityId,
    required String clipFileName,
    required String blurHash,
    int? color,
    required Duration startPoint,
    required Duration duration,
    required int width,
    required int height,
  }) = SavedEntry;

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);
}
