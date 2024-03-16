extension DateTimeConverter on DateTime {
  Duration toTime() {
    return Duration(
      hours: hour,
      minutes: minute,
    );
  }

  DateTime copyWithTime(final Duration time) {
    return copyWith(
      hour: time.inHours,
      minute: time.inMinutes % 60,
      second: time.inSeconds % 3600,
      millisecond: time.inMilliseconds % 3600000,
      microsecond: time.inMicroseconds % 3600000000,
    );
  }
}
