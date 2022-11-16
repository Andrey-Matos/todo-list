import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/add_task_controller.dart';
import '../../controller/task_provider.dart';
import '../../model/entities/task_entity.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _formKey = GlobalKey<FormState>();
  final _taskController = AddTaskController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  DateTime _dateTimeController = DateTime.now();
  bool _titleAlreadyUsed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Form(
          key: _formKey,
          //autovalidateMode: _autoValidate ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled, ...
          child: TextFormField(
            decoration: const InputDecoration(label: Text('title')),
            controller: _titleController,
            validator: (value) =>
                _titleAlreadyUsed ? "Title already in use." : null,
            onChanged: (txt) async =>
                _titleAlreadyUsed = await _taskController.titleAlreadyUsed(txt),
          ),
        ),
        TextField(
          controller: _descriptionController,
          decoration: const InputDecoration(label: Text('description')),
        ),
        SizedBox(
          height: 200,
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
                print('jdisoajdiosajdisajdioasjdias');
                print(Provider.of<TaskProvider>(context, listen: false)
                    .displayValueSize);
                Navigator.pop(context);
              }
            },
            child: const Text('submit'))
      ]),
    );
  }
}
