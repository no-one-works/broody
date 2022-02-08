import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ThemeData useTheme() {
  final context = useContext();
  return Theme.of(context);
}

TextTheme useTextTheme() {
  final theme = useTheme();
  return theme.textTheme;
}

ColorScheme useColorScheme() {
  final theme = useTheme();
  return theme.colorScheme;
}