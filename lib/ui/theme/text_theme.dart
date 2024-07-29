import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//TextTheme get broodyTextTheme => Typography.blackRedmond;
TextTheme get broodyTextTheme => displayTextTheme.copyWith(
      //headline3: bodyTextTheme.headline3,
      //headline4: bodyTextTheme.headline4,
      headlineSmall: bodyTextTheme.headlineSmall,
      titleLarge: bodyTextTheme.titleLarge,
      bodyLarge: bodyTextTheme.bodyLarge,
      bodyMedium: bodyTextTheme.bodyMedium,
      labelLarge: bodyTextTheme.labelLarge,
      labelSmall: bodyTextTheme.labelSmall,
      bodySmall: bodyTextTheme.bodySmall,
      titleMedium: bodyTextTheme.titleMedium,
      titleSmall: bodyTextTheme.titleSmall,
    );

TextTheme displayTextTheme = GoogleFonts.lexendDecaTextTheme();
TextTheme bodyTextTheme = GoogleFonts.interTextTheme();
