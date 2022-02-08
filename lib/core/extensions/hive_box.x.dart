import 'package:hive_flutter/hive_flutter.dart';
import 'package:rxdart/rxdart.dart';

extension HiveBoxX<T> on Box<T> {
  Stream<List<T>> watchValues() {
    return watch()
        .map((_) => values)
        .startWith(values)
        .map((v) => v.toList());
  }
}