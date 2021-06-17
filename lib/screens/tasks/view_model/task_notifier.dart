import 'package:flutter/material.dart';
import 'package:checky/screens/tasks/model/task.dart';
import 'dart:collection';

// Every variable should be treated as an immutable variable
class TaskNotifier extends ChangeNotifier {
  // Get tasks from local db as initial value
  //
  // Avoid list modification
  List<Task> _tasks = [];

  // Avoid list modification
  UnmodifiableListView<Task> get tasksList => UnmodifiableListView(_tasks);

  int get taskLength => _tasks.length;

  String get tasksLengthInfo => taskLength <= 0
      ? 'Add New Task'
      : '$taskLength ${taskLength > 1 ? 'Tasks' : 'Task'}';

  void addNewTask(Task newTask) {
    _tasks.add(newTask);
    // notify list change via listener
    notifyListeners();
  }

  void updateTaskCheckbox({@required int position}) {
    _tasks[position].toggleIsDone();
    // notify list change via listener
    notifyListeners();
  }

  void deleteTaskFromList({@required int position}) {
    _tasks.removeAt(position);
    // notify list change via listener
    notifyListeners();
  }
}
