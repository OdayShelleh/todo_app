import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task.dart';

class TaskProvider with ChangeNotifier{

  String? taskTitle;

  List<Task> tasks = [
    Task(title: 'go shopping '),
    Task(title: 'fix the car '),
    Task(title: 'study networks ')
  ];

  addTask(String title){
    taskTitle = title;
    if(taskTitle != null){
      tasks.add(Task(title: taskTitle!));
      notifyListeners();
    }
  }

  void changeTask(Task task){
    task.changeDone();
    notifyListeners();
  }


  void deleteTask(Task task){
    tasks.remove(task);
    notifyListeners();
  }
}