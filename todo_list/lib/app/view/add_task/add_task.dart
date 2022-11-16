import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/add_task_controller.dart';
import '../../controller/task_provider.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _formKey = GlobalKey<FormState>();
  final _taskController = AddTaskController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime _dateTimeController = DateTime.now();
  bool _titleAlreadyUsed = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: height / 10, bottom: height / 20),
            child: Text(
              'Create a new task',
              style: TextStyle(fontSize: 25),
            ),
          ),
          Form(
            key: _formKey,
            child: TextFormField(
              decoration: const InputDecoration(
                  label: Text('title'), border: OutlineInputBorder()),
              controller: _titleController,
              validator: (value) =>
                  _titleAlreadyUsed ? "Title already in use." : null,
              onChanged: (txt) async => _titleAlreadyUsed =
                  _taskController.titleAlreadyUsed(context, txt),
            ),
          ),
          SizedBox(
            height: height / 30,
          ),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  'description',
                )),
          ),
          SizedBox(height: height / 15),
          Text('Limit date', style: TextStyle(fontSize: 20)),
          SizedBox(
            height: height / 2.5,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              onDateTimeChanged: (DateTime newDateTime) {
                _dateTimeController = newDateTime;
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Provider.of<TaskProvider>(context, listen: false).add(
                      _titleController.text,
                      _descriptionController.text,
                      _dateTimeController);
                  Navigator.pop(context);
                }
              },
              child: const Text('submit'))
        ]),
      ),
    );
  }
}
