import 'package:flutter/material.dart';

class Task {
  final String title;
  bool isDone;

  Task({required this.title, this.isDone = false});

  void changeDone(){
    isDone = !isDone;
  }

}