import 'package:flutter/material.dart';
import 'package:love_bird/onboarding/onboarding_screen_three.dart';
import 'package:love_bird/sign/sign.dart';

class OnboardingScreenTwo extends StatefulWidget {
  const OnboardingScreenTwo({super.key});

  @override
  State<OnboardingScreenTwo> createState() => _OnboardingScreenTwoState();
}

class _OnboardingScreenTwoState extends State<OnboardingScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Onboarding One'),
      // ),
      body: Stack(
        children: [
          // Positioned background container to avoid covering the second container
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height / 2.5, // Prevent overlap
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Content for the first container
                    SizedBox(
                        width: 300,
                        height: 450,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0xFF3628DD), // Border color
                              width:
                                  10.0, // Border width (increase this to make it thicker)
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                        Image.asset("images/Rectangle 2.png"),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Image.asset(
                                            "images/onboarding.png"),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      const Text(
                                        "Profile",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black, // Text color
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                        height: 25,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Action when button is pressed
                                          },
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            backgroundColor: const Color(
                                                0xFF3628DD), // Text color
                                            elevation: 3,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Upgrade',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Icon(Icons.settings),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 20.0),
                                    child: SingleChildScrollView(
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.12,
                                        // width: 250,
                                        // height: 90,
                                        child: DecoratedBox(
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF3628DD),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    10)), // Curved edges
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .start, // Center content vertically
                                            children: [
                                              const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 45.0,
                                                            vertical: 8),
                                                    child: Text(
                                                      'Complete your profile', // Replace with your desired text
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors
                                                              .white), // Text color
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                              // Circular progress indicatoris here
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      // Circular progress indicator
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    10.0),
                                                        child: SizedBox(
                                                          width: 35,
                                                          height: 35,
                                                          child:
                                                              CircularProgressIndicator(
                                                            value:
                                                                0.2, // 20% completion
                                                            strokeWidth: 8,
                                                            backgroundColor:
                                                                Colors
                                                                    .grey[300],
                                                            valueColor:
                                                                const AlwaysStoppedAnimation<
                                                                        Color>(
                                                                    Colors
                                                                        .blue),
                                                          ),
                                                        ),
                                                      ),
                                                      // Text inside the circular indicator
                                                      const Text(
                                                        '20%',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Flexible(
                                                    child: Text(
                                                      'Complete your profile to experience the best\nfrom our dating app.', // Replace with your desired text
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color: Colors
                                                              .white), // Text color
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // Add more widgets to the column as needed
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10.0, left: 10),
                                    child: Image.asset(
                                        "images/onboarding two man.png"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          // Curved container positioned lower in the stack
          Positioned(
            bottom: 0, // Align to the bottom of the screen
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: CurvedTopContainerClipper(),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF3628DD),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                height: MediaQuery.of(context).size.height *
                    0.6, // Half of the screen height
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center content vertically
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Be Yourself, Stand Out From The Crowd',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Text color
                            ),
                            textAlign: TextAlign.center, // Center align text
                          ),
                        ),
                        const SizedBox(height: 10), // Space between text
                        const Text(
                          'Tell your story, share your interests, hobbies and what you’re looking for. Be authentic and make a lasting impression.',
                          style: TextStyle(
                              fontSize: 20, color: Colors.white), // Text color
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 35),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("images/Rectangle 12.png"),
                            ),
                            Image.asset("images/Rectangle 10.png"),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("images/Rectangle 12.png"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50), // Space before button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 140,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor:
                                      const Color(0xFFD2CFFB), // Text color
                                  elevation: 3,
                                ),
                                child: const Text(
                                  'Skip',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 140,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Action when button is pressed
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const OnboardingScreenThree()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor:
                                      const Color(0xFFFFFFFF), // Text color
                                  elevation: 3,
                                ),
                                child: const Text(
                                  'Continue',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF3628DD),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom clipper for curved top border with rounded left and right edges
class CurvedTopContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height); // Start from bottom left
    path.lineTo(size.width, size.height); // Bottom right
    path.lineTo(size.width, -20); // Top right
    path.quadraticBezierTo(size.width / 2, 100, 0, -20); // Curved top left
    path.lineTo(0, 0); // Close to the starting point
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) =>
      true; // Reclip when necessary
}
