import 'package:field_technician_app/field_worker_app/app/data/model/task_model.dart';
import 'package:field_technician_app/field_worker_app/app/data/provider/remote/task_repository.dart';

class MockTaskRepository implements TaskRepository {
  final List<Task> _tasks = [
    Task(
      id: '1',
      title: 'HVAC Repair - Site 402',
      description: '123 Industrial Park Dr.',
      status: TaskStatus.inProgress,
      priority: Priority.high,
      dueDate: DateTime.now().add(const Duration(hours: 2)),
      location: '123 Industrial Park Dr.',
      assignedTo: 'Alex',
    ),
    Task(
      id: '2',
      title: 'Routine Inspection',
      description: 'Sector 7G, Main Block',
      status: TaskStatus.pending,
      priority: Priority.medium,
      dueDate: DateTime.now().add(const Duration(hours: 4)),
      location: 'Sector 7G, Main Block',
      assignedTo: 'Alex',
    ),
    Task(
      id: '3',
      title: 'Parts Delivery',
      description: 'Warehouse B, Dock 4',
      status: TaskStatus.pending,
      priority: Priority.low,
      dueDate: DateTime.now().add(const Duration(hours: 6)),
      location: 'Warehouse B, Dock 4',
      assignedTo: 'Alex',
    ),
    Task(
      id: '4',
      title: 'HVAC Maintenance - Unit 4B',
      description: 'Annual filter replacement and coolant pressure check.',
      status: TaskStatus.completed,
      priority: Priority.high,
      dueDate: DateTime.now().subtract(const Duration(days: 1)),
      location: '1234 Elm St, Springfield',
      assignedTo: 'John Doe',
    ),
  ];

  @override
  Future<List<Task>> getTasks() async {
    await Future.delayed(const Duration(seconds: 1));
    return _tasks;
  }

  @override
  Future<Task> getTask(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return _tasks.firstWhere((task) => task.id == id);
  }
}
