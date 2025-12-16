// lib/viewmodels/matrix_viewmodel.dart
import 'package:flutter/material.dart';
import '../models/task.dart';

class EisenhowerMatrixViewModel extends ChangeNotifier {
  List<Task> _tasks = [
    // Task(title: "Buy groceries", isUrgent: true, isImportant: true),
    Task(title: "Pay electricity bill", isUrgent: true, isImportant: true),
    Task(title: "Read productivity book", isUrgent: true, isImportant: true),
    Task(title: "Plan vacation itinerary", isUrgent: true, isImportant: true),
    Task(title: "Book doctor's appointment", isUrgent: true, isImportant: true),

    Task(title: "Buy groceries", isUrgent: true, isImportant: false),
    // Task(title: "Pay electricity bill", isUrgent: true, isImportant: false),
    Task(title: "Read productivity book", isUrgent: true, isImportant: false),
    Task(title: "Plan vacation itinerary", isUrgent: true, isImportant: false),
    Task(title: "Book doctor's appointment", isUrgent: true, isImportant: false),

    Task(title: "Buy groceries", isUrgent: false, isImportant: true),
    Task(title: "Pay electricity bill", isUrgent: false, isImportant: true),
    // Task(title: "Read productivity book", isUrgent: false, isImportant: true),
    Task(title: "Plan vacation itinerary", isUrgent: false, isImportant: true),
    Task(title: "Book doctor's appointment", isUrgent: false, isImportant: true),

    Task(title: "Buy groceries", isUrgent: false, isImportant: false),
    Task(title: "Pay electricity bill", isUrgent: false, isImportant: false),
    Task(title: "Read productivity book", isUrgent: false, isImportant: false),
    // Task(title: "Plan vacation itinerary", isUrgent: false, isImportant: false),
    Task(title: "Book doctor's appointment", isUrgent: false, isImportant: false),
  ];

  List<Task> get tasks => _tasks;

  // Group tasks by quadrant
  List<List<Task>> get quadrants {
    final q = List.generate(4, (i) => <Task>[]);
    for (var task in _tasks) {
      q[task.quadrantIndex].add(task);
    }
    return q;
  }

  // Add new task
  void addTask(String title, {bool isUrgent = false, bool isImportant = false}) {
    _tasks.add(Task(title: title, isUrgent: isUrgent, isImportant: isImportant));
    notifyListeners();
  }

  // Remove task
  void removeTask(Task task) {
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