import 'package:broody/ui/theme/spacing.dart';
import 'package:broody/ui/theme/transitions.dart';
import 'package:flutter/material.dart';
import 'package:loading_value/loading_value.dart';

class ProgressBuilder extends StatelessWidget {
  const ProgressBuilder({
    Key? key,
    required this.progress,
    required this.builder,
    this.curve = Curves.ease,
    this.duration = kThemeAnimationDuration,
    this.child,
  }) : super(key: key);

  final double progress;
  final Duration duration;
  final Curve curve;
  final ValueWidgetBuilder<double> builder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: progress),
      duration: duration,
      curve: curve,
      builder: builder,
      child: child,
    );
  }
}

class LoadingValueProgressBar extends StatelessWidget {
  const LoadingValueProgressBar({
    Key? key,
    required this.loadingValue,
    this.description,
    this.color,
  }) : super(key: key);

  final LoadingValue loadingValue;
  final String? description;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final actualColor = color ?? colorScheme.onBackground;
    return IconTheme(
      data: IconTheme.of(context).copyWith(color: actualColor),
      child: Center(
        child: AnimatedSwitcher(
          duration: kThemeAnimationDuration,
          transitionBuilder: switcherFadeThroughTransition,
          child: loadingValue.when(
            loading: (progress) => progress == 1
                ? const Icon(Icons.check_circle_rounded)
                : progress == 0
                    ? CircularProgressIndicator.adaptive(
                        valueColor: AlwaysStoppedAnimation(actualColor),
                      )
                    : ProgressBuilder(
                        progress: progress,
                        builder: (context, value, child) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              value: value > 0 ? value : null,
                              color: actualColor,
                            ),
                            if (child != null) vSpace(Spacers.s),
                            if (child != null) child,
                          ],
                        ),
                        child: description == null
                            ? null
                            : Text(
                                description!,
                                textAlign: TextAlign.center,
                                style: DefaultTextStyle.of(context)
                                    .style
                                    .copyWith(color: actualColor),
                              ),
                      ),
            data: (_) => const Icon(Icons.check_circle_rounded),
            error: (_, __) => Icon(
              Icons.error_rounded,
              color: colorScheme.error,
            ),
          ),
        ),
      ),
    );
  }
}
