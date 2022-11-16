import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_list/app/view/add_task/add_task.dart';
import 'package:todo_list/app/view/home/components/search_bar.dart';

import 'components/date_filter_picker.dart';
import 'components/task_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SearchBar(),
        ),
        body: TaskList(),
        floatingActionButton: FloatingActionButton(
            onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const AddTask()))
                },
            child: const Icon(Icons.add)));
  }
}
