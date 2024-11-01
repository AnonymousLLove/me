import 'package:love_bird/edit%20profile%20screens/more_about_you_screen.dart';
import 'package:flutter/material.dart';

class UploadScreenTwo extends StatefulWidget {
  const UploadScreenTwo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UploadScreenTwoState createState() => _UploadScreenTwoState();
}

class _UploadScreenTwoState extends State<UploadScreenTwo> {
  String? _selectedLocation;
  String? _selectedGender;
  String? _selectedReason;
  final TextEditingController _bioController = TextEditingController();
  int _bioLength = 0;

  final List<String> _locations = ['Location 1', 'Location 2', 'Location 3'];
  final List<String> _genders = ['Male', 'Female'];
  final List<String> _reasons = [
    'Open to chat',
    'Casual',
    'Here to date',
    'Ready for a relationship'
  ];

  @override
  void initState() {
    super.initState();
    _bioController.addListener(() {
      setState(() {
        _bioLength = _bioController.text.length;
      });
    });
  }

  @override
  void dispose() {
    _bioController.dispose(); // Dispose of the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [],
              ),
            ),
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
                          0.75, // Set width to represent progress
                      color: const Color(0xFF3628DD), // Progress color
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Form Fields
            _buildTextField("Weight (kg)"),
            _buildTextField("Profession", isPassword: true),
            _buildDropdownField("Location", _locations, _selectedLocation,
                (newValue) {
              setState(() {
                _selectedLocation = newValue;
              });
            }),
            _buildTextField(
              "University",
            ),
            _buildDropdownField("Gender", _genders, _selectedGender,
                (newValue) {
              setState(() {
                _selectedGender = newValue;
              });
            }),
            _buildTextField(
              "Birthday",
            ),
            _buildTextField(
              "Phone Number",
            ),
            _buildDropdownField("Why you’re here", _reasons, _selectedReason,
                (newValue) {
              setState(() {
                _selectedReason = newValue;
              });
            }),
            _buildBioField(), // Updated bio field

            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle the button press
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MoreAboutYouScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3628DD),
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text(
                    'Save and Continue',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 35,
        child: TextField(
          textCapitalization: TextCapitalization.sentences,
          // obscureText: isPassword,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: const Color(0xFF3628DD).withOpacity(0.19),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label, List<String> items,
      String? selectedValue, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color(0xFF3628DD).withOpacity(0.19),
        ),
        value: selectedValue,
        onChanged: onChanged,
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        isExpanded: true,
      ),
    );
  }

  Widget _buildBioField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _bioController,
            maxLength: 400,
            maxLines: 3,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              labelText: "Bio",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: const Color(0xFF3628DD).withOpacity(0.19),
            ),
          ),
          const SizedBox(height: 8.0),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '$_bioLength/400',
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
