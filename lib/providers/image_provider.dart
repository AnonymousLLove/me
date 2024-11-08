import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SixImageProvider extends ChangeNotifier {
  List<File?> images = List.filled(9, null); // Stores up to 9 images

  // To pick an image
  Future<void> pickImage(int index, ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      images[index] = File(pickedFile.path);
      notifyListeners(); // Notify listeners to update UI
    }
  }

  // To remove an image
  void removeImage(int index) {
    images[index] = null;
    notifyListeners(); // Notify listeners to update UI
  }

  // To get the count of uploaded images
  int get uploadedImageCount {
    return images.where((image) => image != null).length;
  }
}
