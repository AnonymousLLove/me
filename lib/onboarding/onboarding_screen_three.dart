import 'package:flutter/material.dart';
import 'package:love_bird/sign/sign.dart';

class OnboardingScreenThree extends StatefulWidget {
  const OnboardingScreenThree({super.key});

  @override
  State<OnboardingScreenThree> createState() => _OnboardingScreenThreeState();
}

class _OnboardingScreenThreeState extends State<OnboardingScreenThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background container to avoid covering the second container
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height / 2.5, // Prevent overlap
            child: Container(
              color: Colors.white,
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
                          width: 10.0, // Border width
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
                                child: Image.asset("images/Rectangle 2.png"),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("images/onboarding.png"),
                                  const Text(
                                    "Love Bird",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black, // Text color
                                    ),
                                  ),
                                  const Icon(Icons.search),
                                  Image.asset("images/filter.png"),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Image.asset("images/Group 2.png"),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Image.asset("images/Group 1.png"),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Image.asset("images/Group 3.png"),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Image.asset("images/Group 4.png"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Transparent grey SizedBox
          // Positioned(
          //   top:
          //       23, // Adjust this value to position it on top of the first SizedBox
          //   left: 0, // Center it horizontally (adjust accordingly)
          //   child: SizedBox(
          //     width: 385,
          //     height: 500,
          //     child: DecoratedBox(
          //       decoration: BoxDecoration(
          //         color: Colors.black.withOpacity(0.74),
          //         // border: Border.all(
          //         //   color: const Color(0xFF3628DD), // Border color
          //         //   width: 1.0, // Border width
          //         // ),
          //       ),
          //     ),
          //   ),
          // ),

          Align(
            alignment:
                Alignment.topCenter, // Align at the top center of the screen
            child: SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.9, // Adjust width for responsiveness
              height: MediaQuery.of(context).size.height *
                  0.6, // Adjust height for responsiveness
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.74),
                ),
              ),
            ),
          ),

          // Second Love card positioned on top
          // Positioned(
          //   top:
          //       150, // Adjust this value to position it on top of the first SizedBox
          //   left: 30, // Center it horizontally (adjust accordingly)
          //   child: SizedBox(
          //     width: 320,
          //     height: 400,
          //     child: DecoratedBox(
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         // border: Border.all(
          //         //   color: const Color(0xFF3628DD), // Border color
          //         //   width: 1.0, // Border width
          //         // ),
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         children: [
          //           Image.asset("images/you got a match.png"),
          //           const Text(
          //             "You Got The Match!",
          //             style: TextStyle(
          //                 fontSize: 24,
          //                 fontWeight: FontWeight.w700,
          //                 color: Color(0xFF3628DD)),
          //           ),
          //           const Text(
          //             "You both liked each other. Take charge\n and start a meaningful connection.",
          //             style: TextStyle(
          //                 fontSize: 15,
          //                 fontWeight: FontWeight.w400,

          //                 ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),

          Align(
            alignment: Alignment.center,
            child: Transform.translate(
              offset: const Offset(
                  0, -90), // Adjust this value to move up (negative y-axis)
              child: SizedBox(
                width:
                    MediaQuery.of(context).size.width * 0.7, // Responsive width
                height: MediaQuery.of(context).size.height *
                    0.5, // Responsive height
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("images/you got a match.png"),
                      const Text(
                        "You Got The Match!",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF3628DD)),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "You both liked each other. Take charge\nand start a meaningful connection.",
                          textAlign: TextAlign.center, // Center the text
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
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
                height: MediaQuery.of(context).size.height /
                    2, // Half of the screen height
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center content vertically
                      children: [
                        const SizedBox(height: 15),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Find Your Perfect Match Today',
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
                          'Discover real connections with love bird’s intelligent match making algorithm. Start swiping to find your perfect match today.',
                          style: TextStyle(
                              fontSize: 20, color: Colors.white), // Text color
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 35), // Space before button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("images/Rectangle 12.png"),
                            ),
                            Image.asset("images/Rectangle 12.png"),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("images/Rectangle 10.png"),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpScreen()),
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
    path.quadraticBezierTo(size.width / 2, 120, 0, -20); // Curved top left
    path.lineTo(0, 0); // Close to the starting point
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
