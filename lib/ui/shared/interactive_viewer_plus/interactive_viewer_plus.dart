// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE.md file.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vector_math/vector_math_64.dart' show Quad, Vector3, Matrix4;

import 'widgets/custom_dismissible.widget.dart';

/// A widget that enables pan and zoom interactions with its child.
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=zrn7V3bMJvg}
///
/// The user can transform the child by dragging to pan or pinching to zoom.
///
/// By default, InteractiveViewer clips its child using [Clip.hardEdge].
/// To prevent this behavior, consider setting [clipBehavior] to [Clip.none].
/// When [clipBehavior] is [Clip.none], InteractiveViewer may draw outside of
/// its original area of the screen, such as when a child is zoomed in and
/// increases in size. However, it will not receive gestures outside of its original area.
/// To prevent dead areas where InteractiveViewer does not receive gestures,
/// don't set [clipBehavior] or be sure that the InteractiveViewer widget is the
/// size of the area that should be interactive.
///
/// See [flutter-go](https://github.com/justinmc/flutter-go) for an example of
/// robust positioning of an InteractiveViewer child that works for all screen
/// sizes and child sizes.
///
/// The [child] must not be null.
///
/// See also:
///   * The [Flutter Gallery's transformations demo](https://github.com/flutter/gallery/blob/master/lib/demos/reference/transformations_demo.dart),
///     which includes the use of InteractiveViewer.
///
/// {@tool dartpad --template=stateless_widget_scaffold}
/// This example shows a simple Container that can be panned and zoomed.
///
/// ```dart
/// Widget build(BuildContext context) {
///   return Center(
///     child: InteractiveViewer(
///       boundaryMargin: const EdgeInsets.all(20.0),
///       minScale: 0.1,
///       maxScale: 1.6,
///       child: Container(
///         decoration: const BoxDecoration(
///           gradient: LinearGradient(
///             begin: Alignment.topCenter,
///             end: Alignment.bottomCenter,
///             colors: <Color>[Colors.orange, Colors.red],
///             stops: <double>[0.0, 1.0],
///           ),
///         ),
///       ),
///     ),
///   );
/// }
/// ```
/// {@end-tool}
@immutable
class InteractiveViewerPlus extends HookWidget {
  /// Create an InteractiveViewer.
  ///
  /// The [child] parameter must not be null.
  const InteractiveViewerPlus({
    Key? key,
    this.clipBehavior = Clip.hardEdge,
    this.alignPanAxis = false,
    this.boundaryMargin = EdgeInsets.zero,
    this.constrained = true,
    // These default scale values were eyeballed as reasonable limits for common
    // use cases.
    this.maxScale = 2.5,
    this.minScale = 1,
    this.onInteractionEnd,
    this.onInteractionStart,
    this.onInteractionUpdate,
    this.panEnabled = true,
    this.scaleEnabled = true,
    this.transformationController,
    required this.child,
    this.onDismissed,
    this.dismissThreshold = 0.4,
    this.onDismissUpdated,
    this.hapticFeedbackOnDismiss = true,
  }) : super(key: key);

  final Clip clipBehavior;

  final bool alignPanAxis;

  final EdgeInsets boundaryMargin;

  final Widget child;

  final bool constrained;

  final bool panEnabled;

  final bool scaleEnabled;

  final double maxScale;

  final double minScale;

  final GestureScaleEndCallback? onInteractionEnd;

  final GestureScaleStartCallback? onInteractionStart;

  final GestureScaleUpdateCallback? onInteractionUpdate;

  final TransformationController? transformationController;

  final VoidCallback? onDismissed;
  final ValueChanged? onDismissUpdated;
  final double dismissThreshold;
  final bool hapticFeedbackOnDismiss;

  @override
  Widget build(BuildContext context) {
    final controller =
        transformationController ?? useTransformationController();
    final zoomFactor = useValueListenable(controller).getMaxScaleOnAxis();
    final animationController =
        useAnimationController(duration: kThemeAnimationDuration);
    final doubleTapLocation = useState(Offset.zero);
    return CustomDismissible(
      axis: Axis.vertical,
      enabled: zoomFactor == 1,
      dismissThreshold: dismissThreshold,
      onDismissUpdated: onDismissUpdated,
      onDismissed: () {
        if (hapticFeedbackOnDismiss) {
          HapticFeedback.lightImpact();
        }
        onDismissed?.call();
      },
      child: InteractiveViewer(
        child: GestureDetector(
          child: child,
          behavior: HitTestBehavior.translucent,
          onDoubleTapDown: (d) => doubleTapLocation.value = d.localPosition,
          onDoubleTap: () => onDoubleTap(
            animationController,
            controller,
            doubleTapLocation.value,
          ),
        ),
        transformationController: controller,
        clipBehavior: clipBehavior,
        scaleEnabled: scaleEnabled,
        maxScale: maxScale,
        boundaryMargin: boundaryMargin,
        constrained: constrained,
        onInteractionStart: (v) {
          onInteractionStart?.call(v);
          animationController.stop();
        },
        onInteractionUpdate: onInteractionUpdate,
        onInteractionEnd: onInteractionEnd,
        alignPanAxis: alignPanAxis,
        minScale: minScale,
        panEnabled: panEnabled,
      ),
    );
  }

  void onDoubleTap(AnimationController animationController,
      TransformationController controller, Offset position) {
    Matrix4 matrix = controller.value.clone();
    double currentScale = matrix.row0.x;

    double targetScale = minScale;

    if (currentScale <= minScale) {
      targetScale = maxScale * 0.7;
    }

    double offSetX =
        targetScale == 1.0 ? 0.0 : -position.dx * (targetScale - 1);
    double offSetY =
        targetScale == 1.0 ? 0.0 : -position.dy * (targetScale - 1);

    matrix = Matrix4.fromList([
      targetScale,
      matrix.row1.x,
      matrix.row2.x,
      matrix.row3.x,
      matrix.row0.y,
      targetScale,
      matrix.row2.y,
      matrix.row3.y,
      matrix.row0.z,
      matrix.row1.z,
      targetScale,
      matrix.row3.z,
      offSetX,
      offSetY,
      matrix.row2.w,
      matrix.row3.w
    ]);

    final tween = Matrix4Tween(
      begin: controller.value,
      end: matrix,
    ).animate(
      CurveTween(curve: Curves.easeOut).animate(animationController),
    );
    animationController.forward(from: 0);
    tween.addListener(() {
      controller.value = tween.value;
    });
  }
}
