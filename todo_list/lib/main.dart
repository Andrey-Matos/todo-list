import 'package:flutter/material.dart';
import 'package:todo_list/screens/details_screen.dart';
import 'package:todo_list/screens/task_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TaskList());
  }
}
