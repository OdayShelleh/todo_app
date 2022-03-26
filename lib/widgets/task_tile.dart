import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final void Function(bool?) changeCheckState;
  final void Function() deleteListTile;

  TaskTile({
    required this.taskTitle,
    required this.isChecked,
    required this.changeCheckState,
    required this.deleteListTile,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        if(direction == DismissDirection.startToEnd){
          deleteListTile();
        }
      },
      child: ListTile(
        //onLongPress: deleteListTile,
        title: Text(
          taskTitle,
          style: TextStyle(
              decoration: isChecked == true ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: changeCheckState,
        ),
      ),
    );
  }
}
