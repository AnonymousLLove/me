import 'package:flutter/material.dart';
import 'package:love_bird/onboarding/onboarding_screen_one.dart';
import 'package:love_bird/onboarding/onboarding_screen_three.dart';
import 'package:love_bird/onboarding/onboarding_screen_two.dart';

class SlideableOnboardingScreen extends StatefulWidget {
  const SlideableOnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SlideableOnboardingScreenState createState() =>
      _SlideableOnboardingScreenState();
}

class _SlideableOnboardingScreenState extends State<SlideableOnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                _buildFirstOnboardingPage(), // First page with custom Stack
                _buildSecondOnboardingPage(),
                _buildThirdOnboardingPage(),
              ],
            ),
          ),
          if (_currentPage == 2) const SizedBox(height: 0),
        ],
      ),
    );
  }

  Widget _buildFirstOnboardingPage() {
    return const OnboardingScreenOne();
  }

  Widget _buildSecondOnboardingPage() {
    return const OnboardingScreenTwo();
  }

  Widget _buildThirdOnboardingPage() {
    return const OnboardingScreenThree();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
