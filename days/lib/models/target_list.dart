import 'target.dart';
import 'package:flutter/foundation.dart';

class TargetList extends ChangeNotifier {
  List<Target> targets = [
    Target(targetTitle: 'EndSem', date: 'June 1 2020', time: '2:00 pm'),
    Target(targetTitle: 'Joining', date: 'June 10 2020', time: '10:00 am'),
  ];

  int get targetsCount {
    return targets.length;
  }

  void addTarget({String targetTitle, String date, String time}) {
    targets.add(Target(targetTitle: targetTitle, date: date, time: time));
    notifyListeners();
  }

  String getTimeLeft(Target target) {
    //Todo : get the time difference
    return '5 days';
  }
}
