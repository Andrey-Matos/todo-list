import '../model/entities/hive_task_scheme.dart';
import '../model/entities/task_entity.dart';
import '../repositories/task_repository.dart';

class AddTaskController {
  TaskRepository repo = TaskRepository();

  Future<bool> titleAlreadyUsed(String name) async {
    HiveTaskScheme? nameIsAvailable = await repo.getTodo(name);
    // Hive will return null in case a item doesn't exist under a given id
    if (nameIsAvailable != null) {
      return true;
    }
    return false;
  }
}
