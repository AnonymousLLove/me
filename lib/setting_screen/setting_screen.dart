import 'package:love_bird/setting_screen/about_screen.dart';
import 'package:love_bird/setting_screen/account_preference_screen.dart';
import 'package:love_bird/setting_screen/account_screen.dart';
import 'package:love_bird/setting_screen/basic_info_screen.dart';
import 'package:love_bird/setting_screen/blocked_users_screen.dart';
import 'package:love_bird/setting_screen/help_center_screen.dart';
import 'package:love_bird/setting_screen/reviews_screen.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _showGetStartedModal(BuildContext context, int modalIndex) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _GetStartedModal(modalIndex: modalIndex),
    );
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
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Image.asset("images/ai.png"),
            ),
            Container(width: 40),
            const Text(
              'Settings',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          const Divider(color: Color(0xFF3628DD)),
          ListTile(
            title: const Text(
              'Basic info',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle Basic info tap
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BasicInfoScreen()),
              );
            },
          ),
          const Divider(color: Color(0xFF3628DD)),
          ListTile(
            title: const Text(
              'Account',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: const Text('hailey1@ymail.com'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle Account tap
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountScreen()),
              );
            },
          ),
          const Divider(color: Color(0xFF3628DD)),
          ListTile(
            title: const Text(
              'Account Preferences',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle Account Preferences tap
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AccountPreferenceScreen()),
              );
            },
          ),
          const Divider(color: Color(0xFF3628DD)),
          ListTile(
            title: const Text(
              'Personalize your experience',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Show personalize modal sheet
              _showGetStartedModal(context, 0);
            },
          ),
          const Divider(color: Color(0xFF3628DD)),
          ListTile(
            title: const Text(
              'Help Center',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle Help Center tap
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HelpCenterScreen()),
              );
            },
          ),
          const Divider(color: Color(0xFF3628DD)),
          ListTile(
            title: const Text(
              'About',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle About tap
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutScreen()),
              );
            },
          ),
          const Divider(color: Color(0xFF3628DD)),
          ListTile(
            title: const Text(
              'Blocked Users',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle Blocked Users tap
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BlockedUsersScreen()),
              );
            },
          ),
          const Divider(color: Color(0xFF3628DD)),
          ListTile(
            title: const Text(
              'Reviews',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle Reviews tap
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReviewsScreen()),
              );
            },
          ),
          const Divider(color: Color(0xFF3628DD)),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Follow us on social media',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Image.asset("images/skill-icons_instagram.png"),
              ),
              const SizedBox(
                width: 25,
              ),
              Image.asset("images/logos_facebook.png"),
            ],
          ),
          const Divider(color: Color(0xFF3628DD)),
        ],
      ),
    );
  }
}

class _GetStartedModal extends StatefulWidget {
  final int modalIndex;

  const _GetStartedModal({required this.modalIndex});

  @override
  State<_GetStartedModal> createState() => _GetStartedModalState();
}

class _GetStartedModalState extends State<_GetStartedModal> {
  // Checkbox state for each modal
  late bool checkbox1;
  late bool checkbox2;

  // List of different image paths for each modal
  final List<String> modalImages = [
    'images/control your experience.png',
    'images/who can see your message.png',
    'images/who do you want to chat with.png',
    'images/When should we notify you.png',
    'images/Want to show when you’re online.png',
    'images/You’re all done!.png', // New image for the last modal
  ];

  // List of checkbox options for each modal
  final List<List<String>> checkboxOptions = [
    ['Everyone', 'People I’ve liked'],
    ['Everyone', 'People I’ve liked'],
    [
      'Everyone',
      'Verified People',
    ],
    [
      'Only Me',
      'My Connections',
    ],
    ['Yes', 'No'],
    [
      'Only Important Notifications',
      'All Notifications'
    ], // New options for the last modal
  ];

  @override
  void initState() {
    super.initState();
    checkbox1 = false;
    checkbox2 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Always show the back button but disable it for the first modal
                  GestureDetector(
                    onTap: widget.modalIndex > 0
                        ? () {
                            Navigator.pop(context);
                          }
                        : null, // Disable tap on the first modal
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: widget.modalIndex > 0
                          ? Colors.black
                          : Colors.grey, // Change color based on state
                    ),
                  ),
                  Image.asset(
                    modalImages[widget.modalIndex],
                    height: 150,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                widget.modalIndex == 0
                    ? 'Control your experience' // First modal specific text
                    : (widget.modalIndex < 5
                        ? 'Who can message you? ${widget.modalIndex}/4' // Display as (n/4) for modals 2 to 4
                        : 'You’re all done!'), // Last modal specific text
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 15),
              if (widget.modalIndex == 0)
                // Display the "Get started" button on the first modal sheet
                ElevatedButton(
                  onPressed: () {
                    // Show the next modal (modalIndex 1)
                    Navigator.pop(context); // Close current modal
                    _showGetStartedModal(context, 1); // Show second modal
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3628DD),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          30), // Adjust radius for curved edges
                    ),
                  ),
                  child: const Text(
                    'Get started',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              else if (widget.modalIndex < 5) // Modal from 2 to 4
                Column(
                  children: [
                    CheckboxListTile(
                      title: Text(checkboxOptions[widget.modalIndex][0]),
                      value: checkbox1,
                      onChanged: (bool? value) {
                        setState(() {
                          checkbox1 = value ?? false;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: Text(checkboxOptions[widget.modalIndex][1]),
                      value: checkbox2,
                      onChanged: (bool? value) {
                        setState(() {
                          checkbox2 = value ?? false;
                        });
                      },
                    ),
                    const Text(
                      'If everyone can message you, you’re more likely to get more matches.',
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            '(${widget.modalIndex}/4)'), // Show progress for modals 2 to 4
                        InkWell(
                          onTap: () {
                            // Show the next modal
                            _showGetStartedModal(
                                context, widget.modalIndex + 1);
                          },
                          child: const Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                  ],
                )
              else // Modal after (4/4)
                Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'You’re all done with setup!',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        // Add action for last modal
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3628DD),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              30), // Adjust radius for curved edges
                        ),
                      ),
                      child: const Text(
                        'Start Swiping',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _showGetStartedModal(BuildContext context, int modalIndex) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _GetStartedModal(modalIndex: modalIndex),
    );
  }
}
