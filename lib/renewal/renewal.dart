import 'package:flutter/material.dart';
import 'package:love_bird/renewal/renewal2.dart';

class UpgradePremium extends StatelessWidget {
  const UpgradePremium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          // Added this to make the screen scrollable
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * 0.7,
                  child: Stack(
                    children: [
                      Positioned(
                        //top: screenHeight * 0.02, // 2% of screen height
                        left: screenWidth * 0.01, // 5% of screen width
                        child: Image.asset(
                          'assets/images/love1.png',
                          width: screenWidth * 0.5, // 40% of screen width
                          height: screenHeight * 0.4, // 20% of screen height
                        ),
                      ),
                      Positioned(
                        top: screenHeight * 0.14, // 20% of screen height
                        right: screenWidth * 0.05, // 5% of screen width
                        child: Image.asset(
                          'assets/images/love22.png',
                          width: screenWidth * 0.5, // 40% of screen width
                          height: screenHeight * 0.4, // 20% of screen height
                        ),
                      ),
                      Positioned(
                        top: screenHeight * 0.35, // 40% of screen height
                        left: screenWidth * 0.1, // 10% of screen width
                        child: Image.asset(
                          'assets/images/love3.png',
                          width: screenWidth * 0.5, // 40% of screen width
                          height: screenHeight * 0.4, // 20% of screen height
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                // Title
                const Text(
                  "Here's to dating \n with confidence....",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Welcome to Love Bird, Hailey',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 32),
                // Next Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SafetyScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: const Color.fromRGBO(54, 40, 221, 1.0),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
