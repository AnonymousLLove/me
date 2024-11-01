import 'package:flutter/material.dart';

class PrivacyPreferenceScreen extends StatefulWidget {
  const PrivacyPreferenceScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PrivacyPreferenceScreenState createState() =>
      _PrivacyPreferenceScreenState();
}

class _PrivacyPreferenceScreenState extends State<PrivacyPreferenceScreen> {
  bool marketingPermission1 = false;
  bool marketingPermission2 = false;
  bool marketingPermission3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Privacy Preference',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Handle Save action here
            },
            child: const Text(
              'Save',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF3628DD),
              ),
            ),
          )
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
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
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Image.asset(
                "images/privacypreference.png",
              ),
            ),
            const Text(
              'We and our partners use tracking tools to store and process your data for the purposes below.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            const Text(
              'You can also find the list of tools that are strictly necessary for the app to function, as well as the list of partners that place tools on our behalf. You can change these preferences at any time.',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildPermissionTile(
                      'Marketing permissions', marketingPermission1, (value) {
                    setState(() {
                      marketingPermission1 = value;
                    });
                  }),
                  _buildPermissionTile(
                      'Marketing permissions', marketingPermission2, (value) {
                    setState(() {
                      marketingPermission2 = value;
                    });
                  }),
                  _buildPermissionTile(
                      'Marketing permissions', marketingPermission3, (value) {
                    setState(() {
                      marketingPermission3 = value;
                    });
                  }),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle Accept All action here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3628DD),
                    ),
                    child: const Text(
                      'Accept All',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle Accept All action here
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF958CFA), // Text color
                      side: const BorderSide(
                          color: Color(0xFF3628DD),
                          width: 1), // Border color and width
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20.0), // Rounded corners
                      ),
                    ),
                    child: const Text(
                      'Reject All',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
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
        currentIndex: 4,
        selectedItemColor: const Color(0xFF3628DD),
        onTap: (index) {
          // Handle navigation tap
        },
      ),
    );
  }

  Widget _buildPermissionTile(
      String title, bool value, ValueChanged<bool> onChanged) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: const Color(0xFF3628DD),
        ),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(title,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
            subtitle: const Text(
              'These trackers let us and our marketing partners improve marketing campaigns on other apps and websites.',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
            ),
            trailing: Transform.scale(
              scale: 0.65,
              child: Switch(
                value: value,
                onChanged: onChanged,
                activeColor: const Color(
                    0xFF3628DD), // Color of the switch when it is ON
                activeTrackColor:
                    Colors.white, // Color of the track when switch is ON
                inactiveThumbColor: const Color(
                    0xFF3628DD), // Color of the thumb when switch is OFF
                inactiveTrackColor:
                    Colors.grey[200], // Color of the track when switch is OFF
              ),
            ),
          ),
          const Divider(color: Color(0xFF3628DD)), // Add a Divider here
        ],
      ),
    );
  }
}
