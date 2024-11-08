import 'package:flutter/foundation.dart';

class GoalProvider extends ChangeNotifier {
  String? _selectedGoal;

  String? get selectedGoal => _selectedGoal;

  void setGoal(String goal) {
    _selectedGoal = goal;
    notifyListeners(); // Notify listeners of the state change
  }
}
