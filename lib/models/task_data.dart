import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class TaskData with ChangeNotifier {
  List<Task> taskList = [
    Task(name: 'Task1'),
    Task(name: 'Task2'),
    Task(name: 'Task3'),
  ];

  void addTask(Task task) {
    taskList.add(task);
    notifyListeners();
  }
}
