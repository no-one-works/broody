import 'package:flutter/material.dart';

/// A widget used to dismiss its [child].
///
/// Similar to [Dismissible] with some adjustments.
class CustomDismissible extends StatefulWidget {
  const CustomDismissible({
    required this.child,
    this.onDismissed,
    this.dismissThreshold = 0.4,
    this.onDismissUpdated,
    this.enabled = true,
    this.axis = Axis.vertical,
  });

  final Widget child;
  final double dismissThreshold;
  final VoidCallback? onDismissed;
  final ValueChanged<double>? onDismissUpdated;
  final bool enabled;
  final Axis axis;

  @override
  _CustomDismissibleState createState() => _CustomDismissibleState();
}

class _CustomDismissibleState extends State<CustomDismissible>
    with SingleTickerProviderStateMixin {
  late AnimationController _animateController;
  late Animation<Offset> _moveAnimation;
  late Animation<double> _scaleAnimation;

  Offset _startOffset = Offset.zero;
  Offset _dragOffset = Offset.zero;
  bool _dragUnderway = false;

  bool get _isActive => _dragUnderway || _animateController.isAnimating;

  @override
  void initState() {
    super.initState();

    _animateController = AnimationController(
      duration: kThemeAnimationDuration * 2,
      vsync: this,
    )..addListener(() {
        widget.onDismissUpdated?.call((_animateController.value).clamp(0, 1));
      });

    _updateMoveAnimation();
  }

  @override
  void dispose() {
    _animateController.dispose();

    super.dispose();
  }

  void _updateMoveAnimation() {
    _moveAnimation = _animateController.drive(
      Tween<Offset>(
        begin: Offset.zero,
        end: _dragOffset,
      ),
    );

    _scaleAnimation = _animateController.drive(Tween<double>(
      begin: 1,
      end: 0.5,
    ));
  }

  void _handleDragStart(DragStartDetails details) {
    _dragUnderway = true;
    _startOffset = details.globalPosition;
    if (_animateController.isAnimating) {
      _animateController.stop();
    } else {
      _animateController.value = 0.0;
    }
    setState(_updateMoveAnimation);
  }

  void _handleDragUpdate(DragUpdateDetails details, Size size) {
    if (!_isActive || _animateController.isAnimating) {
      return;
    }

    final o = (details.globalPosition - _startOffset);
    _dragOffset = Offset(o.dx, o.dy);

    setState(_updateMoveAnimation);
    final length = widget.axis == Axis.vertical ? size.height : size.width;
    if (!_animateController.isAnimating) {
      _animateController.value = _dragOffset.distance.abs() / length / widget.dismissThreshold;
    }
  }

  void _handleDragEnd(DragEndDetails details) {
    if (!_isActive || _animateController.isAnimating) {
      return;
    }

    _dragUnderway = false;

    if (_animateController.value > widget.dismissThreshold) {
      widget.onDismissed?.call();
    } else {
      _animateController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Widget content = AnimatedBuilder(
      animation: _moveAnimation,
      builder: (context, child) => Transform.translate(
        offset: _moveAnimation.value,
        child: child,
      ),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: widget.child,
      ),
    );

    return widget.axis == Axis.vertical
        ? GestureDetector(
            behavior: HitTestBehavior.translucent,
            onVerticalDragStart: widget.enabled ? _handleDragStart : null,
            onVerticalDragUpdate:
                widget.enabled ? (d) => _handleDragUpdate(d, size) : null,
            onVerticalDragEnd: widget.enabled ? _handleDragEnd : null,
            child: content,
          )
        : GestureDetector(
            behavior: HitTestBehavior.translucent,
            onHorizontalDragStart: widget.enabled ? _handleDragStart : null,
            onHorizontalDragUpdate:
                widget.enabled ? (d) => _handleDragUpdate(d, size) : null,
            onHorizontalDragEnd: widget.enabled ? _handleDragEnd : null,
            child: content,
          );
  }
}
