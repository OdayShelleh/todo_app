import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/tasks_screen.dart';

import 'models/task_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskProvider>(
      create: (context) => TaskProvider(),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
