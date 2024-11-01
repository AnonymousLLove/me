import 'dart:io';

import 'package:flutter/material.dart';
import 'package:love_bird/createAccount/location.dart';

class PhotoVerification extends StatefulWidget {
  final List<File?> images;
  const PhotoVerification({super.key, required this.images});

  @override
  _PhotoVerificationState createState() => _PhotoVerificationState();
}

class _PhotoVerificationState extends State<PhotoVerification> {
  // Method to show the submission dialog and navigate after 2 seconds
  void _showSubmissionDialog() {
    showDialog(
      barrierDismissible:
          true, // Prevent dialog from closing by tapping outside
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Wrap content
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(54, 40, 221, 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset(
                    'assets/images/password.png', // Example image
                    height: 80,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Submitted Successfully!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(54, 40, 221, 1),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Your photo will be reviewed within the next 48hrs\nPlease wait...\n You'll be redirected to the next page",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );

    // Wait for 2 seconds and then navigate to the next screen
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context); // Close the dialog
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => EnableLocationScreen(
              images: widget.images), // Replace with your next screen
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            const Text(
              'Don’t worry, users won’t see these pictures.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Spacer(),

            // Submit button
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  _showSubmissionDialog(); // Show dialog on submit
                },
                child: Container(
                  width: screenSize.width * 0.8,
                  height: screenSize.height * 0.05,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(54, 40, 221, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
