import 'package:flutter/material.dart';
import 'package:love_bird/createAccount/relationship.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  int selectedGender = 0; // 0: none, 1: man, 2: woman, 3: prefer not to say

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
          children: [
            // Progress bar at the top
            SizedBox(
              height: 25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    LinearProgressIndicator(
                      value: 1.0,
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.transparent,
                      ),
                      minHeight: 25,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const LinearProgressIndicator(
                        value: 0.3,
                        backgroundColor: Colors.transparent,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color.fromRGBO(54, 40, 221, 1),
                        ),
                        minHeight: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(children: [
              const Text(
                'Be True To Yourself',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              //const SizedBox(width: 5),
              Image.asset('assets/images/star.png', width: 30),
            ]),
            const SizedBox(height: 10),
            const Text(
              'Choose the gender that best represents you.',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              ' Authenticity is the key to meaningful connections.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            buildGenderOption('Man', 1, screenSize),
            const SizedBox(height: 20),
            buildGenderOption('Woman', 2, screenSize),
            const SizedBox(height: 20),
            buildGenderOption("I'd Not to Say", 3, screenSize),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RelationshipGoalsScreen(),
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
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build the gender options dynamically
  Widget buildGenderOption(String label, int value, Size screenSize) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedGender = value; // Set the selected gender
        });
      },
      child: Container(
        width: screenSize.width * 0.8,
        height: screenSize.height * 0.05,
        decoration: BoxDecoration(
          color: selectedGender == value
              ? const Color.fromRGBO(54, 40, 221, 1)
              : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(54, 40, 221, 1),
              spreadRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: selectedGender == value ? Colors.white : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
