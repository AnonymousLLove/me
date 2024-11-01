import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart'; // Import the file_picker package

class GetHelp extends StatefulWidget {
  const GetHelp({super.key});

  @override
  State<GetHelp> createState() => _GetHelpState();
}

class _GetHelpState extends State<GetHelp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  String? _attachedFileName; // Store the name of the attached file

  @override
  void dispose() {
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Image.asset(
                "images/ai.png",
              ),
            ),
            Container(width: 45),
            const Text(
              'Get help',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Email Text Field
              const Text(
                'Email',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0), // Space between label and text field
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress, // Set keyboard type to email
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._-]')), // Allow only valid email characters
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Enter your email',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF3628DD), width: 2.0), // Border color when enabled
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF3628DD), width: 2.0), // Border color when focused
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16.0), // Space between fields

              // Message Text Field
              const Text(
                'Message',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0), // Space between label and text field
              TextField(
                controller: _messageController,
                maxLines: 5, // Makes the message field taller
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Enter your message',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF3628DD), width: 2.0), // Border color when enabled
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF3628DD), width: 2.0), // Border color when focused
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10.0), // Space before attachment prompt

              // Attachment Prompt
              Row(
                children: [
                  Text(
                    _attachedFileName != null ? 'Attached: $_attachedFileName' : 'Attach a screenshot',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF3628DD)),
                  ),
                  const SizedBox(width: 3.0),
                  IconButton(
                    icon: const Icon(Icons.attach_file, color: Color(0xFF3628DD)),
                    onPressed: _attachFile, // Call the function to attach a file
                  ),
                ],
              ),
              const SizedBox(height: 50.0), // Space before button

              // Send Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Validate email before sending
                    if (_emailController.text.isEmpty || !_isValidEmail(_emailController.text)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please enter a valid email address.')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Message sent!')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3628DD),
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: const Text(
                    'Send',
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 20.0), // Space before the footer text

              // Footer Text with Clickable Links
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'By continuing you confirm that you are 18 or older and accept our ',
                      style: const TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Terms and Conditions',
                          style: const TextStyle(
                            color: Color(0xFF3628DD), // Link color
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Handle Terms and Conditions click
                              // print('Terms and Conditions clicked');
                              // Navigate to Terms and Conditions page or show dialog
                            },
                        ),
                        const TextSpan(
                          text: ' and ',
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: const TextStyle(
                            color: Color(0xFF3628DD), // Link color
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Handle Privacy Policy click
                              // print('Privacy Policy clicked');
                              // Navigate to Privacy Policy page or show dialog
                            },
                        ),
                        const TextSpan(
                          text: '.',
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

  // Function to validate the email
  bool _isValidEmail(String email) {
    final RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  // Function to attach a file
  Future<void> _attachFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.isNotEmpty) {
        // Check if the widget is still mounted before using BuildContext
        if (mounted) {
          setState(() {
            _attachedFileName = result.files.single.name; // Get the name of the attached file
          });
        }
      } else {
        // User canceled the picker
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No file selected.')),
          );
        }
      }
    } on PlatformException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.message}')),
        );
      }
    }
  }
}
