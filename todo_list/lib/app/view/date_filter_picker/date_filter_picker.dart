import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/task_provider.dart';

class DateFilterPicker extends StatelessWidget {
  DateTime startDate = DateTime.now();
  DateTime finishDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height / 10,
      ),
      Text('Initial Date:'),
      SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: DateTime.now(),
          onDateTimeChanged: (DateTime newDateTime) {
            startDate = newDateTime;
          },
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 15,
      ),
      Text('Final Date:'),
      SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: DateTime.now(),
          onDateTimeChanged: (DateTime newDateTime) {
            finishDate = newDateTime;
          },
        ),
      ),
      ElevatedButton(
          onPressed: () {
            Provider.of<TaskProvider>(context, listen: false)
                .filterByDate(startDate, finishDate);
            Navigator.pop(context);
          },
          child: const Text('Ok'))
    ]));
  }
}
