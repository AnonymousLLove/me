import 'package:flutter/material.dart';
import 'package:love_bird/config/routes.dart';
import 'package:love_bird/providers/create_account_provider.dart';
import 'package:provider/provider.dart';

class CreateAcc1 extends StatefulWidget {
  const CreateAcc1({super.key});

  @override
  State<CreateAcc1> createState() => _CreateAcc1State();
}

class _CreateAcc1State extends State<CreateAcc1> {
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
    final userProvider = Provider.of<UserAccountProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal:
                MediaQuery.of(context).size.width * 0.02, // 5% of screen width
            vertical: MediaQuery.of(context).size.height *
                0.02, // 5% of screen height
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      'Create an account',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(width: 5),
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
                    _buildTextField(
                      'Email',
                      (value) => userProvider.updateEmail(value),
                      Icons.email,
                    ),
                    _buildTextField(
                      'Password',
                      (value) => userProvider.updatePassword(value),
                      Icons.lock,
                      true,
                    ),
                    _buildTextField(
                      'Profession',
                      (value) => userProvider.updateProfession(value),
                    ),
                    _buildTextField(
                      'Weight(kg)',
                      (value) => userProvider.updateWeight(value),
                    ),
                    _buildTextField(
                      'Height(cm)',
                      (value) => userProvider.updateHeight(value),
                    ),
                    _buildTextField(
                      'Country',
                      (value) => userProvider.updateCountry(value),
                    ),
                    _buildTextField(
                      'City',
                      (value) => userProvider.updateCity(value),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Education Level',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: double.infinity,
                            height: 50, // Set a suitable height
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
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
                    _buildTextField(
                      'Bio',
                      (value) => userProvider.updateBio(value),
                    ),
                  ]),
                ),
                const SizedBox(height: 10),
                // Checkbox and Privacy Text
                Row(
                  children: [
                    Checkbox(
                      value: userProvider.agreeToPolicy,
                      onChanged: userProvider.toggleAgreeToPolicy,
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
                    onTap: userProvider.agreeToPolicy
                        ? () {
                            if (_formKey.currentState!.validate()) {
                              userProvider.saveToDatabase();
                              Navigator.pushNamed(context, verifyEmailRoute);
                            }
                          }
                        : null,
                    child: Container(
                      width: screenSize.width * 0.8,
                      height: screenSize.height * 0.05,
                      decoration: BoxDecoration(
                        color: userProvider.agreeToPolicy
                            ? const Color.fromRGBO(54, 40, 221, 1)
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text('Sign Up',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Login Link
                // Inside CreateAcc1 class

                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, signUpRoute);
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
      ),
    );
  }

  Widget _buildTextField(
    String label,
    Function(String) onChanged, [
    IconData? icon,
    bool isPassword = false,
  ]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            onChanged: onChanged,
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
