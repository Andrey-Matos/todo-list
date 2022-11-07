import 'package:flutter/material.dart';

class DueDateController {
  //TODO: REMOVE MOCK
  int daysLeft(DateTime limit) {
    DateTime now = DateTime.now();
    return now.difference(limit).inDays;
  }

  //TODO: CREATE A METHOD FOR REMOVING DUE ITEMS

  dayAsColor(limit) {
    if (limit < 3) {
      return Colors.red[700];
    } else if (limit > 2 && limit < 5) {
      return Colors.yellow[700];
    }
    return Colors.green[700];
  }
}
