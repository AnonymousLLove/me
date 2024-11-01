import 'package:flutter/material.dart';

class IncognitoModeScreen extends StatefulWidget {
  const IncognitoModeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IncognitoModeScreenState createState() => _IncognitoModeScreenState();
}

class _IncognitoModeScreenState extends State<IncognitoModeScreen> {
  int _selectedOption = 0;

  void _onOptionSelected(int? value) {
    setState(() {
      _selectedOption = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Incognito Mode',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
            // Handle back button action here
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text(
                'Hide when you’re online',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: const Text(
                "People won't be able to see when you’re online. Available with Love Bird Premium.",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              trailing: Radio(
                value: 0,
                groupValue: _selectedOption,
                onChanged: _onOptionSelected,
              ),
            ),
            ListTile(
              title: const Text(
                'Browse profiles privately',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: const Text(
                "People won't be able to see when you’re online. Available with Love Bird Premium.",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              trailing: Radio(
                value: 1,
                groupValue: _selectedOption,
                onChanged: _onOptionSelected,
              ),
            ),
            ListTile(
              title: const Text(
                'Hide Love Bird Premium',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: const Text(
                "People won’t know that you’ve got Love Bird Premium. Available with Love Bird Premium.",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              trailing: Radio(
                value: 2,
                groupValue: _selectedOption,
                onChanged: _onOptionSelected,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
