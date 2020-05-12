import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy Maggi'),
    Task(name: 'Buy Maggi Masala'),
    Task(name: 'Buy Lays'),
  ];

  int get taskCount {
    return _tasks.length;
  }

  //So that in future u don't use Provider.of<TaskData>(context).task.add();
  //instead u will use Provider.of<TaskData>(context).addTask
  //Now u can't modify the task list from any other outside the class directly
  //but u have to do it by calling addTask() function.
  UnmodifiableListView get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String taskName) {
    _tasks.add(Task(name: taskName));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
