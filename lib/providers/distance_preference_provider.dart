import 'package:flutter/material.dart';

class DistanceProvider extends ChangeNotifier {
  double _currentSliderValue = 50; // Default value

  double get currentSliderValue => _currentSliderValue;

  set currentSliderValue(double value) {
    _currentSliderValue = value;
    notifyListeners(); // Notify listeners when the value changes
  }
}
