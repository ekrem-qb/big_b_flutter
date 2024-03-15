bool isWeekdaySelected(final int dayIndex, final int weekdays) {
  if (dayIndex < 0 || dayIndex > 6) return false;

  // Create a mask by shifting 1 by the day index
  final mask = 1 << dayIndex;

  // Check if the bitwise AND of the mask and bit_field is greater than 0
  // This indicates the corresponding bit is set (True)
  return (weekdays & mask) > 0;
}
