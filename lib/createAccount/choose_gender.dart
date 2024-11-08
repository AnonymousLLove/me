import 'package:flutter/material.dart';
import 'package:love_bird/config/routes.dart';
import 'package:love_bird/providers/gender_provider.dart';
import 'package:provider/provider.dart';

class Gender extends StatelessWidget {
  const Gender({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final genderProvider =
        Provider.of<GenderProvider>(context); // Access the provider

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
            children: [
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
                        width: screenSize.width * 0.3,
                        color: const Color(0xFF3628DD),
                      ),
                    ),
                  ],
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
                Image.asset('assets/images/star.png', width: 30),
              ]),
              const SizedBox(height: 10),
              const Text(
                'Choose the gender that best represents you.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text(
                ' Authenticity is the key to meaningful connections.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 40),
              buildGenderOption('Man', 1, screenSize, genderProvider),
              const SizedBox(height: 20),
              buildGenderOption('Woman', 2, screenSize, genderProvider),
              const SizedBox(height: 20),
              buildGenderOption(
                  "I'd Prefer Not to Say", 3, screenSize, genderProvider),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, relationshipGoalsScreen);
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
      ),
    );
  }

  // Function to build the gender options dynamically
  Widget buildGenderOption(
      String label, int value, Size screenSize, GenderProvider genderProvider) {
    return InkWell(
      onTap: () {
        genderProvider
            .setGender(value); // Update the selected gender through provider
      },
      child: Container(
        width: screenSize.width * 0.8,
        height: screenSize.height * 0.05,
        decoration: BoxDecoration(
          color: genderProvider.selectedGender == value
              ? const Color.fromRGBO(54, 40, 221, 1)
              : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(54, 40, 221, 1),
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: genderProvider.selectedGender == value
                  ? Colors.white
                  : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
