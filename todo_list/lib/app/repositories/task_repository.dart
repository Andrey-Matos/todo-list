import 'package:hive/hive.dart';

import '../model/entities/hive_task_scheme.dart';
import '../model/entities/task_entity.dart';

class TaskRepository {
  Box<HiveTaskScheme> box = Hive.box('todos');

  addTodo(HiveTaskScheme todo) {
    //box = Hive.box('todos');

    box.put(todo.title, todo);
  }

  editTodo(String title, String newTitle) {
    //final box = Hive.box('todos');
    HiveTaskScheme temp = box.get(title)!;
    temp.title = newTitle;
    box.put(title, temp);
  }

  void removeTodo(String title) {
    //final box = Hive.box('todos');
    box.delete(title);
  }

  getTodo(String title) {
    final box = Hive.box('todos');
    return box.get(title);
  }

  get allTodos {
    final box = Hive.box('todos');
    return box.values;
  }
}
