import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/screens/details_screen.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  /////////////////////////////////////////////////////////////////////////
  //TODO: REMOVE MOCK
  List mock = [
    DetailsScreen(
        title: 'aq',
        description: 'aeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee catatau',
        daysLeft: 2),
    DetailsScreen(title: 'aaaa', description: 'bucetaddasa', daysLeft: 4),
    DetailsScreen(title: 'aaaa', description: 'bucetaddasa', daysLeft: 8),
    DetailsScreen(title: 'aaaa', description: 'bucetaddasa', daysLeft: 7),
    DetailsScreen(title: 'aaaa', description: 'bucetaddasa', daysLeft: 1),
  ];
  /////////////////////////////////////////////////////////////////////////
  //DateTime.utc(2022, 10, 11) <--------------
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
      itemCount: mock.length,
      separatorBuilder: (BuildContext context, int index) =>
          Divider(height: 10),
      itemBuilder: (context, index) {
        return mock[index];
      },
    ));
  }
}
