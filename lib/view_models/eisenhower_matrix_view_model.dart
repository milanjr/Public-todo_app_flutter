// lib/viewmodels/matrix_viewmodel.dart
import 'package:flutter/material.dart';
import '../models/task.dart';

class EisenhowerMatrixViewModel extends ChangeNotifier {
  List<TodoTask> _tasks = [
    // TodoTask(title: "Buy groceries", isUrgent: true, isImportant: true),
    TodoTask(title: "Pay electricity bill", isUrgent: true, isImportant: true),
    TodoTask(title: "Read productivity book", isUrgent: true, isImportant: true),
    TodoTask(title: "Plan vacation itinerary", isUrgent: true, isImportant: true),
    TodoTask(title: "Book doctor's appointment", isUrgent: true, isImportant: true),

    TodoTask(title: "Buy groceries", isUrgent: true, isImportant: false),
    // TodoTask(title: "Pay electricity bill", isUrgent: true, isImportant: false),
    TodoTask(title: "Read productivity book", isUrgent: true, isImportant: false),
    TodoTask(title: "Plan vacation itinerary", isUrgent: true, isImportant: false),
    TodoTask(title: "Book doctor's appointment", isUrgent: true, isImportant: false),

    TodoTask(title: "Buy groceries", isUrgent: false, isImportant: true),
    TodoTask(title: "Pay electricity bill", isUrgent: false, isImportant: true),
    // TodoTask(title: "Read productivity book", isUrgent: false, isImportant: true),
    TodoTask(title: "Plan vacation itinerary", isUrgent: false, isImportant: true),
    TodoTask(title: "Book doctor's appointment", isUrgent: false, isImportant: true),

    TodoTask(title: "Buy groceries", isUrgent: false, isImportant: false),
    TodoTask(title: "Pay electricity bill", isUrgent: false, isImportant: false),
    TodoTask(title: "Read productivity book", isUrgent: false, isImportant: false),
    // TodoTask(title: "Plan vacation itinerary", isUrgent: false, isImportant: false),
    TodoTask(title: "Book doctor's appointment", isUrgent: false, isImportant: false),
  ];

  List<TodoTask> get tasks => _tasks;

  // Group tasks by quadrant
  List<List<TodoTask>> get quadrants {
    final q = List.generate(4, (i) => <TodoTask>[]);
    for (var task in _tasks) {
      q[task.quadrantIndex].add(task);
    }
    return q;
  }

  // Add new task
  void addTask(String title, {bool isUrgent = false, bool isImportant = false}) {
    _tasks.add(TodoTask(title: title, isUrgent: isUrgent, isImportant: isImportant));
    notifyListeners();
  }

  // Remove task
  void removeTask(TodoTask task) {
    _tasks.remove(task);
    notifyListeners();
  }

  // Get count for each quadrant
  int getCount(int quadrantIndex) {
    return quadrants[quadrantIndex].length;
  }

  // Get header color for quadrant
  Color getQuadrantColor(int quadrantIndex) {
    switch (quadrantIndex) {
      case 0: return Colors.red[200]!;
      case 1: return Colors.green[200]!;
      case 2: return Colors.yellow[200]!;
      case 3: return Colors.blue[200]!;
      default: return Colors.grey[200]!;
    }
  }

  // Get header text for quadrant
  String getQuadrantTitle(int quadrantIndex) {
    switch (quadrantIndex) {
      case 0: return "Very Urgent";
      case 1: return "Urgent";
      case 2: return "Important";
      case 3: return "Hmm...";
      default: return "Unknown";
    }
  }
}
