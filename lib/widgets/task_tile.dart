import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.taskTitle,
    this.isChecked = false,
    required this.onChanged,
    required this.onDoubleTap,
  }) : super(key: key);

  final bool isChecked;
  final String taskTitle;
  final Function(bool?)? onChanged;
  final VoidCallback onDoubleTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: onDoubleTap,
      child: ListTile(
        title: Text(
          taskTitle,
          style: TextStyle(
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: Checkbox(
          value: isChecked,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
