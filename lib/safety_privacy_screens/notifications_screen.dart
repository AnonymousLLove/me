import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int _selectedOption = -1; // Start with no selection

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
            const SizedBox(width: 25), // Use SizedBox for spacing
            const Text(
              'Notifications',
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
                'Messages',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: const Text(
                "Get updates about new messages",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              trailing: Radio(
                value: 0,
                groupValue: _selectedOption,
                onChanged: _onOptionSelected,
              ),
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFF3628DD),), // Reduced height
            ListTile(
              title: const Text(
                'Show online status',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: const Text(
                "Get updates about new matches",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              trailing: Radio(
                value: 1,
                groupValue: _selectedOption,
                onChanged: _onOptionSelected,
              ),
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFF3628DD),), // Reduced height
            ListTile(
              title: const Text(
                'Allow public search',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: const Text(
                "Liked you",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              trailing: Radio(
                value: 2,
                groupValue: _selectedOption,
                onChanged: _onOptionSelected,
              ),
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFF3628DD),), // Reduced height
            ListTile(
              title: const Text(
                'Profile visitors',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: const Text(
                "Get notified when people visit your profile",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              trailing: Radio(
                value: 3,
                groupValue: _selectedOption,
                onChanged: _onOptionSelected,
              ),
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFF3628DD),), // Reduced height
            ListTile(
              title: const Text(
                'Profile tips & freebies',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: const Text(
                "Get updates on profile tips & freebies",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              trailing: Radio(
                value: 4,
                groupValue: _selectedOption,
                onChanged: _onOptionSelected,
              ),
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFF3628DD),), // Reduced height
            ListTile(
              title: const Text(
                'Show ads',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: const Text(
                "Get updates on profile tips & freebies",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              trailing: Radio(
                value: 5,
                groupValue: _selectedOption,
                onChanged: _onOptionSelected,
              ),
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFF3628DD),), // Reduced height
            ListTile(
              title: const Text(
                'Get notified if your match is using incognito mode ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: const Text(
                "You must use incognito mode for this feature to work",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              trailing: Radio(
                value: 6,
                groupValue: _selectedOption,
                onChanged: _onOptionSelected,
              ),
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFF3628DD),), // Reduced height
            ListTile(
              title: const Text(
                'Left Swipes',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: const Text(
                "Get notified when you get a left swipe",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              trailing: Radio(
                value: 7,
                groupValue: _selectedOption,
                onChanged: _onOptionSelected,
              ),
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFF3628DD),), // Reduced height
          ],
        ),
      ),
    );
  }
}
