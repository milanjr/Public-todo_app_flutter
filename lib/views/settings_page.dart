import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/settings_page_view_model.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ChangeNotifierProvider(
        create: (context) => SettingsPageViewModel(),
        child: Consumer<SettingsPageViewModel>(
          builder: (context, vm, child) {
            return Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Card(
                          color: Colors.redAccent,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Reset"),
                          ),
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Card(
                          color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Save"),
                          ),
                        ),
                      ),
                    ],
                  ),

                  ColorPickerRow(
                    title: 'Very Urgent',
                    color: vm.urgentImpColor,
                  ),
                  ColorPickerRow(title: 'Urgent', color: vm.urgentNotImpColor),
                  ColorPickerRow(
                    title: 'Important',
                    color: vm.notUrgentImpColor,
                  ),
                  ColorPickerRow(
                    title: 'Low Priority',
                    color: vm.notUrgentNotImpColor,
                  ),

                  ColorPickerRow(
                    title: 'Not Planned',
                    color: vm.notPlannedColor,
                  ),
                  ColorPickerRow(title: 'Planned', color: vm.plannedColor),
                  ColorPickerRow(
                    title: 'In Progress',
                    color: vm.inProgressColor,
                  ),
                  ColorPickerRow(title: 'On Hold', color: vm.onHoldColor),
                  ColorPickerRow(title: 'Done', color: vm.doneColor),
                  ColorPickerRow(title: 'Canceled', color: vm.canceledColor),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ColorPickerRow extends StatelessWidget {
  const ColorPickerRow({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        children: <Widget>[
          Text(title),
          Spacer(),
          TextButton(
            onPressed: () {},
            child: Card(
              color: color,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Change"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
