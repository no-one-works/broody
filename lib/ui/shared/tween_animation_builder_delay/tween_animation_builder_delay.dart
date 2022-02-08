import 'package:flutter/widgets.dart';

/// Mimics the [TweenAnimationBuilder] but with an optional delay.
class TweenAnimationBuilderDelay<T extends Object?> extends StatefulWidget {
  final Tween<T> tween;
  final Duration duration;
  final ValueWidgetBuilder<T> builder;
  final Duration delay;
  final Curve curve;
  final Widget? child;
  final VoidCallback? onEnd;
  final bool delayOnlyOnce;

  const TweenAnimationBuilderDelay({
    Key? key,
    required this.tween,
    required this.duration,
    required this.builder,
    required this.delay,
    this.curve = Curves.linear,
    this.child,
    this.onEnd,
    this.delayOnlyOnce = true,
  }) : super(key: key);

  @override
  createState() => _TweenAnimationBuilderDelayState<T>();
}

// Note: Requires [StateDelay] from my './animation_mixins.dart' gist.
class _TweenAnimationBuilderDelayState<T extends Object?>
    extends State<TweenAnimationBuilderDelay<T>> {
  late Tween<T> _tween = widget.tween;
  late final Tween<T> _tweenInit =
      Tween(begin: widget.tween.begin, end: widget.tween.begin);

  bool _delayRanOut = false;

  @override
  void initState() {
    _setTween();
    super.initState();
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.tween.end != widget.tween.end) _setTween();
  }

  _setTween() => setState(() {
        _tween = _delayRanOut ? widget.tween : _tweenInit;

        if (!_delayRanOut) {
          Future.delayed(widget.delay).then((_) {
            if (mounted) {
              setState(() {
                _delayRanOut = widget.delayOnlyOnce;
                _tween = widget.tween;
              });
            }
          });
        }
      });

  @override
  Widget build(BuildContext context) => TweenAnimationBuilder<T>(
        tween: _tween,
        duration: widget.duration,
        curve: widget.curve,
        builder: widget.builder,
        child: widget.child,
        onEnd: widget.onEnd,
      );
}
