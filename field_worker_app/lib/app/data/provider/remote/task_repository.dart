import 'package:field_worker_app/app/data/model/task_model.dart';

abstract class TaskRepository {
  Future<List<Task>> getTasks();
  Future<Task> getTask(String id);
}
