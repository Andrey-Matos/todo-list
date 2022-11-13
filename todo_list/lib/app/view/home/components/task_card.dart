import 'package:flutter/material.dart';
import 'package:todo_list/app/pages/home/home_controller.dart';
import 'package:todo_list/presentation/pages/home/home_controller.dart';

class DetailsScreen extends StatelessWidget {
  String title;
  String description;
  DateTime dueDate;
  final HomeController _dueDateController = HomeController();
  late int daysLeft;
  late Color color;

  DetailsScreen({
    super.key,
    required this.title,
    required this.description,
    required this.dueDate,
  });

  void initState() {
    int daysLeft = _dueDateController.daysLeft(dueDate);
    color = _dueDateController.dayAsColor(daysLeft);
  }

  @override
  Widget build(BuildContext context) {
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
                    IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
                  ]),
                  Row(children: [
                    const Icon(Icons.hourglass_bottom),
                    Text(
                      _dueDateController.isDue(dueDate)
                          ? "Tarefa atrasada há $daysLeft dias"
                          : "$daysLeft dias restantes",
                      style: const TextStyle(
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
                      style: const TextStyle(fontSize: 16),
                      maxLines: 3,
                    ),
                  )
                ],
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.remove_circle))
          ]),
    );
  }
}
