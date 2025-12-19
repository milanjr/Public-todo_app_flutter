
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/dashboard_view_model.dart';

import 'dashboard_page.dart';
import 'eisenhower_matrix_page.dart';
import 'settings_page.dart';
import 'task_list_page.dart';

class TodoMainPage extends StatelessWidget {
  const TodoMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          // title: const Text('Todo List'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.grid_view_rounded)),
              Tab(icon: Icon(Icons.checklist_rounded)),
              Tab(icon: Icon(Icons.bar_chart_rounded)),
              Tab(icon: Icon(Icons.settings)),
            ],
          ),
        ),
        body: TabBarView( // Content corresponding to the tabs
          children: [
            ChangeNotifierProvider(
              create: (context) => DashboardViewModel(),
              child: const DashboardPage(),
            ),
            const EisenhowerMatrixPage(),
            const TaskListPage(),
            const SettingsPage(),
          ],
        ),
      ),
    );
  }
}
