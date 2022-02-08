import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

extension SchemeX on Scheme {
  ColorScheme toColorScheme(Brightness brightness) {
    return ColorScheme(
      outline: Color(outline),
      shadow: Color(shadow),
      primary: Color(primary),
      onPrimary: Color(onPrimary),
      primaryContainer: Color(primaryContainer),
      onPrimaryContainer: Color(onPrimaryContainer),
      inversePrimary: Color(inversePrimary),
      secondary: Color(secondary),
      onSecondary: Color(onSecondary),
      secondaryContainer: Color(secondaryContainer),
      onSecondaryContainer: Color(secondaryContainer),
      tertiary: Color(tertiary),
      onTertiary: Color(onTertiary),
      tertiaryContainer: Color(onTertiaryContainer),
      onTertiaryContainer: Color(onTertiaryContainer),
      surface: Color(surface),
      onSurface: Color(onSurface),
      surfaceVariant: Color(surfaceVariant),
      onSurfaceVariant: Color(onSurfaceVariant),
      inverseSurface: Color(inverseSurface),
      onInverseSurface: Color(inverseOnSurface),
      background: Color(background),
      onBackground: Color(onBackground),
      error: Color(error),
      onError: Color(onError),
      errorContainer: Color(errorContainer),
      onErrorContainer: Color(onErrorContainer),
      brightness: brightness,
    );
  }
}
