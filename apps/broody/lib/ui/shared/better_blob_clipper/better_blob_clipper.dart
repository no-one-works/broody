import 'package:blobs/blobs.dart';
import 'package:flutter/widgets.dart';

export 'package:blobs/blobs.dart';

class BetterBlobClipper extends CustomClipper<Path> {
  final String? id;
  final int edgesCount;
  final int minGrowth;
  final double scale;

  BetterBlobClipper({
    this.id,
    this.edgesCount = 6,
    this.minGrowth = 6,
    this.scale = 1,
  });

  @override
  Path getClip(Size size) {
    var blobData = BlobGenerator(
      id: id,
      edgesCount: edgesCount,
      minGrowth: minGrowth,
      size: size,
    ).generate();
    final transform = Matrix4.identity()
      ..translate(
          -size.width * 0.5 * (scale - 1), -size.height * 0.5 * (scale - 1))
      ..scale(scale);
    return connectPoints(blobData.curves!).transform(transform.storage);
  }

  @override
  bool shouldReclip(BetterBlobClipper oldClipper) {
    return true;
    return oldClipper.id != id ||
        oldClipper.edgesCount != edgesCount ||
        oldClipper.minGrowth != minGrowth ||
        oldClipper.scale != scale;
  }
}
