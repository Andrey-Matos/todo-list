import 'package:hive/hive.dart';

import '../model/entities/hive_task_scheme.dart';

class TaskRepository {
  Box<HiveTaskScheme> box = Hive.box('taskBox');

  addTodo(HiveTaskScheme todo) async {
    await box.put(todo.title, todo);
  }

  editTodo(String title, String newTitle) async {
    HiveTaskScheme temp = box.get(title)!;
    temp.title = newTitle;
    await box.put(title, temp);
  }

  void removeTodo(String title) async {
    await box.delete(title);
  }

  getTodo(String title) {
    return box.get(title);
  }

  get allTodos {
    return box.values;
  }
}
