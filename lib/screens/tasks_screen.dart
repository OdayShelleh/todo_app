import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_provider.dart';
import 'package:todo_app/screens/add_task_screen.dart';
import 'package:todo_app/widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {

  const TasksScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[200],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.lightBlueAccent[100],
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskScreen(addTaskTitle: (newTitle){
                    // setState(() {
                    //   tasks.add(Task(title: newTitle));
                    // });
                  },),
                ),
              );
            },
          );
        },
      ),
      body: Container(
        padding:
            const EdgeInsets.only(top: 60, bottom: 30, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 10, left: 20),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.playlist_add,
                    size: 40,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'ToDayDo',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
                '${context.watch<TaskProvider>().tasks.length} tasks',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),

            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                child: TasksList(),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
