// image_display.dart
import 'dart:io';
import 'package:flutter/material.dart';

class ImageDisplay extends StatelessWidget {
  final List<File?> images;

  const ImageDisplay({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: images[0] != null // Check if the first image is not null
          ? CircleAvatar(
              radius: 80, // Adjust the radius as needed
              backgroundImage:
                  FileImage(images[0]!), // Use FileImage to display the image
              child: const Text(
                  ''), // You can provide fallback text here if needed
            )
          : const CircleAvatar(
              radius: 80, // Same radius for consistency
              child: Text('Select Image'), // Fallback text
            ),
    );
  }
}
