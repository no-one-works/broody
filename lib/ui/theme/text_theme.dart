import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//TextTheme get broodyTextTheme => Typography.blackRedmond;
TextTheme get broodyTextTheme => displayTextTheme.copyWith(
      //headline3: bodyTextTheme.headline3,
      //headline4: bodyTextTheme.headline4,
      headline5: bodyTextTheme.headline5,
      headline6: bodyTextTheme.headline6,
      bodyText1: bodyTextTheme.bodyText1,
      bodyText2: bodyTextTheme.bodyText2,
      button: bodyTextTheme.button,
      overline: bodyTextTheme.overline,
      caption: bodyTextTheme.caption,
      subtitle1: bodyTextTheme.subtitle1,
      subtitle2: bodyTextTheme.subtitle2,
    );

TextTheme displayTextTheme = GoogleFonts.lexendDecaTextTheme();
TextTheme bodyTextTheme = GoogleFonts.interTextTheme();
