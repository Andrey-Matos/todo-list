import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/controller/theme_provider.dart';
import 'package:todo_list/app/repositories/theme_repository.dart';
import 'package:todo_list/app/view/date_filter_picker/date_filter_picker.dart';

import '../../../controller/task_provider.dart';

class SearchBar extends StatelessWidget {
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * .50,
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
          icon: Icon(Icons.calendar_month)),
      IconButton(
          onPressed: () {
            final themeChange = Provider.of<DarkThemeProvider>(context);
            themeChange.darkTheme = !themeChange.darkTheme;
          },
          icon: Icon(Icons.ac_unit))
    ]);
  }
}
