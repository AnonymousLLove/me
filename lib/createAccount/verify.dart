import 'package:flutter/material.dart';
import 'package:love_bird/config/routes.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    const Color blue = Color.fromRGBO(54, 40, 221, 1.0);

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Message icon image in the center
                Container(
                  width: 130, // Adjust the size as needed
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: blue, // Blue border color
                      width: 4,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      'assets/images/icons/messageI.png', // Your message icon image
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Email sent information
                const Text(
                  'We have sent an email to yourmail@gmail.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),

                const Text(
                  'Click the link in your email to get started',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),

                // Resend email option
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn't receive email?",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          // Handle resend email
                        },
                        child: const Text(
                          'Resend email',
                          style: TextStyle(
                            fontSize: 15,
                            color: blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Positioned button at the bottom of the screen
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: SizedBox(
              width: screenSize.width * 0.9,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(
                      color: blue, // Blue border
                      width: 2,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, captchaVerificationPage);
                },
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'I have verified my email',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
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

class CaptchaVerificationPage extends StatefulWidget {
  const CaptchaVerificationPage({super.key});

  @override
  _CaptchaVerificationPageState createState() =>
      _CaptchaVerificationPageState();
}

class _CaptchaVerificationPageState extends State<CaptchaVerificationPage> {
  final bool _isChecked = false; // Checkbox state
  bool _isLoading = false; // Loading state

  void _onCheckboxTapped() {
    if (!_isLoading) {
      setState(() {
        _isLoading = true; // Start loading
      });

      // Simulate a delay for loading
      Future.delayed(const Duration(seconds: 3), () {
        // Navigate to the next screen after 3 seconds
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const CaptchaVerificationPage2()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    const Color blue = Color.fromRGBO(54, 40, 221, 1.0);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 15,
              child: Stack(
                children: [
                  // Background bar
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10.0), // Outer rounded corners
                    child: Container(
                      color: const Color(0xFF3628DD)
                          .withOpacity(0.19), // Background color
                    ),
                  ),
                  // Inner progress bar
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10.0), // Inner rounded corners
                    child: Container(
                      width: MediaQuery.of(context).size.width *
                          0.1, // Set width to represent progress
                      color: const Color(0xFF3628DD), // Progress color
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Verify you're human",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(width: 5),
                Image.asset('assets/images/two.png'),
              ],
            ),

            const Text(
              "Please solve this captcha so we know you are a person",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Please tick the box to continue",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            Container(
              width: screenSize.width * 0.9,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: blue, // Blue border color
                  width: 2,
                ),
              ),
              child: Row(
                children: [
                  // Checkbox
                  GestureDetector(
                    onTap: _onCheckboxTapped,
                    child: _isLoading
                        ? SizedBox(
                            width: 26,
                            height: 26,
                            child: const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(blue),
                              ),
                            ),
                          )
                        : Container(
                            width: 26,
                            height: 26,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(210, 207, 251, 0.56),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: blue,
                                width: 2,
                              ),
                            ),
                            child: _isChecked
                                ? const Icon(
                                    Icons.check,
                                    color: blue,
                                    size: 20,
                                  )
                                : const SizedBox
                                    .shrink(), // Show nothing if unchecked
                          ),
                  ),

                  const SizedBox(width: 10),

                  const Text(
                    "I'm not a robot",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const CaptchaVerificationPage2()),
                      );
                    },
                    child: Image.asset(
                      'assets/images/logos_recaptcha.png',
                      height: 30,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(), // Pushes content to the top to allow more space at the bottom
          ],
        ),
      ),
    );
  }
}

class CaptchaVerificationPage2 extends StatefulWidget {
  const CaptchaVerificationPage2({super.key});

  @override
  State<CaptchaVerificationPage2> createState() =>
      _CaptchaVerificationPage2State();
}

class _CaptchaVerificationPage2State extends State<CaptchaVerificationPage2> {
  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    // const Color blue = Color.fromRGBO(54, 40, 221, 1.0);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 15,
                child: Stack(
                  children: [
                    // Background bar
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(10.0), // Outer rounded corners
                      child: Container(
                        color: const Color(0xFF3628DD)
                            .withOpacity(0.19), // Background color
                      ),
                    ),
                    // Inner progress bar
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(10.0), // Inner rounded corners
                      child: Container(
                        width: MediaQuery.of(context).size.width *
                            0.1, // Set width to represent progress
                        color: const Color(0xFF3628DD), // Progress color
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Title text
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Verify you're human",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(width: 5),
                  Image.asset('assets/images/two.png')
                ],
              ),

              // Instruction text
              const Text(
                "Please solve this captcha so we know you are a person",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 20),

              // Captcha placeholder box

              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Captcha3()),
                    );
                  },
                  child: Image.asset('assets/images/captcha.png'),
                ),
              ),

              // Pushes content to the top to allow more space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}

class Captcha3 extends StatefulWidget {
  const Captcha3({super.key});

  @override
  State<Captcha3> createState() => _Captcha3State();
}

class _Captcha3State extends State<Captcha3> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    const Color blue = Color.fromRGBO(54, 40, 221, 1.0);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 15,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10.0), // Outer rounded corners
                    child: Container(
                      color: const Color(0xFF3628DD)
                          .withOpacity(0.19), // Background color
                    ),
                  ),
                  // Inner progress bar
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10.0), // Inner rounded corners
                    child: Container(
                      width: MediaQuery.of(context).size.width *
                          0.1, // Set width to represent progress
                      color: const Color(0xFF3628DD), // Progress color
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Verify you're human",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(width: 5),
                Image.asset('assets/images/two.png'),
              ],
            ),

            const Text(
              "Please solve this captcha so we know you are a person",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: screenSize.width * 0.9,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: blue, // Blue border color
                  width: 2,
                ),
              ),
              child: Row(
                children: [
                  // Checkbox
                  const Icon(Icons.check, color: Colors.green, size: 30),

                  const SizedBox(width: 10),

                  const Text(
                    "I'm not a robot",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),

                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, createNickname);
                    },
                    child: Image.asset(
                      'assets/images/logos_recaptcha.png',
                      height: 30,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, createNickname);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(
                      54, 40, 221, 1), // Set the blue background color
                  foregroundColor: Colors.white, // Text color
                  minimumSize:
                      const Size(double.infinity, 50), // Full-width button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                  ),
                ),
                child: const Text('Continue',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ) // Pushes content to the top to allow more space at the bottom
          ],
        ),
      ),
    );
  }
}
