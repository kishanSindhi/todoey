import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

import '../models/task.dart';
import 'task_tile.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    Key? key,
    required this.taskList,
  }) : super(key: key);
  final List<Task> taskList;

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
        child: ListView.builder(
          itemCount: widget.taskList.length,
          itemBuilder: ((context, index) {
            return TaskTile(
              taskTitle: Provider.of<TaskData>(context).taskList[index].name,
              isChecked: Provider.of<TaskData>(context).taskList[index].isDone,
              onChanged: (bool? checkBoxState) {
                setState(() {
                  widget.taskList[index].toggleDone();
                });
              },
            );
          }),
        ),
      ),
    );
  }
}
