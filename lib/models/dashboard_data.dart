// lib/models/dashboard_data.dart
class DashboardData {
  final DateTime from;
  final DateTime to;
  final Map<String, int> pieData; // e.g., {"Done": 50, "Not Planned": 30, ...}
  final Map<String, int> barData; // e.g., {"V.Urgent": 100, "Urgent": 200, ...}

  DashboardData({
    required this.from,
    required this.to,
    required this.pieData,
    required this.barData,
  });

  factory DashboardData.mock() {
    return DashboardData(
      from: DateTime(2025, 12, 19),
      to: DateTime(2025, 12, 19),
      pieData: {
        'Done': 50,
        'Not Planned': 30,
        'Planned': 10,
        'In-Progress': 5,
        'Canceled': 5,
      },
      barData: {
        'V.Urgent': 100,
        'Urgent': 200,
        'Important': 300,
        'Hmm...': 700,
      },
    );
  }
}