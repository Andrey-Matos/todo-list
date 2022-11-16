import 'package:provider/provider.dart';
import 'package:todo_list/app/controller/task_provider.dart';

class AddTaskController {
  bool titleAlreadyUsed(context, String name) {
    List tasks =
        Provider.of<TaskProvider>(context, listen: false).displayResults;
    bool nameIsAvailable = tasks.contains((e) => e.title == name);
    return nameIsAvailable;
  }
}
