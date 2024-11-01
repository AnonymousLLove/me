import 'package:flutter/material.dart';

class InstantlyTranslateOtherLanguageToEnglishScreen extends StatefulWidget {
  const InstantlyTranslateOtherLanguageToEnglishScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InstantlyTranslateOtherLanguageToEnglishScreenState createState() => _InstantlyTranslateOtherLanguageToEnglishScreenState();
}

class _InstantlyTranslateOtherLanguageToEnglishScreenState extends State<InstantlyTranslateOtherLanguageToEnglishScreen> {
  bool marketingPermission = false;

  int _selectedOption = 0;

  void _onOptionSelected(int? value) {
    setState(() {
      _selectedOption = value!;
    });
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
        title: const Text('Instantly translate other languages to English'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
                "images/ai.png",
              ),
          ),
        ],
      
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text(
                'Translate other languages to English',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: const Text(
                "Turn on to read messages in various languages in English ",
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
                'Don’t translate other languages to English',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              // subtitle: const Text(
              //   "Turn on if you want to get notified when a picture with sexual organ content has been sent",
              //   style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              // ),
              trailing: Radio(
                value: 1,
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
