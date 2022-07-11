import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskData with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Task> _taskList = [];

  UnmodifiableListView<Task> get taskList {
    return UnmodifiableListView(_taskList);
  }

  void addTask(Task task) {
    _taskList.add(task);
    notifyListeners();
  }

  int get taskCount {
    return _taskList.length;
  }
}
