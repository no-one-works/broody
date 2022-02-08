import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:image/image.dart';

Future<Image?> decodeImageOnIsolate(Uint8List bytes) {
  return compute(_decodeImage, bytes);
}

Image? _decodeImage(Uint8List bytes) {
  return decodeImage(bytes);
}
