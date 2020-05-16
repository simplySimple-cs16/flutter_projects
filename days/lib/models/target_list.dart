import 'target.dart';
import 'package:flutter/foundation.dart';

class TargetList extends ChangeNotifier {
  List<Target> targets = [
    Target(targetTitle: 'EndSem', timeLeft: '10 days'),
    Target(targetTitle: 'Joining', timeLeft: '10 days'),
  ];

  int get targetsCount {
    return targets.length;
  }

  void addTarget({String targetTitle, String timeLeft}) {
    targets.add(Target(targetTitle: targetTitle, timeLeft: timeLeft));
    notifyListeners();
  }

  String getTimeLeft(Target target) {
    //Todo : get the time difference
    return '5 days';
  }
}
