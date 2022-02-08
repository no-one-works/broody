import 'package:flutter/material.dart';

class AnimatedScaleSwitcher extends StatelessWidget {
  const AnimatedScaleSwitcher({
    Key? key,
    required this.child,
    this.duration = kThemeAnimationDuration,
    this.curve = Curves.ease,

  }) : super(key: key);

  final Widget child;
  final Duration duration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: curve,
      switchOutCurve: curve,
      transitionBuilder: (child, animation) => SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        axisAlignment: -1,
        child: FadeTransition(
          child: child,
          opacity: animation,
        ),
      ),
      child: child,
    );
  }
}