import 'package:flutter/material.dart';

import 'package:love_bird/createAccount/verify.dart';
import 'package:love_bird/sign/sign.dart';

class CreateAcc1 extends StatefulWidget {
  const CreateAcc1({super.key});

  @override
  State<CreateAcc1> createState() => _CreateAcc1State();
}

class _CreateAcc1State extends State<CreateAcc1> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController educationController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  String? selectedLevel;

  final List<String> educationLevels = [
    'None',
    'Primary Education',
    'Secondary Education',
    'Higher Education',
    'Vocational Training',
    'Postgraduate Education',
  ];

  final _formKey = GlobalKey<FormState>();
  bool agreeToPolicy = false;
  bool showPassword = false; // For toggling password visibility

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Create an account',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  Icon(Icons.person,
                      size: 40, color: Color.fromRGBO(54, 40, 221, 1.0)),
                  // Image.asset('assets/images/woman.png'),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                "Create your account in seconds, we'll help you find your perfect match",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(children: [
                  _buildTextField('Email', emailController, Icons.email),
                  _buildTextField(
                      'Password', passwordController, Icons.lock, true),
                  _buildTextField('Profession', professionController),
                  _buildTextField('Weight(kg)', weightController),
                  _buildTextField('Height(cm)', heightController),
                  _buildTextField('Country', countryController),
                  _buildTextField('City', cityController),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Education Level',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          height: 50, // Set a suitable height
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(54, 40, 221, 0.1),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: DropdownButton<String>(
                            value: selectedLevel,
                            // hint: Text('Select Education Level'),
                            isExpanded:
                                true, // Makes the dropdown take full width
                            items: educationLevels.map((String level) {
                              return DropdownMenuItem<String>(
                                value: level,
                                child: Text(level),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedLevel = newValue;
                              });
                            },
                            underline: Container(), // Removes the underline
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildTextField('Bio', bioController),
                ]),
              ),
              const SizedBox(height: 10),
              // Checkbox and Privacy Text
              Row(
                children: [
                  Checkbox(
                    value: agreeToPolicy,
                    onChanged: (bool? newValue) {
                      setState(() {
                        agreeToPolicy = newValue ?? false;
                      });
                    },
                  ),
                  const Text("I agree to Love Bird "),
                  GestureDetector(
                    onTap: () {
                      // Handle Privacy Policy click
                    },
                    child: const Text(
                      'Privacy Policy',
                      style: TextStyle(
                        color: Color.fromRGBO(54, 40, 221, 1),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Sign Up Button
              Center(
                child: GestureDetector(
                  onTap: agreeToPolicy
                      ? () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EmailVerificationPage()),
                          );
                        }
                      : null,
                  child: Container(
                    width: screenSize.width * 0.8,
                    height: screenSize.height * 0.05,
                    decoration: BoxDecoration(
                      color: agreeToPolicy
                          ? const Color.fromRGBO(54, 40, 221, 1)
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text('Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Login Link
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                    );
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Already have an account? ",
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            color: Color.fromRGBO(54, 40, 221, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
              hintText: label == 'Bio' ? 'Eg: Fun and Interesing' : null,
            ),
          ),
        ],
      ),
    );
  }
}
