import 'dart:ui';

extension ColorX on Color {
  bool isDark() => computeLuminance() <= 0.15;
}

extension IntColorX on int {
  Color toColor() => Color(this);
}
