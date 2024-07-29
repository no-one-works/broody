import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

L10n useL10n() {
  final context = useContext();
  return L10n.of(context)!;
}

DateFormat useDateFormat([String pattern = "yMd"]) {
  final use24h = MediaQuery.of(useContext()).alwaysUse24HourFormat;
  final l10n = useL10n();
  return useMemoized(
      () => DateFormat(
            use24h ? pattern.replaceAll("j", "H") : pattern,
            l10n.localeName,
          ),
      [l10n, use24h]);
}
