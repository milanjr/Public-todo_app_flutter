// lib/viewmodels/dashboard_viewmodel.dart
import 'package:flutter/material.dart';
import '../models/dashboard_data.dart';

class DashboardViewModel extends ChangeNotifier {
  DashboardData _data = DashboardData.mock();

  DashboardData get data => _data;

  // Filter state
  String _urgencyFilter = 'All';
  String _importanceFilter = 'All';

  String get urgencyFilter => _urgencyFilter;
  String get importanceFilter => _importanceFilter;

  void setUrgencyFilter(String filter) {
    _urgencyFilter = filter;
    notifyListeners();
  }

  void setImportanceFilter(String filter) {
    _importanceFilter = filter;
    notifyListeners();
  }

  // Simulate data refresh based on filters
  void refreshData() {
    // In real app, fetch from API or DB based on filters
    _data = DashboardData.mock(); // Placeholder
    notifyListeners();
  }

  // Pie chart colors
  List<Color> get pieColors => [
    Colors.green[400]!,
    Colors.red[400]!,
    Colors.blue[400]!,
    Colors.yellow[400]!,
    Colors.grey[400]!,
  ];

  // Bar chart colors
  List<Color> get barColors => [
    Colors.red[200]!,
    Colors.yellow[200]!,
    Colors.green[200]!,
    Colors.blue[200]!,
  ];
}