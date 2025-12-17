import 'package:flutter/material.dart';
import '../models/task.dart';

class SettingsPageViewModel extends ChangeNotifier {
  // urgentImpColor: Color = Color("UrgentImp")
  // urgentNotImpColor: Color = Color("UrgentNotImp")
  // notUrgentImpColor: Color = Color("NotUrgentImp")
  // notUrgentNotImpColor: Color = Color("NotUrgentNotImp")
  //
  // notPlannedColor: Color = .gray
  // plannedColor: Color = .pink
  // inProgressColor: Color = .blue
  // onHoldColor: Color = .orange
  // doneColor: Color = .green
  // canceledColor: Color = .gray.opacity(0.8)
  Color urgentImpColor = Colors.red;
  Color urgentNotImpColor = Colors.green;
  Color notUrgentImpColor = Colors.yellowAccent;
  Color notUrgentNotImpColor = Colors.blueAccent;

  Color notPlannedColor = Colors.grey;
  Color plannedColor = Colors.pink;
  Color inProgressColor = Colors.blue;
  Color onHoldColor = Colors.orange;
  Color doneColor = Colors.green;
  Color canceledColor = Colors.grey.withOpacity(0.8);


}

