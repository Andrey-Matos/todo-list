import 'package:flutter/material.dart';
import 'package:todo_list/controllers/due_date_controller.dart';

class DetailsScreen extends StatelessWidget {
  String title;
  String description;
  int daysLeft;

  DetailsScreen({
    super.key,
    required this.title,
    required this.description,
    required this.daysLeft,
  });

  @override
  Widget build(BuildContext context) {
    DueDateController dueDateController = DueDateController();
    var color = dueDateController.dayAsColor(daysLeft);
    return Container(
      color: Colors.grey[300],
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 24, color: color),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                  ]),
                  Row(children: [
                    Icon(Icons.hourglass_bottom),
                    Text(
                      "${daysLeft} dias restantes",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .025,
                  ),
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * .8),
                    child: Text(
                      description,
                      style: TextStyle(fontSize: 16),
                      maxLines: 3,
                    ),
                  )
                ],
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.remove_circle))
          ]),
    );
  }
}
