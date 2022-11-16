import 'package:hive/hive.dart';
part 'hive_task_scheme.g.dart';

@HiveType(typeId: 0)
class HiveTaskScheme extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  final String description;

  @HiveField(3)
  final DateTime dueDate;

  HiveTaskScheme(this.title, this.description, this.dueDate);
}
