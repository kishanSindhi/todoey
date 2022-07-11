import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

import 'task_tile.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Consumer<TaskData>(
          builder: ((context, taskData, child) {
            return ListView.builder(
              itemCount: taskData.taskCount,
              itemBuilder: ((context, index) {
                return TaskTile(
                  taskTitle: taskData.taskList[index].name,
                  isChecked:
                      Provider.of<TaskData>(context).taskList[index].isDone,
                  onChanged: (bool? checkBoxState) {
                    setState(() {
                      taskData.taskList[index].toggleDone();
                    });
                  },
                );
              }),
            );
          }),
        ),
      ),
    );
  }
}
