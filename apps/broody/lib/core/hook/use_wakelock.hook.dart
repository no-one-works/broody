import 'package:broody/core/hook/use_top_route_effect.hook.dart';
import 'package:flutter/foundation.dart';
import 'package:wakelock/wakelock.dart';

void useWakelock({bool endWhenCovered = true}) {
  useOnTop(
    onBecameTop: () {
      Wakelock.enable().then((value) => debugPrint("Wakelock enabled."));
    },
    onTopEnded: () {
      Wakelock.disable().then((value) => debugPrint("Wakelock disabled."));
    },
    endWhenCovered: endWhenCovered,
  );
}
