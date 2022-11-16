import 'package:flutter/material.dart';

class HomeController {
  DateTime now = DateTime.now();
  int daysLeft(DateTime limit) {
    return limit.difference(now).inDays;
  }

  bool isDue(DateTime limit) {
    return now.day > limit.day;
  }

  Color? dayAsColor(DateTime limit) {
    if (daysLeft(limit) < 3 || isDue(limit)) {
      return Colors.red[700];
    } else if (daysLeft(limit) > 2 && daysLeft(limit) < 5) {
      return Colors.yellow[700];
    }
    return Colors.green[700];
  }
}
