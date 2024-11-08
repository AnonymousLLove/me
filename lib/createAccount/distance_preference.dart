import 'dart:io';

import 'package:flutter/material.dart';
import 'package:love_bird/config/routes.dart';
import 'package:love_bird/createAccount/image.dart';
import 'package:love_bird/providers/distance_preference_provider.dart';
import 'package:provider/provider.dart';

class DistancePreferenceScreen extends StatelessWidget {
  const DistancePreferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Access the provider using Provider.of or Consumer
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal:
                MediaQuery.of(context).size.width * 0.05, // 5% of screen width
            vertical: MediaQuery.of(context).size.height *
                0.02, // 5% of screen height
          ),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Progress bar
                  SizedBox(
                    width: screenSize.width,
                    height: 15,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            color: const Color(0xFF3628DD).withOpacity(0.19),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            width: screenSize.width * 0.5,
                            color: const Color(0xFF3628DD),
                          ),
                        ),
                      ],
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
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Consumer<DistanceProvider>(
                        builder: (context, distanceProvider, child) {
                          return Text(
                            distanceProvider.currentSliderValue == 100
                                ? 'Unlimited'
                                : '${distanceProvider.currentSliderValue.toInt()} km',
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Slider
                  Consumer<DistanceProvider>(
                    builder: (context, distanceProvider, child) {
                      return Slider(
                        value: distanceProvider.currentSliderValue,
                        min: 1,
                        max: 100,
                        divisions: 100,
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        inactiveColor: Colors.grey[300],
                        label: distanceProvider.currentSliderValue == 100
                            ? 'Unlimited'
                            : '${distanceProvider.currentSliderValue.toInt()} km',
                        onChanged: (double value) {
                          distanceProvider.currentSliderValue = value;
                        },
                      );
                    },
                  ),

                  // Continue Button
                  SizedBox(height: screenSize.height * 0.4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, interestsSelectionScreen);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(54, 40, 221, 1),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
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
      Navigator.pushNamed(context, homeScreen);
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
