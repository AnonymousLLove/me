import 'package:flutter/material.dart';

class UserAccountProvider extends ChangeNotifier {
  // Fields for user information
  String email = '';
  String password = '';
  String profession = '';
  String weight = '';
  String height = '';
  String country = '';
  String city = '';
  String? educationLevel = '';
  String bio = '';
  bool agreeToPolicy = false;

  final List<String> educationLevels = [
    'None',
    'Primary Education',
    'Secondary Education',
    'Higher Education',
    'Vocational Training',
    'Postgraduate Education',
  ];

  // Update methods for each field
  void updateEmail(String newEmail) {
    email = newEmail;
    notifyListeners();
  }

  void updatePassword(String newPassword) {
    password = newPassword;
    notifyListeners();
  }

  void updateProfession(String newProfession) {
    profession = newProfession;
    notifyListeners();
  }

  void updateWeight(String newWeight) {
    weight = newWeight;
    notifyListeners();
  }

  void updateHeight(String newHeight) {
    height = newHeight;
    notifyListeners();
  }

  void updateCountry(String newCountry) {
    country = newCountry;
    notifyListeners();
  }

  void updateCity(String newCity) {
    city = newCity;
    notifyListeners();
  }

  void updateEducationlevel(String newEducationlevel) {
    educationLevel = newEducationlevel;
    notifyListeners();
  }

  void updateBio(String newBio) {
    bio = newBio;
    notifyListeners();
  }
  // Additional update methods for other fields...

  void toggleAgreeToPolicy(bool? newValue) {
    agreeToPolicy = newValue ?? false;
    notifyListeners();
  }

  // Method to reset fields after form submission
  void resetFields() {
    email = '';
    password = '';
    profession = '';
    weight = '';
    height = '';
    country = '';
    city = '';
    educationLevel = '';
    bio = '';
    agreeToPolicy = false;
    notifyListeners();
  }

  // Method to save data (to be integrated with backend)
  Future<void> saveToDatabase() async {
    // Add database saving logic here
  }
}
