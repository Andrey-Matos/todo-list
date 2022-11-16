import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../controller/task_provider.dart';
import 'date_filter_picker.dart';

class SearchBar extends StatelessWidget {
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * .55,
        child: TextField(
          controller: _textController,
          decoration: const InputDecoration(hintText: "search by title"),
        ),
      ),
      IconButton(
          onPressed: () => Provider.of<TaskProvider>(context, listen: false)
              .filterByName(_textController.text),
          icon: const Icon(Icons.search)),
      IconButton(
          onPressed: () => Provider.of<TaskProvider>(context, listen: false)
              .setDefaultValues(),
          icon: const Icon(Icons.clear)),
      IconButton(
          onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DateFilterPicker()))
              },
          icon: Icon(Icons.calendar_month))
    ]);
  }
}
