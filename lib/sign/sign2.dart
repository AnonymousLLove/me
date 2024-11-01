import 'package:flutter/material.dart';
import 'package:love_bird/createAccount/createAccount1.dart';
import 'package:love_bird/homeScreen/homeScreen2.dart';
import 'package:love_bird/createAccount/forgot.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showLoading = false;
  bool dimBackground = false;

  String email = "", password = "";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool showPassword = false;

  void handleLogin(BuildContext context) {
    if (_formkey.currentState!.validate()) {
      setState(() {
        showLoading = true;
        dimBackground = true;
      });

      Future.delayed(const Duration(seconds: 0), () {
        const DatingProfilePage();
      });
    }
  }

  bool isChecked = false;
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
              mainAxisSize: MainAxisSize.min, // Wrap content
              children: [
                Image.asset('assets/images/icons/loginIcon.png'),
                const SizedBox(height: 20),
                const Text(
                  'Login Successful!',
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
                  style: TextStyle(fontSize: 16),
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
              const DatingProfilePage(), // Replace with your next screen
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/loginImage.png',
              fit: BoxFit.cover,
              color: dimBackground
                  ? Colors.black.withOpacity(0.5)
                  : Colors.transparent,
              colorBlendMode: BlendMode.darken,
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 150),
                              child: Text(
                                'Welcome back 👋',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20, top: 20),
                              child: Text(
                                'Please Enter your email and password to Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(height: 60),
                            // Add this container in your build method, wherever you'd like it to appear

                            // Email and Password Inputs (Form)
                            Form(
                              key: _formkey,
                              child: Column(
                                children: [
                                  _buildTextField(
                                      'Email', emailController, Icons.email),
                                  _buildTextField('Password',
                                      passwordController, Icons.lock, true),
                                  // Email Input
                                ],
                              ),
                            ),

                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isChecked = !isChecked;
                                      });
                                    },
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: const Color.fromRGBO(
                                              54, 40, 221, 1), // Blue border
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            4), // Optional: Rounded corners
                                      ),
                                      child: isChecked
                                          ? const Icon(
                                              Icons.check,
                                              size: 18,
                                              color: Color.fromRGBO(54, 40, 221,
                                                  1), // Check mark color
                                            )
                                          : null, // Empty if not checked
                                    ),
                                  ),
                                ),
                                SizedBox(width: 3),
                                Text(
                                  'Remember me',
                                  style: TextStyle(color: Colors.white),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 14),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Forgot1()),
                                      );
                                    },
                                    child: const Text(
                                      'Forgot Password',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 40),

                            // Additional Links (Sign Up and Forgot Password)
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Don't have an account?",
                                    style: TextStyle(
                                        color: Color.fromRGBO(54, 40, 221, 1)),
                                  ),
                                  const SizedBox(width: 5),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CreateAcc1()),
                                      );
                                    },
                                    child: const Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        // Login Button at the Bottom
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 40),
                          child: GestureDetector(
                            onTap: () {
                              _showSubmissionDialog();
                            },
                            child: Container(
                              width: screenSize.width * 0.9,
                              height: screenSize.height * 0.05,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(54, 40, 221, 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          if (showLoading)
            const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      [IconData? icon, bool isPassword = false]) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Container(
            width: screenSize.width * 0.9,
            height: screenSize.height * 0.05,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(54, 40, 221, 1),
                  spreadRadius: 2,
                ),
              ],
            ),
            child: TextField(
              controller: controller,
              obscureText: isPassword && !showPassword,
              decoration: InputDecoration(
                hintText: label,
                fillColor: Colors.white,
                prefixIcon: icon != null
                    ? Icon(icon, color: Colors.black, size: 20)
                    : null,
                suffixIcon: isPassword
                    ? IconButton(
                        icon: Icon(
                          showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
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
          ),
        ],
      ),
    );
  }
}
