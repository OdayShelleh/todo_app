import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/models/task_provider.dart';
import 'package:todo_app/widgets/task_tile.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, value, child) =>  ListView.builder(
        itemCount: value.tasks.length,
        itemBuilder: (context, index) {
          return  TaskTile(
              taskTitle: value.tasks[index].title,
              isChecked: value.tasks[index].isDone,
              changeCheckState: (val) => value.changeTask(value.tasks[index]),
              deleteListTile: () {
                print('$index');
                value.deleteTask(value.tasks[index]);
              },
            );
        }
      ),
    );
  }
}
