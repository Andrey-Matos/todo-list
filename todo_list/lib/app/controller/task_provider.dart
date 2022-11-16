import 'package:flutter/cupertino.dart';
import 'package:todo_list/app/view/home/components/task_card.dart';

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
    _displayResults = repo.allTodos;
    notifyListeners();
  }

  void add(title, description, dueAt) {
    var filter = _displayResults.where((element) => element.title == title);
    if (filter.isEmpty) {
      repo.addTodo(HiveTaskScheme(title, description, dueAt));
      print(repo.allTodos.toString());
      _displayResults.add(HiveTaskScheme(title, description, dueAt));
      notifyListeners();
    }
  }

  void remove(title) {
    repo.removeTodo(title);
    displayResults.removeWhere((e) => (e.title == title));
    notifyListeners();
  }

  void edit(String original, String newOne) {
    repo.editTodo(original, newOne);
    //desculpa
    //(serio)
    int targetIndex = _displayResults.indexWhere((e) => e.title == original);
    _displayResults[targetIndex].title = newOne;
    notifyListeners();
  }

  void setDefaultValues() {
    _displayResults = _defaultValues;
    notifyListeners();
  }

  void filterByDate(DateTime lowerLimit, DateTime upperLimit) {
    _displayResults = _displayResults
        .where((e) =>
            e.dueDate.isAfter(lowerLimit) && e.dueDate.isBefore(upperLimit))
        .toList();
    notifyListeners();
  }
}
