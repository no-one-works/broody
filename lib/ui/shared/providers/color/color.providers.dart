import 'dart:ui';

import 'package:broody/core/extensions/image.x.dart';
import 'package:broody/core/extensions/scheme.x.dart';
import 'package:broody/service/providers/project.providers.dart';
import 'package:broody/ui/shared/providers/color/request/color_scheme_request.dart';
import 'package:broody/ui/shared/providers/video_tile.providers.dart';
import 'package:broody/ui/theme/colors.dart';
import 'package:broody/ui/theme/text_theme.dart';
import 'package:broody/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:photo_manager/photo_manager.dart';

final colorSchemeProvider = Provider.autoDispose
    .family<ColorScheme, ColorSchemeRequest>((ref, request) {
  final colorValue = request.when(
    color: (c, _) => c.value,
    entry: (e, projectColor, __) =>
        Blend.harmonize(e.color!, projectColor.value),
    project: (p, _) => p.color ?? themeSeedColor.value,
  );
  final scheme = request.brightness == Brightness.light
      ? Scheme.light(colorValue)
      : Scheme.dark(colorValue);
  return scheme.toColorScheme(request.brightness);
});

final _assetEntityPaletteProvider = FutureProvider.autoDispose
    .family<CorePalette, AssetEntity>((ref, assetEntity) async {
  final thumb =
      await ref.watch(galleryVideoThumbnailProvider(assetEntity).future);
  final img = await decodeImageOnIsolate(thumb.bytes);
  final quantized = await QuantizerCelebi().quantize(img!.data, 128);
  final ranked = Score.score(quantized.colorToCount);
  return CorePalette.fromList(ranked);
});

final appThemeProvider =
    Provider.autoDispose.family<ThemeData, Brightness>((ref, brightness) {
  final project = ref.watch(selectedProjectProvider);
  final colorScheme = project == null
      ? ColorScheme.fromSeed(
          seedColor: themeSeedColor,
          brightness: brightness,
        )
      : ref.watch(colorSchemeProvider(
          ProjectColorSchemeRequest(project: project, brightness: brightness)));
  final textTheme = broodyTextTheme.apply(
    bodyColor: colorScheme.onBackground,
    displayColor: colorScheme.onBackground,
    decorationColor: colorScheme.onBackground,
  );
  return getTheme(colorScheme, textTheme);
});
