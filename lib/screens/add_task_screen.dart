import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_provider.dart';

class AddTaskScreen extends StatelessWidget {
  final Function? addTaskTitle;

  AddTaskScreen({this.addTaskTitle});

  @override
  Widget build(BuildContext context) {
    String? title;
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'ADD TASK',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blue, fontSize: 20),
          ),
          TextFormField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.lightBlueAccent),
            child: const Text('add'),
            onPressed: () {
              if (title != null ) {
                Provider.of<TaskProvider>(context, listen: false).addTask(title!);
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
