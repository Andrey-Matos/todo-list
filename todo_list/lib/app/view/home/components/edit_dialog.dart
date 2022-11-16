import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/controller/task_provider.dart';

Future<void> displayTextInputDialog(
    BuildContext context, String originalTitle) async {
  TextEditingController controller = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            content: TextField(
              controller: controller,
              decoration: InputDecoration(hintText: "Enter a new name"),
            ),
            actions: <Widget>[
              TextButton(
                  child: Text('CANCEL'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Provider.of<TaskProvider>(context, listen: false)
                        .edit(originalTitle, controller.text);
                    Navigator.pop(context, controller.text);
                  })
            ]);
      });
}
