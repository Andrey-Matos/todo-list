import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/controller/task_provider.dart';
import 'package:todo_list/app/model/entities/hive_task_scheme.dart';
import 'package:todo_list/app/view/add_task/add_task.dart';

import '../../model/entities/task_entity.dart';
import 'components/task_card.dart';
import 'components/task_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

@override
void dispose() {
  Hive.close();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TaskList(),
        floatingActionButton: FloatingActionButton(
            onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const AddTask()))
                },
            child: const Icon(Icons.add)));
  }
}
