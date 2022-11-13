import 'package:flutter/foundation.dart';

class Todo {
  String title;
  String description;
  DateTime dueDate;
  Todo({required this.title, required this.description, required this.dueDate});

  @override
  String toString() {
    // TODO: implement toString
    return '$title, $description, $dueDate';
  }
}
