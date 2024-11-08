import 'package:flutter/material.dart';

class CelebrateYouProvider with ChangeNotifier {
  String _month = '';
  String _day = '';
  String _year = '';

  String get month => _month;
  String get day => _day;
  String get year => _year;

  void setMonth(String value) {
    _month = value;
    notifyListeners();
  }

  void setDay(String value) {
    _day = value;
    notifyListeners();
  }

  void setYear(String value) {
    _year = value;
    notifyListeners();
  }
}
