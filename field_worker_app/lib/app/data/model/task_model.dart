enum TaskStatus {
  pending,
  inProgress,
  completed,
}

enum Priority {
  high,
  medium,
  low,
}

class Task {
  final String id;
  final String title;
  final String description;
  final TaskStatus status;
  final Priority priority;
  final DateTime dueDate;
  final String location;
  final String assignedTo;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    required this.dueDate,
    required this.location,
    required this.assignedTo,
  });
}
