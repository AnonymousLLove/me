import 'package:flutter/foundation.dart';

class GenderProvider extends ChangeNotifier {
  int _selectedGender = 0; // 0: none, 1: man, 2: woman, 3: prefer not to say

  int get selectedGender => _selectedGender;

  void setGender(int gender) {
    _selectedGender = gender;
    notifyListeners(); // Notifny listeners of the state change
  }
}
