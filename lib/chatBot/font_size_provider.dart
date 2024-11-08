import 'package:flutter/material.dart';

class FontSizeProvider with ChangeNotifier {
  double _baseFontSize = 16; // Base font size, you can adjust this value

  // Set the base font size according to screen width
  void setBaseFontSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    _baseFontSize =
        screenWidth * 0.04; // Scale the base size (e.g., 4% of width)
    notifyListeners();
  }

  // Method to get a responsive font size
  double getFontSize(double scaleFactor) {
    return _baseFontSize * scaleFactor;
  }

  void updateFontSize(int i) {}
}
