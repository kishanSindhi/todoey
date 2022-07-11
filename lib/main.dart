import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';
import 'screens/task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: const TaskScreen(),
        theme: ThemeData(
          primarySwatch: Colors.pink,
          checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateProperty.all(Colors.pinkAccent),
          ),
        ),
      ),
    );
  }
}
