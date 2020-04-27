class TimeDiff {
  var now = new DateTime.now();
  var deadline = new DateTime(2020, 05, 3);

  String getDiff() {
    now = DateTime.now();
    String dy = deadline.difference(now).inDays.toString();
//    String hr = now.difference(deadline).inHours.toString();
//    String min = now.difference(deadline).inMinutes.toString();
    String sec = now.difference(deadline).inSeconds.toString();
    String diff = dy + 'days ' + sec + 'seconds';
    return diff;
  }
}
