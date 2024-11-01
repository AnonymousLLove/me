import 'dart:io';

import 'package:flutter/material.dart';
import 'package:love_bird/createAccount/image.dart';

import 'package:love_bird/createAccount/interest.dart';
import 'package:geolocator/geolocator.dart';
import 'package:love_bird/createAccount/loading.dart';
import 'package:love_bird/homeScreen/homeScreen2.dart';

import 'package:permission_handler/permission_handler.dart';

class DistancePreferenceScreen extends StatefulWidget {
  const DistancePreferenceScreen({super.key});

  @override
  _DistancePreferenceScreenState createState() =>
      _DistancePreferenceScreenState();
}

class _DistancePreferenceScreenState extends State<DistancePreferenceScreen> {
  double _currentSliderValue = 50;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 50, top: 50.0),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Progress bar
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    height: 25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: 0.5, // Simulating progress
                        backgroundColor: Colors.grey[300],
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color.fromRGBO(54, 40, 221, 1),
                        ),
                        minHeight: 8,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Find matches nearby ',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset(
                      'assets/images/icons/compass.png',
                    ),
                  ],
                ),

                const SizedBox(height: 8),
                const Text(
                  'Select your preferred distance range to discover matches conveniently. We\'ll help you find love close by.',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                const SizedBox(height: 40),
                // Slider title and value display
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Distance Preference',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      _currentSliderValue == 100
                          ? 'Unlimited'
                          : '${_currentSliderValue.toInt()} km', // Unlimited if max
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Slider
                Slider(
                  value: _currentSliderValue,
                  min: 1,
                  max: 100,
                  divisions: 100,
                  activeColor:
                      const Color.fromRGBO(54, 40, 221, 1), // Blue slider color
                  inactiveColor: Colors.grey[300],
                  label: _currentSliderValue == 100
                      ? 'Unlimited'
                      : '${_currentSliderValue.toInt()} km', // Unlimited if max
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),

                // Continue Button
                SizedBox(height: screenSize.height * 0.4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const InterestsSelectionScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(
                          54, 40, 221, 1), // Set the blue background color
                      foregroundColor: Colors.white, // Text color
                      minimumSize:
                          const Size(double.infinity, 50), // Full-width button
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Rounded corners
                      ),
                    ),
                    child: const Text('Continue',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EnableLocationScreen extends StatefulWidget {
  final List<File?> images;

  const EnableLocationScreen({super.key, required this.images});

  @override
  _EnableLocationScreenState createState() => _EnableLocationScreenState();
}

class _EnableLocationScreenState extends State<EnableLocationScreen> {
  // Method to check location permission and request location
  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.status;

    if (status.isGranted) {
      _getCurrentLocation();
    } else if (status.isDenied) {
      if (await Permission.location.request().isGranted) {
        _getCurrentLocation();
      } else {
        _showErrorDialog(
            "Location permission is denied. Please enable it in the settings.");
      }
    } else if (status.isPermanentlyDenied) {
      _showErrorDialog(
          "Location permission is permanently denied. Please enable it in the settings.");
      openAppSettings();
    }
  }

  // Method to get current location using Geolocator
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showErrorDialog(
          "Location services are disabled. Please enable them in the settings.");
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _showErrorDialog(
          "Location permission is permanently denied. Please enable it in the settings.");
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print('Current location: ${position.latitude}, ${position.longitude}');

    // Navigate to another screen after location is successfully fetched
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FindingPeople(
            images: widget.images), // Replace with your next screen widget
      ),
    );
  }

  // Method to show error dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Top progress indicator
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value: 1,
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color.fromRGBO(54, 40, 221, 1),
                    ),
                    minHeight: 8,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 70),

            // Location Icon
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/location.png',
                      height: 200,
                      width: 200,
                      color: const Color.fromRGBO(54, 40, 221, 1),
                    ),
                  ),

                  // Enable Location Text
                  const Text(
                    'Enable Location',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(54, 40, 221, 1),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Description Text
                  const Text(
                    'You need to enable location to use the Love Bird app',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(54, 40, 221, 1),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ]),
            const Spacer(),

            // Allow Location Button
            ElevatedButton(
              onPressed: () {
                _requestLocationPermission();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(54, 40, 221, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
                minimumSize: Size(screenSize.width * 0.8, 50),
              ),
              child: const Text(
                'Allow Location',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NearPeople extends StatefulWidget {
  final List<File?> images;
  const NearPeople({super.key, required this.images});

  @override
  _NearPeopleState createState() => _NearPeopleState();
}

class _NearPeopleState extends State<NearPeople>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true); // Make it repeat in reverse for a zoom effect

    _animation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Delay for 3 seconds, then navigate to another page.
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const DatingProfilePage(), // Replace with your target page
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller to free up resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center the entire column
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animation.value,
                      child: child,
                    );
                  },
                  child: Stack(
                    alignment: Alignment.center, // Adjust alignment as needed
                    children: [
                      Image.asset(
                        'assets/images/find.png',
                        width: 200,
                        height: 200,
                      ),
                      ImageDisplay(images: widget.images),
                    ],
                  )),
              const SizedBox(height: 20),
              const Text(
                'Finding people near You....',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(54, 40, 221, 1),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
