import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

class SizeConverter implements JsonConverter<Size, String> {
  const SizeConverter();

  @override
  Size fromJson(String json) {
    final values = json.split(";");
    return Size(double.parse(values[0]), double.parse(values[1]));
  }

  @override
  String toJson(Size size) => "${size.width};${size.height}";
}
