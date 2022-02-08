import 'package:freezed_annotation/freezed_annotation.dart';

part 'loading_value.freezed.dart';

@freezed
class LoadingValue<T> with _$LoadingValue<T> {
  const factory LoadingValue.loading({
    required double progress,
  }) = Loading;

  const factory LoadingValue.data({
    required T value,
  }) = Data;

  const factory LoadingValue.error({
    required Object error,
    StackTrace? stackTrace,
  }) = LoadingError;

  static double progressFrom(List<LoadingValue> values) {
    return values
        .map((e) => e.maybeWhen(loading: (p) => p, orElse: () => 1.0))
        .map((e) => e / values.length)
        .sum;
  }
}
