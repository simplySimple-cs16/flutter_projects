import 'target.dart';
import 'package:flutter/foundation.dart';
import 'package:instant/instant.dart';
import 'package:days/time_diff.dart';

class TargetList extends ChangeNotifier {
  List<String> targetsSP = [];

  List<Target> targets = [
    Target(targetTitle: 'EndSem', targetDate: DateTime.now()),
    Target(targetTitle: 'Joining', targetDate: DateTime.now()),
  ];

  int get targetsCount {
    return targets.length;
  }

  void addTarget({String targetTitle, DateTime targetDate}) {
    targets.add(Target(targetTitle: targetTitle, targetDate: targetDate));
    notifyListeners();
  }

  String getTimeLeft(Target target) {
    var currentDate = dateTimeToZone(zone: 'IST', datetime: DateTime.now());
    var targetDate = target.targetDate;
    return TimeDiff().getDiff(currentDate, targetDate);
  }
}
