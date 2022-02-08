import 'dart:math';
import 'dart:ui';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;

extension BlurHashX on BlurHash {
  Color getSingleColor() {
    final triplet = components.first.first;
    return Color.fromRGBO(
      _linearTosRgb(triplet.r),
      _linearTosRgb(triplet.g),
      _linearTosRgb(triplet.b),
      1.0,
    );
  }

  int _linearTosRgb(double value) {
    final v = value.clamp(0.0, 1.0);
    if (v <= 0.0031308) return (v * 12.92 * 255.0 + 0.5).toInt();
    return ((1.055 * pow(v, 1.0 / 2.4) - 0.055) * 255.0 + 0.5).toInt();
  }
}

Future<BlurHash> encodeBlurHashOnIsolate(img.Image image) {
  return compute(_encode, image);
}

Future<BlurHash> decodeBlurHashOnIsolate(String hash) {
  return compute(_decode, hash);
}

BlurHash _encode(img.Image image) {
  return BlurHash.encode(image);
}

BlurHash _decode(String hash) {
  return BlurHash.decode(hash);
}
