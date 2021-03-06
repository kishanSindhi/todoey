import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/screens/add_tasks_screen.dart';

import '../widgets/task_list.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pinkAccent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 60,
                left: 30,
                right: 30,
                bottom: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      color: Colors.pinkAccent,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${Provider.of<TaskData>(context).taskCount} tasks',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
            ),
            const TaskList(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pinkAccent,
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: const AddTask(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
