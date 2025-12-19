// lib/models/task.dart
class TodoTask {
  final String title;
  final bool isUrgent;
  final bool isImportant;

  TodoTask({
    required this.title,
    this.isUrgent = false,
    this.isImportant = false,
  });

  // Helper to get quadrant index
  int get quadrantIndex {
    if (isUrgent && isImportant) return 0; // Very Urgent
    if (isUrgent && !isImportant) return 1; // Urgent
    if (!isUrgent && isImportant) return 2; // Important
    return 3; // Hmm...
  }

  @override
  String toString() => 'TodoTask(title: $title, urgent: $isUrgent, important: $isImportant)';
}
