import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BouncyPressable extends HookWidget {
  const BouncyPressable({
    required this.child,
    this.onTap,
    this.pressedScale = 0.95,
    this.duration = kThemeAnimationDuration,
    this.curve = Curves.ease,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final double pressedScale;
  final Curve curve;
  final Duration duration;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final pressed = useState(false);

    return GestureDetector(
      onTapDown: (_) => pressed.value = true,
      onTapCancel: () => pressed.value = false,
      onTapUp: (_) => pressed.value = false,
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 1, end: pressed.value ? pressedScale : 1),
        duration: kThemeAnimationDuration,
        curve: Curves.ease,
        builder: (context, value, child) => Transform.scale(
          scale: value,
          child: child,
        ),
        child: child,
      ),
    );
  }
}
