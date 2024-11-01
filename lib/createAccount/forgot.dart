import 'package:flutter/material.dart';
import 'dart:async';

import 'package:love_bird/sign/sign2.dart';

class OTPVerificationPage extends StatefulWidget {
  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  List<String> otpCode = ['', '', '', ''];
  int _resendCodeTimer = 45; // Timer for resend code
  Timer? _timer;
  Color blue = Color.fromRGBO(54, 40, 221, 1.0);

  @override
  void initState() {
    super.initState();
    startResendTimer();
  }

  void startResendTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_resendCodeTimer > 0) {
        setState(() {
          _resendCodeTimer--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _handleOtpInput(int index, String value) {
    setState(() {
      otpCode[index] = value;
      if (value.isNotEmpty && index < 3) {
        // Move focus to the next field
        FocusScope.of(context).nextFocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20.0, left: 30, right: 30, bottom: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'OTP Code Verification',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                Icon(Icons.verified_outlined, color: blue, size: 24),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'We have sent an OTP to your email i********@ymail.com,\nEnter the OTP code below to verify',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: blue, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: TextField(
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      counterText: '',
                    ),
                    onChanged: (value) {
                      _handleOtpInput(index, value);
                    },
                  ),
                );
              }),
            ),
            SizedBox(height: 100),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  // Logic for resending code
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Forgot2()),
                  );
                },
                child: Text(
                  "Didn't receive email?",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Code has been resent'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Text(
                  'Resend code in $_resendCodeTimer s',
                  style: TextStyle(fontSize: 14, color: blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Forgot1 extends StatefulWidget {
  const Forgot1({super.key});

  @override
  State<Forgot1> createState() => _Forgot1State();
}

class _Forgot1State extends State<Forgot1> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      resizeToAvoidBottomInset: true, // This line helps prevent overflow
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenSize
                .height, // Make the ConstrainedBox at least screen height
          ),
          child: IntrinsicHeight(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text(
                              'Reset Your Password',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.key_sharp)
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Create your account in seconds, we'll help you find your perfect match",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        const SizedBox(height: 40),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              _buildTextField(
                                  'Email', emailController, Icons.email),
                              // _buildTextField('Password', passwordController, Icons.lock, true),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(18),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OTPVerificationPage()),
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
                        child: Text(
                          'Continue',
                          style: TextStyle(color: Colors.white, fontSize: 18),
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

  Widget _buildTextField(String label, TextEditingController controller,
      [IconData? icon, bool isPassword = false]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            obscureText: isPassword && !showPassword,
            decoration: InputDecoration(
              fillColor: const Color.fromRGBO(54, 40, 221, 0.1),
              prefixIcon: icon != null
                  ? Icon(icon, color: Colors.black, size: 20)
                  : null,
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              filled: true,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Forgot2 extends StatefulWidget {
  const Forgot2({super.key});

  @override
  State<Forgot2> createState() => _Forgot2State();
}

class _Forgot2State extends State<Forgot2> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool showPassword = false;

  void _showSubmissionDialog() {
    showDialog(
      barrierDismissible:
          true, // Prevent dialog from closing by tapping outside
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min, // Wrap content
              children: [
                Image.asset('assets/images/password.png'),
                const SizedBox(height: 20),
                const Text(
                  'Reset Password Successful!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(54, 40, 221, 1),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Please wait....\nYou will be redirected to the homepage",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 20),
                const CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );

    // Wait for 2 seconds and then navigate to the next screen
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context); // Close the dialog
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const LoginPage(), // Replace with your next screen
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Column(children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Create New Password',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.lock)
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Create your new password and save",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(height: 40),
                  Form(
                    key: _formKey,
                    child: Column(children: [
                      _buildTextField(
                          ' New Password', emailController, Icons.lock, true),
                      _buildTextField('Confirm New Password',
                          passwordController, Icons.lock, true),
                    ]),
                  ),
                  // Spacer(),
                  // Sign Up Button

                  const SizedBox(height: 10),
                  // Login Link
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(18),
            child: GestureDetector(
              onTap: () {
                _showSubmissionDialog();
              },
              child: Container(
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.05,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(54, 40, 221, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text('Save',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
            ),
          )
        ]));
  }

  Widget _buildTextField(String label, TextEditingController controller,
      [IconData? icon, bool isPassword = false]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            obscureText: isPassword && !showPassword,
            decoration: InputDecoration(
              fillColor: const Color.fromRGBO(54, 40, 221, 0.1),
              prefixIcon: icon != null
                  ? Icon(icon, color: Colors.black, size: 20)
                  : null,
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              filled: true,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
