extension DateTimeX on DateTime {
  DateTime startOfDay() {
    return DateTime(year, month, day);
  }

  DateTime endOfDay() {
    return DateTime(year, month, day, 23, 59, 59, 999);
  }

  Iterable<DateTime> getDaysUntil(DateTime other,
      {bool inclusive = false}) sync* {
    var date = startOfDay();
    final endDate = other.startOfDay();
    while (date.isBefore(endDate) || (inclusive && date.isSameDayAs(endDate))) {
      yield date;
      date = DateTime(date.year, date.month, date.day + 1);
    }
  }

  DateTime withTimeFrom(DateTime time) {
    return DateTime(year, month, day, time.hour, time.minute, time.second,
        time.millisecond, time.microsecond);
  }

  DateTime earlierDay(DateTime other) {
    if (other.startOfDay().isBefore(startOfDay())) return other;
    return this;
  }

  DateTime laterDay(DateTime other) {
    if (other.startOfDay().isAfter(startOfDay())) return other;
    return this;
  }

  int daysUntil(DateTime other, {bool inclusive = false}) {
    return other.startOfDay().difference(startOfDay()).inDays +
        (inclusive ? 1 : 0);
  }

  bool isSameDayAs(DateTime other) {
    return other.day == day && other.month == month && other.year == year;
  }

  bool isToday() {
    final now = DateTime.now();
    return isSameDayAs(now);
  }

  bool isBetween({
    required DateTime start,
    required DateTime end,
  }) {
    return isBefore(end) && isAfter(start);
  }

  DateTime min(DateTime other) {
    if (other.isBefore(this)) return other;
    return this;
  }

  DateTime max(DateTime other) {
    if (other.isAfter(this)) return other;
    return this;
  }
}
