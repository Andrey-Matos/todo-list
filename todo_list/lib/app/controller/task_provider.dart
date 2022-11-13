import 'package:flutter/cupertino.dart';

import '../data/repositories/task_repository.dart';

class TaskProvider extends ChangeNotifier {
  TaskRepository repo = TaskRepository();
  late List _defaultValues;
  late List _displayResults;

  void filterByName(filter) {
    _displayResults =
        _displayResults.where((e) => e.title.contains(filter)).toList();
    notifyListeners();
  }

  void fetch() {
    _defaultValues = repo.allTodos;
    _displayResults = _defaultValues;
    notifyListeners();
  }

  void add(title, description, dueAt) {
    repo.addTodo(title, description, dueAt);
    notifyListeners();
  }

  void setDefaultValues() {
    _displayResults = _defaultValues;
    notifyListeners();
  }

  void filterByDate(floor, ceil) {
    _displayResults = _displayResults
        .where((e) => e.dueDate > floor && e.dueDate < ceil)
        .toList();
    notifyListeners();
  }
}
