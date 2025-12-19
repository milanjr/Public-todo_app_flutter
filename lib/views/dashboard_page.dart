// lib/views/dashboard_page.dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import '../view_models/dashboard_view_model.dart';
import '../models/dashboard_data.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Statistics"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<DashboardViewModel>(
          builder: (context, vm, child) {
            final data = vm.data;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date Range
                  Row(
                    children: [
                      const Text("From: ", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(data.from.toString().split(' ')[0]),
                      const SizedBox(width: 20),
                      const Text("To: ", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(data.to.toString().split(' ')[0]),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Filter Buttons
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildFilterButton('All', vm.urgencyFilter == 'All', () => vm.setUrgencyFilter('All')),
                      _buildFilterButton('Not Urgent', vm.urgencyFilter == 'Not Urgent', () => vm.setUrgencyFilter('Not Urgent')),
                      _buildFilterButton('Urgent', vm.urgencyFilter == 'Urgent', () => vm.setUrgencyFilter('Urgent')),
                      _buildFilterButton('All', vm.importanceFilter == 'All', () => vm.setImportanceFilter('All')),
                      _buildFilterButton('Not Important', vm.importanceFilter == 'Not Important', () => vm.setImportanceFilter('Not Important')),
                      _buildFilterButton('Important', vm.importanceFilter == 'Important', () => vm.setImportanceFilter('Important')),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Pie Chart + Legend
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text(
                          "Task Status",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: PieChart(
                                  PieChartData(
                                    sections: vm.data.pieData.entries.map((entry) {
                                      final index = vm.data.pieData.keys.toList().indexOf(entry.key);
                                      return PieChartSectionData(
                                        color: vm.pieColors[index],
                                        value: entry.value.toDouble(),
                                        title: '${entry.value}%',
                                        radius: 80,
                                        titleStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      );
                                    }).toList(),
                                    centerSpaceRadius: 20,
                                    borderData: FlBorderData(show: false),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: vm.data.pieData.keys.map((key) {
                                  final index = vm.data.pieData.keys.toList().indexOf(key);
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 4),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 16,
                                          height: 16,
                                          color: vm.pieColors[index],
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          key,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Bar Chart
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text(
                          "Task Priority Distribution",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: BarChart(
                            BarChartData(
                              barGroups: vm.data.barData.entries.map((entry) {
                                final index = vm.data.barData.keys.toList().indexOf(entry.key);
                                return BarChartGroupData(
                                  x: index,
                                  barRods: [
                                    BarChartRodData(
                                      toY: entry.value.toDouble(),
                                      color: vm.barColors[index],
                                      width: 24,
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: Colors.white, width: 2),
                                    ),
                                  ],
                                  showingTooltipIndicators: [0],
                                );
                              }).toList(),
                              titlesData: FlTitlesData(
                                show: true,
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      final keys = vm.data.barData.keys.toList();
                                      return Text(
                                        keys[value.toInt()],
                                        style: const TextStyle(fontSize: 12),
                                        textAlign: TextAlign.center,
                                      );
                                    },
                                  ),
                                ),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    interval: 100,
                                    reservedSize: 40,
                                    getTitlesWidget: (value, meta) {
                                      return Text(
                                        '${value.toInt()}',
                                        style: const TextStyle(fontSize: 12),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              gridData: FlGridData(show: false),
                              borderData: FlBorderData(show: false),
                              groupsSpace: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFilterButton(String label, bool isSelected, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue[200] : Colors.grey[200],
        foregroundColor: isSelected ? Colors.blue[900] : Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),
      child: Text(label, style: const TextStyle(fontSize: 12)),
    );
  }
}