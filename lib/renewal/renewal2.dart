import 'package:flutter/material.dart';
import 'package:love_bird/renewal/renewal3.dart';

class SafetyScreen extends StatelessWidget {
  const SafetyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    Color blue = Color.fromRGBO(54, 40, 221, 1.0);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.4,
              width: double.infinity,
              child: Image.asset(
                'assets/images/check.png',
                fit: BoxFit.cover,
              ),
            ),
            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Title
                    const Text(
                      'Your Safety first, second, and always.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Description
                    const Text(
                      'We’ve got lots of tools to keep you safe and secure while you date.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Safety Features
                    const SafetyFeature(
                      icon: Icons.verified_user,
                      text: 'Photo verification',
                    ),
                    const SizedBox(height: 16),
                    const SafetyFeature(
                      icon: Icons.videocam,
                      text: 'In-app video call',
                    ),
                    const SizedBox(height: 16),
                    const SafetyFeature(
                      icon: Icons.call,
                      text: 'In-app voice call',
                    ),
                    const SizedBox(height: 16),
                    const SafetyFeature(
                      icon: Icons.visibility_off,
                      text: 'Incognito Mode',
                    ),
                    const SizedBox(height: 32),
                    // Next Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PremiumExpiredScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: blue,
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SafetyFeature extends StatelessWidget {
  final IconData icon;
  final String text;

  const SafetyFeature({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Color.fromRGBO(54, 40, 221, 1.0),
          size: 28,
        ),
        const SizedBox(width: 16),
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
