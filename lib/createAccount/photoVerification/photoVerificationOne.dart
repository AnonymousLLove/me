import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:love_bird/createAccount/enable_location.dart';
import 'package:love_bird/createAccount/image.dart';
import 'package:love_bird/createAccount/photoVerification/PhotoVerificationScan.dart';

class PhotoVerificationOne extends StatefulWidget {
  final List<File?> images;

  const PhotoVerificationOne({super.key, required this.images});

  @override
  _PhotoVerificationOneState createState() => _PhotoVerificationOneState();
}

class _PhotoVerificationOneState extends State<PhotoVerificationOne> {
  bool isTapped = true;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        // Update the images list with the new image
        widget.images[0] = File(pickedFile.path); // Replace the first image
      });
    }
  }

  void _showImageSourceMenu(BuildContext context) {
    showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(2, 300, 0, 100),
      items: [
        PopupMenuItem<ImageSource>(
          value: ImageSource.gallery,
          child: SizedBox(
            width: 120, // Adjust the width as needed
            height: 20, // Adjust the height as needed
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.photo_library, size: 16), // Smaller icon size
                SizedBox(width: 8),
                Text('Pick from gallery', style: TextStyle(fontSize: 10)),
              ],
            ),
          ),
        ),
        PopupMenuItem<ImageSource>(
          value: ImageSource.camera,
          child: SizedBox(
            width: 100, // Adjust the width as needed
            height: 20, // Adjust the height as needed
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.camera_alt, size: 16), // Smaller icon size
                SizedBox(width: 3),
                Text('Take a photo', style: TextStyle(fontSize: 10)),
              ],
            ),
          ),
        ),
      ],
    ).then((value) {
      if (value != null) {
        _pickImage(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 15,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10.0), // Outer rounded corners
                    child: Container(
                      color: const Color(0xFF3628DD)
                          .withOpacity(0.19), // Background color
                    ),
                  ),
                  // Inner progress bar
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10.0), // Inner rounded corners
                    child: Container(
                      width: MediaQuery.of(context).size.width *
                          0.8, // Set width to represent progress
                      color: const Color(0xFF3628DD), // Progress color
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Photo Verification',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5),
                Image.asset('assets/images/verify.png', height: 40),
              ],
            ),
            const SizedBox(height: 15),
            Stack(
              children: [
                ImageDisplay(images: widget.images),
                Positioned(
                  bottom: 20,
                  left: 210,
                  // right: 20,
                  child: GestureDetector(
                    onTap: () => _showImageSourceMenu(context),
                    child: Container(
                      height: 40,
                      width: 40, // Adjust height for a better tap area
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(197, 202, 227, 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                          child: Icon(Icons.camera_alt, color: Colors.black)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Center(
              child: Text(
                'Prove you’re the real you, with selfies. If the pics match your profile, we’ll give you a blue tick to show off your new verified status. And we’ll keep the selfies just between us.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 200),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GestureVerificationScreen(images: widget.images),
                        ),
                      );
                    },
                    child: Container(
                      width: screenSize.width * 0.8,
                      height: screenSize.height * 0.05,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(54, 40, 221, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text('Continue',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15), // Add spacing between buttons
                  InkWell(
                    onTap: () {
                      setState(() {
                        isTapped = !isTapped;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EnableLocationScreen(images: widget.images),
                          ),
                        );
                        //E // Toggle tapped state
                      });
                    },
                    child: Container(
                      width: screenSize.width * 0.8,
                      height: screenSize.height * 0.05,
                      decoration: BoxDecoration(
                        color: isTapped
                            ? Colors.grey[300]
                            : const Color.fromRGBO(54, 40, 221, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text('Maybe Later',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GestureVerificationScreen extends StatefulWidget {
  final List<File?> images;
  const GestureVerificationScreen({super.key, required this.images});

  @override
  State<GestureVerificationScreen> createState() =>
      _GestureVerificationScreenState();
}

class _GestureVerificationScreenState extends State<GestureVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(right: 20.0, left: 20, top: 50.0, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress bar at the top
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 15,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(10.0), // Outer rounded corners
                      child: Container(
                        color: const Color(0xFF3628DD)
                            .withOpacity(0.19), // Background color
                      ),
                    ),
                    // Inner progress bar
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(10.0), // Inner rounded corners
                      child: Container(
                        width: MediaQuery.of(context).size.width *
                            0.8, // Set width to represent progress
                        color: const Color(0xFF3628DD), // Progress color
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "Copy these gestures to verify your photo.",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 25),
              // Gesture verification images
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(
                      232, 232, 255, 1), // Background color for the image area
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  children: [
                    // Front-facing image
                    Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                                'assets/images/front.png' // Replace with your image URL
                                ),
                          ),
                          SizedBox(height: 8),
                          Text("Front",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Side-facing images (Left & Right)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                'assets/images/left2.png', // Replace with your image URL
                              ),
                            ),
                            SizedBox(height: 8),
                            Text("Left",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                'assets/images/right.png', // Replace with your image URL
                              ),
                            ),
                            SizedBox(height: 8),
                            Text("Right",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 150),
              // Verify button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(54, 40, 221, 1),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PhotoScreen3(images: widget.images)),
                    // PhotoVerification2(images: widget.images)),
                  );
                },
                child: const Text(
                  "Verify",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
