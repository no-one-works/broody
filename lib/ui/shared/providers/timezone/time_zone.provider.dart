import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final timeZoneProvider = FutureProvider((ref) async {
  return FlutterNativeTimezone.getLocalTimezone();
});
