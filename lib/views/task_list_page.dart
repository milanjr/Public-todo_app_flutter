import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/eisenhower_matrix_view_model.dart';


class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ChangeNotifierProvider(
        create: (context) => EisenhowerMatrixViewModel(),
        child: Consumer<EisenhowerMatrixViewModel>(
          builder: (context, vm, child) {
            return Center(
              child: Column(
                children: List.generate(vm.tasks.length, (index) {
                  final task = vm.tasks[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(task.title),
                        Spacer(),
                        if (task.isUrgent)
                          Icon(Icons.priority_high_rounded, color: Colors.redAccent,),
                        if (task.isImportant)
                        Icon(Icons.info_outline_rounded, color: Colors.blue,),
                        Icon(Icons.calendar_month_rounded, color: Colors.blue,),

                      ],
                    ),
                  );
                }),
              )
                );
          }
        ),
      ),
    );
  }
}
