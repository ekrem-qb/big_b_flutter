extension DateTimeConverter on DateTime {
  Duration toTime() {
    return Duration(
      hours: hour,
      minutes: minute,
    );
  }
}
