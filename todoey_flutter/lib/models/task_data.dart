import 'package:flutter/foundation.dart';
import 'models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Buy Maggi'),
    Task(name: 'Buy Maggi Masala'),
    Task(name: 'Buy Lays'),
  ];
}
