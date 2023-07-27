import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData getTheme(ColorScheme colorScheme, TextTheme textTheme) =>
    ThemeData.from(
      colorScheme: colorScheme,
      textTheme: textTheme,
    ).copyWith(
      useMaterial3: true,
      shadowColor: colorScheme.shadow,
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        scrolledUnderElevation: 0,
        systemOverlayStyle: colorScheme.brightness == Brightness.light
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
        elevation: 0,
        iconTheme: IconThemeData(
          color: colorScheme.secondary,
        ),
        centerTitle: false,
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.onSurface.withOpacity(.02),
        thickness: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 2,
          ),
        ),
        filled: true,
        focusColor: Colors.transparent,
      ),
      cardTheme: CardTheme(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
