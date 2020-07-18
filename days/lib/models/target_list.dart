import 'target.dart';
import 'package:flutter/foundation.dart';
import 'package:instant/instant.dart';
import 'package:days/time_diff.dart';

class TargetList extends ChangeNotifier {
  List<Target> targets = [
    Target(targetTitle: 'EndSem', targetDate: DateTime.now()),
  ];

  int get targetsCount {
    return targets.length;
  }

  void addTarget({String targetTitle, DateTime targetDate}) {
//    var now = new DateTime.now();
//    int num =
//        now.year + now.month + now.day + now.hour + now.minute + now.second;
    targets.add(Target(targetTitle: targetTitle, targetDate: targetDate));
    notifyListeners();
  }

  String getTimeLeft(Target target) {
    var currentDate = dateTimeToZone(zone: 'IST', datetime: DateTime.now());
    var targetDate = target.targetDate;
    return TimeDiff().getDiff(currentDate, targetDate);
  }
}
