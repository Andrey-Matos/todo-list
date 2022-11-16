import 'package:flutter/cupertino.dart';

import '../model/entities/hive_task_scheme.dart';
import '../repositories/task_repository.dart';

class TaskProvider extends ChangeNotifier {
  TaskRepository repo = TaskRepository();
  List<HiveTaskScheme> _defaultValues = [];
  List<HiveTaskScheme> _displayResults = [];

  int get displayValueSize => _displayResults.length;
  List<HiveTaskScheme> get displayResults => _displayResults;

  void filterByName(filter) {
    _displayResults =
        _displayResults.where((e) => e.title.contains(filter)).toList();
    notifyListeners();
  }

  fetch() {
    _defaultValues = repo.allTodos.toList();
    _displayResults = _defaultValues;
    notifyListeners();
  }

  void add(title, description, dueAt) async {
    var filter = _displayResults.where((element) => element.title == title);
    if (filter.isEmpty) {
      await repo.addTodo(HiveTaskScheme(title, description, dueAt));
      //_displayResults.add(HiveTaskScheme(title, description, dueAt));
      fetch();
      notifyListeners();
    }
  }

  void remove(title) {
    repo.removeTodo(title);
    //displayResults.removeWhere((e) => (e.title == title));
    fetch();
    print(repo.allTodos.toList());
    notifyListeners();
  }

  void edit(String originalTitle, String newOne) {
    repo.editTodo(originalTitle, newOne);
    fetch();
    //int targetIndex =
    //    _displayResults.indexWhere((e) => e.title == originalTitle);
    //_displayResults[targetIndex].title = newOne;
    notifyListeners();
  }

  void setDefaultValues() {
    _displayResults = _defaultValues;
    notifyListeners();
  }

  void filterByDate(DateTime lowerLimit, DateTime upperLimit) {
    _defaultValues = _displayResults;
    _displayResults = _displayResults
        .where((e) =>
            e.dueDate.isAfter(lowerLimit) && e.dueDate.isBefore(upperLimit))
        .toList();
    notifyListeners();
  }
}
