import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    Key? key,
    this.padding = 0,
    this.size = const Size(42, 42),
  }) : super(key: key);

  final double padding;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: AspectRatio(
          aspectRatio: 1,
          child: Image.asset("assets/img/icon.png"),
        ),
      ),
    );
  }
}
