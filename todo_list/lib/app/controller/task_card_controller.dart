import 'package:flutter/material.dart';

class HomeController {
  static final HomeController _controllerSingleton = HomeController();

  factory HomeController() {
    return _controllerSingleton;
  }

  DateTime now = DateTime.now();
  int daysLeft(DateTime limit) {
    return now.difference(limit).inDays;
  }

  bool isDue(DateTime limit) {
    return now.day > limit.day;
  }

  //TODO: CREATE A METHOD FOR REMOVING DUE ITEMS

  dayAsColor(limit) {
    if (limit < 3 || isDue(limit)) {
      return Colors.red[700];
    } else if (limit > 2 && limit < 5) {
      return Colors.yellow[700];
    }
    return Colors.green[700];
  }
}
