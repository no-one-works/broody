import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SnapbackInteractiveViewer extends HookWidget {
  const SnapbackInteractiveViewer({
    Key? key,
    required this.child,
    this.clipBehavior = Clip.none,
    this.snapbackDuration = kThemeAnimationDuration,
    this.maxScale = 2,
  }) : super(key: key);

  final Widget child;
  final Clip clipBehavior;
  final Duration snapbackDuration;
  final double maxScale;

  @override
  Widget build(BuildContext context) {
    final transformationController = useTransformationController();

    final zoomAnimationController = useAnimationController(
      duration: snapbackDuration,
      lowerBound: 0,
      upperBound: 1,
    );

    return InteractiveViewer(
      maxScale: maxScale,
      transformationController: transformationController,
      onInteractionEnd: (s) => s.pointerCount == 0
          ? _snapBack(
              transformationController,
              zoomAnimationController,
            )
          : null,
      clipBehavior: Clip.none,
      child: child,
    );
  }

  void _snapBack(TransformationController c, AnimationController a) async {
    final tween = Matrix4Tween(begin: c.value, end: Matrix4.identity())
        .animate(CurvedAnimation(parent: a, curve: Curves.ease));

    // ignore: prefer_function_declarations_over_variables
    final setter = () => c.value = tween.value;

    a.addListener(setter);
    a.forward(from: 0);
    await Future.delayed(a.duration ?? Duration.zero);
    a.removeListener(setter);
  }
}
