import 'package:flutter/material.dart';

class IncognitoModeOnSettingScreen extends StatefulWidget {
  const IncognitoModeOnSettingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IncognitoModeOnSettingScreenState createState() => _IncognitoModeOnSettingScreenState();
}

class _IncognitoModeOnSettingScreenState extends State<IncognitoModeOnSettingScreen> {
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
        title: Row(
          children: [
            Image.asset(
              "images/ai.png",
            ),
            const SizedBox(width: 25),
            const Text(
              'Incognito Mode',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'People Nearby',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 4, // Set this based on the selected tab
        selectedItemColor: Colors.purple,
        onTap: (index) {
          // Handle navigation tap
        },
      ),
    );
  }
}