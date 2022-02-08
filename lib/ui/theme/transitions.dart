import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Tween<double> get tween01 => Tween(begin: 0, end: 1);

Widget fadeShuttle(
  BuildContext flightContext,
  Animation<double> animation,
  HeroFlightDirection flightDirection,
  BuildContext fromHeroContext,
  BuildContext toHeroContext,
) {
  final Hero toHero = toHeroContext.widget as Hero;
  final Hero fromHero = fromHeroContext.widget as Hero;

  final forward = (flightDirection == HeroFlightDirection.push);

  return Stack(
    fit: StackFit.loose,
    children: [
      Positioned.fill(
        child: FadeTransition(
          opacity: ReverseAnimation(animation),
          child: forward ? fromHero : toHero,
        ),
      ),
      Positioned.fill(
        child: FadeTransition(
          opacity: animation,
          child: forward ? toHero : fromHero,
        ),
      ),
    ],
  );
}

RectTween linearRectTween(Rect? begin, Rect? end) =>
    RectTween(begin: begin, end: end);

Widget switcherFadeThroughTransition(
  Widget child,
  Animation<double> animation, {
  Color fillColor = Colors.transparent,
}) {
  return FadeThroughTransition(
    animation: animation,
    secondaryAnimation: ReverseAnimation(animation),
    child: child,
    fillColor: fillColor,
  );
}

Widget switcherScaleTransition(
  Widget child,
  Animation<double> animation, {
  Alignment alignment = Alignment.center,
  Color fillColor = Colors.transparent,
}) {
  return ScaleTransition(
    scale: animation,
    child: child,
    alignment: alignment,
  );
}

Widget fadeThroughTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return FadeThroughTransition(
    animation: animation,
    secondaryAnimation: secondaryAnimation,
    child: child,
    fillColor: Theme.of(context).colorScheme.background,
  );
}

Widget fadeThroughTransitionTransparent(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  return FadeThroughTransition(
    animation: animation,
    secondaryAnimation: secondaryAnimation,
    child: child,
    fillColor: Colors.transparent,
  );
}

Widget fadeThroughTransitionTransparentBlur(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  const blurRadius = 20;
  return AnimatedBuilder(
    animation: animation,
    builder: (context, c) => BackdropFilter(
      filter: ImageFilter.blur(
          sigmaX: animation.value * blurRadius,
          sigmaY: animation.value * blurRadius),
      child: c,
    ),
    child: FadeThroughTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      fillColor: Colors.transparent,
      child: child,
    ),
  );
}
