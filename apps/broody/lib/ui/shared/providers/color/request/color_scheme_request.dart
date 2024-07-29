import 'dart:ui';

import 'package:broody/model/entry/entry.dart';
import 'package:broody/model/project/project.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_scheme_request.freezed.dart';

@freezed
class ColorSchemeRequest with _$ColorSchemeRequest {
  const factory ColorSchemeRequest.color({
    required Color color,
    required Brightness brightness,
  }) = ColorRequest;

  const factory ColorSchemeRequest.entry({
    required SavedEntry entry,
    required Color projectColor,
    required Brightness brightness,
  }) = EntryColorSchemeRequest;

  const factory ColorSchemeRequest.project({
    required Project project,
    required Brightness brightness,
  }) = ProjectColorSchemeRequest;
}
