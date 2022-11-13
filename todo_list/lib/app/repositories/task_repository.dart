import 'package:hive/hive.dart';

import '../model/entities/task_entity.dart';

class TaskRepository {
  late Box<Todo> box;

  openBox() async {
    return await Hive.openBox<List>('tasks');
  }

  addTodo(String title, String description, DateTime dueDate) async {
    box = await Hive.openBox<Todo>('tasks');
    Todo temp = Todo(title: title, description: description, dueDate: dueDate);
    ;
    box.put(temp.title, temp);
  }

  void editTodo(String title, String newTitle) async {
    final box = await Hive.openBox<Todo>('tasks');
    Todo temp = box.get(title)!;
    temp.title = newTitle;
    box.put(title, temp);
  }

  removeTodo(String title) async {
    final box = await Hive.openBox<Todo>('tasks');
    box.delete(title);
  }

  Future<Todo?> getTodo(String title) async {
    final box = await Hive.openBox<Todo>('tasks');
    return box.get(title);
  }

  get allTodos async {
    final box = await Hive.openBox<List>('tasks');
    return box.values;
  }
}
