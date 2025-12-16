
import 'package:flutter/material.dart';

import 'eisenhower_matrix_page.dart';

class TodoMainPage extends StatelessWidget {
  const TodoMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.grid_view_rounded)),
              Tab(icon: Icon(Icons.checklist_rounded)),
              Tab(icon: Icon(Icons.bar_chart_rounded)),
              Tab(icon: Icon(Icons.settings)),
            ],
          ),
        ),
        body: const TabBarView( // Content corresponding to the tabs
          children: [
            EisenhowerMatrixPage(),
            Center(child: Icon(Icons.checklist_rounded, size: 150)),
            Center(child: Icon(Icons.bar_chart_rounded, size: 150)),
            Center(child: Icon(Icons.settings, size: 150)),
          ],
        ),
      ),
    );
  }
}
