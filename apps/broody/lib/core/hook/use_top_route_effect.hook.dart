import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Allows you to provide side effect callbacks for when the widget becomes
/// mounted and the route is on top, as well as when that state ends.
///
/// If [endWhenCovered] is true (default), [onTopEnded] will be called when
/// another route is pushed on top of the current one. Otherwise it will only
/// be called when the widget's state is unmounted.
bool useOnTop({
  VoidCallback? onBecameTop,
  VoidCallback? onTopEnded,
  bool endWhenCovered = true,
}) {
  final mounted = useIsMounted()();
  late final routeIsActive = ModalRoute.of(useContext())?.isCurrent ?? false;
  final isOnTop = mounted && (!endWhenCovered || routeIsActive);
  useEffect(
    () {
      if (isOnTop) {
        onBecameTop?.call();
        return onTopEnded;
      }
      return null;
    },
    [isOnTop],
  );
  return isOnTop;
}
