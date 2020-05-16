class TimeDiff {
  String getDiff(DateTime currentDate, DateTime targetDate) {
    String timeLeft = targetDate.difference(currentDate).inDays.toString();
//    String hr = now.difference(deadline).inHours.toString();
//    String min = now.difference(deadline).inMinutes.toString();
    String sec = targetDate.difference(currentDate).inSeconds.toString();
    String diff = timeLeft + 'days ' + sec + 'seconds';
    return diff;
  }
}
