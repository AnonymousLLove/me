import 'dart:io';
import 'package:flutter/material.dart';
import 'package:love_bird/config/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

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
    Navigator.pushNamed(context, findingPeople);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => FindingPeople(
    //         images: widget.images), // Replace with your next screen widget
    //   ),
    // );
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal:
                MediaQuery.of(context).size.width * 0.05, // 5% of screen width
            vertical: MediaQuery.of(context).size.height *
                0.02, // 5% of screen height
          ),
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
      ),
    );
  }
}
