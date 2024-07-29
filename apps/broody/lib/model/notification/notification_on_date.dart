import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_on_date.freezed.dart';

@freezed
class NotificationOnDate with _$NotificationOnDate {
  const factory NotificationOnDate(
      {required DateTime dateTime,
      required String title,
      required String body}) = _NotificationOnDate;
}
