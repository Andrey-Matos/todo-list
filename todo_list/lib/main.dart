import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/controller/task_provider.dart';
import 'package:todo_list/app/view/home/home.dart';

import 'app/model/entities/hive_task_scheme.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<HiveTaskScheme>('todos');
  Hive.registerAdapter(HiveTaskSchemeAdapter());
  runApp(ChangeNotifierProvider(
    create: (context) => TaskProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const Home());
  }
}
