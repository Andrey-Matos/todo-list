import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/view/home/components/task_card.dart';

import '../../../controller/task_provider.dart';

class TaskList extends StatefulWidget {
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, provider, child) {
        //provider.fetch();
        return provider.displayResults.isEmpty
            ? const Center(
                child: Text(
                  'You have no tasks at the moment',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            : ListView.builder(
                itemCount: provider.displayValueSize,
                itemBuilder: (context, i) => TaskCard(
                    title: provider.displayResults[i].title,
                    description: provider.displayResults[i].description,
                    dueDate: provider.displayResults[i].dueDate));
      },
    );
  }
}
