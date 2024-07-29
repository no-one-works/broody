import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TwoFingerPointerWidget extends HookWidget {
  final Widget child;
  final VoidCallback? onStart;
  final VoidCallback? onEnd;

  const TwoFingerPointerWidget({
    Key? key,
    required this.child,
    this.onStart,
    this.onEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pointerCount = useState(0);
    return Listener(
      onPointerDown: (_) {
        pointerCount.value++;
        if (pointerCount.value == 2) {
          onStart?.call();
        }
      },
      onPointerUp: (_) {
        if (pointerCount.value == 2) {
          onEnd?.call();
        }
        pointerCount.value--;
      },
      onPointerCancel: (_) {
        if (pointerCount.value == 2) {
          onEnd?.call();
        }
        pointerCount.value--;
      },
      child: child,
    );
  }
}
