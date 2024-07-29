import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

T useDelayed<T>({
  required Duration delay,
  required T before,
  required T after,
  List<Object>? keys,
}) {
  final future = useMemoized(
    () => Future.delayed(delay),
    [delay, before, after, ...?keys],
  );
  final value = useFuture(
    future,
  );
  return value.connectionState == ConnectionState.done ? after : before;
}
