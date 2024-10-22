extension DurationFormatter on Duration {
  String toMinutesAndSeconds() {
    final minutes = inMinutes.toString().padLeft(2, '0');
    final seconds = (inSeconds % 60).toString().padLeft(2, '0');
    final time = '$minutes:$seconds';
    return time;
  }

  String toHoursAndMinutes() {
    final hours = inHours.toString().padLeft(2, '0');
    final minutes = (inMinutes % 60).toString().padLeft(2, '0');
    final time = '$hours:$minutes';
    return time;
  }
}
