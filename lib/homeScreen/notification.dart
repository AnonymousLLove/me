import 'package:flutter/material.dart';

import 'package:love_bird/chat/main_chat.dart';
import 'package:love_bird/config/routes.dart';
import 'package:love_bird/edit%20profile%20screens/edit_low_profile_screen.dart';

import 'package:love_bird/homeScreen/homescreen.dart';
import 'package:love_bird/matches/likes.dart';

import 'package:love_bird/matches/people_nearby.dart';

import 'package:love_bird/setting_screen/setting_screen.dart';
import 'package:love_bird/safety_privacy_screens/safety_screen.dart';

class NotificationItem extends StatelessWidget {
  final String assetImage;
  final String title;
  final String message;
  final String time;
  final VoidCallback onDelete;

  const NotificationItem({
    super.key,
    required this.assetImage,
    required this.title,
    required this.message,
    required this.time,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  assetImage,
                  width: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      message,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onDelete,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const Divider(thickness: 2, color: Colors.black),
        ],
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.05,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: Colors.black, size: 40),
                    onPressed: () {
                      Navigator.pop(context); // Navigate back
                    },
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, chatbotWelcomeScreen);
                    },
                    child: Image.asset('assets/images/robot.png'),
                  ),
                  const Spacer(), // Adds space before "Notifications" text
                  const Text('Notifications',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  const Spacer(),
                  const Spacer(), // Adds space after "Notifications" text
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  const Divider(thickness: 2, color: Colors.black),
                  const Text(
                    'Today',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  NotificationItem(
                    assetImage: 'assets/images/homeImage.png',
                    title: 'New Match Alert!',
                    message:
                        'You have got a new match waiting to connect with you. Start a conversation now.',
                    time: '10:00am',
                    onDelete: () {
                      // Handle delete action
                    },
                  ),
                  const Text(
                    'Yesterday',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  NotificationItem(
                    assetImage: 'assets/images/homeImage.png',
                    title: 'New Match Alert!',
                    message:
                        'You have got a new match waiting to connect with you. Start a conversation now.',
                    time: '10:00am',
                    onDelete: () {
                      // Handle delete action
                    },
                  ),
                  NotificationItem(
                    assetImage: 'assets/images/homeImage.png',
                    title: 'New Match Alert!',
                    message:
                        'You have got a new match waiting to connect with you. Start a conversation now.',
                    time: '10:00am',
                    onDelete: () {
                      // Handle delete action
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showPopup(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true, // Dismiss when tapped outside
    barrierLabel: 'Dismiss',
    // Add a background overlay
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation1, animation2) {
      return Align(
        alignment: Alignment.topRight, // Align the dialog to the right
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 20),
            child: Container(
              width: 200, // Set the width of your popup
              height: 335, // Set the height of your popup
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      showSharePopup(context);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.share),
                        SizedBox(width: 5),
                        Text('Share this profile',
                            style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15), // Space between items
                  InkWell(
                    onTap: () {
                      showBlockPopup(context);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.block),
                        SizedBox(width: 5),
                        Text('Block', style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15), // Space between items
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReportPage()),
                      );
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.report),
                        SizedBox(width: 5),
                        Text('Report', style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15), // Space between items
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DatingPicture()),
                      );
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.tips_and_updates),
                        SizedBox(width: 5),
                        Text('Dating Tips', style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15), // Space between items
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditLowProfileScreen()),
                      );
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.edit),
                        SizedBox(width: 5),
                        Text('Edit profile', style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15), // Space between items
                  InkWell(
                    onTap: () {},
                    child: const Row(
                      children: [
                        Icon(Icons.money),
                        SizedBox(width: 5),
                        Text('Plans', style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15), // Space between items
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SafetyScreen()),
                      );
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.safety_check),
                        SizedBox(width: 5),
                        Text('Safety', style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15), // Space between items
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsScreen()),
                      );
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.settings),
                        SizedBox(width: 5),
                        Text('Settings', style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, animation1, animation2, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0), // Slide in from the right
          end: const Offset(0, 0),
        ).animate(animation1),
        child: child,
      );
    },
  );
}

void showLibbyPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Padding(
          padding: const EdgeInsets.only(top: 40),
          child: AlertDialog(
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.height * 0.6,
              // Set the height to half of the screen
              child: Stack(
                children: [
                  // Top half with blue color
                  Positioned.fill(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1, // 1 part of the total height
                          child: Container(
                            height:
                                50, // Optional: You can remove this if using Expanded
                            color: const Color.fromRGBO(54, 40, 221, 1),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 30, left: 5, right: 5),
                              child: Column(
                                children: [
                                  Row(children: [
                                    const Text(
                                      "Hello there",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Image.asset('assets/images/wave.png'),
                                  ]),
                                  const Text(
                                    "I am Libby!",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Welcome to Love Bird AI Virtual Assistance.\n"
                                    "You can ask me anything on dating, relationship advice, event & activity suggestions, conversation advice, real life tips, etc.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1, // 1 part of the total height
                          child: Container(
                            height:
                                50, // Optional: You can remove this if using Expanded
                            color: Colors.white,
                            child: Column(children: [
                              const Spacer(),
                              Image.asset('assets/images/image2.png')
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Center black container
                  Center(
                    child: Container(
                        width: 200, // Width of the black container
                        height: 100, // Height of the black container
                        color: Colors.black,
                        child: Container(
                            color: const Color.fromRGBO(54, 40, 221, 1),
                            width: 100,
                            height: 70,
                            child: const Row(
                              children: [Text('Ask me Anything')],
                            ))),
                  ),
                ],
              ),
            ),
          ));
    },
  );
}

void showSharePopup(BuildContext context) {
  showGeneralDialog(
      context: context,
      barrierDismissible: true, // Dismiss when tapped outside
      barrierLabel: 'Dismiss',
      // barrierColor: Colors.black54, // Add a background overlay
      pageBuilder: (context, animation1, animation2) {
        return Align(
            alignment: Alignment.bottomCenter, // Align the dialog to the bottom
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Material(
                    color: Colors
                        .transparent, // Transparent to show rounded corners
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color
                        borderRadius:
                            BorderRadius.circular(20), // Circular borders
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // Changes position of shadow
                          ),
                        ],
                      ),
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: SingleChildScrollView(
                        // Add scroll view
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Share this profile',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),

                            // Recent People Section
                            const Row(
                              children: [
                                Text(
                                  'Recent People',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(width: 3),
                                Expanded(
                                  child: Divider(
                                      thickness: 2,
                                      color:
                                          Colors.black), // The line in the Row
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  _buildProfileAvatar(
                                    'John',
                                    'Powell',
                                    'assets/images/homeImage.png',
                                  ),
                                  _buildProfileAvatar(
                                    'Peter',
                                    'Mark',
                                    'assets/images/homeImage.png',
                                  ),
                                  _buildProfileAvatar(
                                    'Billy',
                                    'Born',
                                    'assets/images/homeImage.png',
                                  ),
                                  _buildProfileAvatar(
                                    'Richard',
                                    'Apple',
                                    'assets/images/homeImage.png',
                                  ),
                                  _buildProfileAvatar(
                                    'Leo',
                                    'Wizzer',
                                    'assets/images/homeImage.png',
                                  ),
                                  _buildProfileAvatar(
                                    'Eden',
                                    'Porter',
                                    'assets/images/homeImage.png',
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 20),

                            // Social Media Icons Section
                            const Row(
                              children: [
                                Text(
                                  'Social Media',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(width: 3),
                                Expanded(
                                  child: Divider(
                                      thickness: 1, color: Colors.black),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  _buildSocialMediaIcon(
                                      'assets/images/icons/whatsapp.png'),
                                  _buildSocialMediaIcon(
                                      'assets/images/icons/facebook.png'),
                                  _buildSocialMediaIcon(
                                      'assets/images/icons/instagram.png'),
                                  _buildSocialMediaIcon(
                                      'assets/images/icons/x.png'),
                                  _buildSocialMediaIcon(
                                      'assets/images/icons/tiktok.png'),
                                  _buildSocialMediaIcon(
                                      'assets/images/icons/telegram.png'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))));
      });
}

void showSharePopupp(BuildContext context) {
  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height *
              0.4, // Adjust height as needed
          child: SingleChildScrollView(
            // Add scroll view
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Share this profile',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                // Recent People Section
                const Row(
                  children: [
                    Text(
                      'Recent People',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(width: 3),
                    Expanded(
                      child: Divider(
                          thickness: 2,
                          color: Colors.black), // The line in the Row
                    ),
                  ],
                ),

                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildProfileAvatar(
                        'John',
                        'Powell',
                        'assets/images/homeImage.png',
                      ),
                      _buildProfileAvatar(
                        'Peter',
                        'Mark',
                        'assets/images/homeImage.png',
                      ),
                      _buildProfileAvatar(
                        'Billy',
                        'Born',
                        'assets/images/homeImage.png',
                      ),
                      _buildProfileAvatar(
                        'Richard',
                        'Apple',
                        'assets/images/homeImage.png',
                      ),
                      _buildProfileAvatar(
                        'Leo',
                        'Wizzer',
                        'assets/images/homeImage.png',
                      ),
                      _buildProfileAvatar(
                        'Eden',
                        'Porter',
                        'assets/images/homeImage.png',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Social Media Icons Section
                const Row(
                  children: [
                    Text(
                      'Social Media',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(width: 3),
                    Expanded(
                      child: Divider(thickness: 1, color: Colors.black),
                    ),
                  ],
                ),

                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildSocialMediaIcon('assets/images/icons/whatsapp.png'),
                      _buildSocialMediaIcon(
                          'assets/images/icons/facebook-48.png'),
                      _buildSocialMediaIcon(
                          'assets/images/icons/instagram.png'),
                      _buildSocialMediaIcon(
                          'assets/images/icons/icons8-x-50.png'),
                      _buildSocialMediaIcon('assets/images/icons/tiktok.png'),
                      _buildSocialMediaIcon(
                          'assets/images/icons/icons8-telegram-logo-94.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

Widget _buildProfileAvatar(String name, String lname, String i) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(10),
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[300],
          child: ClipOval(
            child: Image.asset(
              i,
              fit: BoxFit.cover,
              width: 60,
              height: 60,
            ),
          ),
        ),
      ),
      const SizedBox(height: 10),
      Text(
        name,
        style: const TextStyle(fontSize: 14),
      ),
      Text(
        lname,
        style: const TextStyle(fontSize: 14),
      )
    ],
  );
}

Widget _buildSocialMediaIcon(String social) {
  return Padding(
      padding: const EdgeInsets.all(10),
      child: Image.asset(
        social,
        // fit: BoxFit.cover,
        width: 60,
        height: 60,
      ));
}

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  String? _selectedReason;

  @override
  Widget build(BuildContext context) {
    const Color blue = Color.fromRGBO(54, 40, 221, 1.0);
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: const Text(
          'Report Mark',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true, // Center the title text
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 16, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [],
              ),

              const Divider(thickness: 1, color: Colors.black),
              const Text(
                'Why did you report this user?',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              // List of report reasons
              _buildRadioButton('Harassment'),
              _buildRadioButton('Inappropriate Content'),
              _buildRadioButton('Violation of Terms'),
              _buildRadioButton('Offensive Language'),
              _buildRadioButton('Disrespectful Behaviour'),
              _buildRadioButton('Threats'),
              _buildRadioButton('Catfishing'),
              _buildRadioButton('Unwanted Advances'),
              _buildRadioButton('Unsolicited Explicit Content'),
              _buildRadioButton('Privacy Concerns'),
              _buildRadioButton('Other'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple[100],
                    ),
                    onPressed: () {},
                    child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text('Cancel',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16))),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blue,
                      ),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text('Send Report',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build each radio button option
  Widget _buildRadioButton(String reason) {
    const Color blue = Color.fromRGBO(54, 40, 221, 1.0);
    return RadioListTile<String>(
      title: Text(reason),
      value: reason,
      groupValue: _selectedReason,
      activeColor: blue,
      onChanged: (String? value) {
        setState(() {
          _selectedReason = value;
        });
      },
    );
  }
}

void verify(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true, // Dismiss when tapped outside
    barrierLabel: 'Dismiss',
    barrierColor: Colors.transparent,
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation1, animation2) {
      return Align(
        alignment: Alignment.topRight,
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 20),
            child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Image.asset('assets/images/icons/verblue.png',
                        width: 30, height: 30),
                    const Text('Daniel is Photo Verified',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15))
                  ],
                )),
          ),
        ),
      );
    },
    transitionBuilder: (context, animation1, animation2, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0), // Slide in from the right
          end: const Offset(0, 0),
        ).animate(animation1),
        child: child,
      );
    },
  );
}

void showBlockPopup(BuildContext context) {
  const Color blue = Color.fromRGBO(54, 40, 221, 1.0);
  showGeneralDialog(
    context: context,
    barrierDismissible: true, // Dismiss when tapped outside
    barrierLabel: 'Dismiss',
    barrierColor: Colors.black54, // Add a background overlay
    pageBuilder: (context, animation1, animation2) {
      return Align(
        alignment: Alignment.bottomCenter, // Align the dialog to the bottom
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Material(
            color: Colors.transparent, // Transparent to show rounded corners
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Background color
                borderRadius: BorderRadius.circular(20), // Circular borders
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // Changes position of shadow
                  ),
                ],
              ),
              padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.9,
              child: SingleChildScrollView(
                // Add scroll view
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 2),
                    const Text(
                      'Block Mark?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Divider(thickness: 1, color: Colors.black),
                    const SizedBox(height: 12),
                    const Row(children: [
                      Icon(Icons.person_remove),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          'They will not be able to find your profile or send you messages.',
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),
                      ),
                    ]),
                    const SizedBox(height: 12),
                    const Row(children: [
                      Icon(Icons.notifications_none),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          'They will not be notified if you block them.',
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),
                      ),
                    ]),
                    const SizedBox(height: 12),
                    const Row(children: [
                      Icon(Icons.settings),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          'You can unblock them anytime in Settings.',
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),
                      ),
                    ]),
                    const SizedBox(height: 20),
                    // Wrap the buttons with SingleChildScrollView
                    Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize
                              .min, // Use min size to prevent Row from taking full width
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context); // Close the dialog
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(149, 140, 250, 1),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                ),
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context); // Perform action
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      blue, // Assuming 'blue' is defined
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                ),
                                child: const Text(
                                  'Yes, Block',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

class DatingPicture extends StatefulWidget {
  const DatingPicture({super.key});

  @override
  _DatingPictureState createState() => _DatingPictureState();
}

class _DatingPictureState extends State<DatingPicture> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color blue = const Color.fromRGBO(54, 40, 221, 1.0);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 40),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, chatbotWelcomeScreen); // Call the popup function
              },
              child: Image.asset('assets/images/robot.png', width: 40),
            ),
            const SizedBox(width: 30), // Add some spacing
            Text(
              'Dating Tips',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: blue,
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: [
          // First page (image with Dating Tips)
          Column(
            children: [
              // Middle Image Section
              Expanded(
                child: Stack(
                  children: [
                    // Main image aligned to the left
                    Positioned(
                      left: 0, // Positioning to the left side
                      //top: screenHeight * 0.05, // Position from the top
                      child: Image.asset(
                        'assets/images/date.png',
                        height: screenHeight * 0.75, // Adjust height
                        fit: BoxFit.fill,
                      ),
                    ),

                    // Text and Arrow near the image
                    Positioned(
                      top: 110, // Position from the top of the screen
                      right: 20, // Position from the right
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset(
                            'assets/images/textdate.png',
                            fit: BoxFit.contain,
                            // Make it responsive
                          ),
                          GestureDetector(
                            onTap: () {
                              // Handle arrow click action
                            },
                            child: Image.asset(
                              'assets/images/arrowdate.png',
                              width: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Page indicators
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PageIndicator(isActive: _currentPage == 0),
                    const SizedBox(width: 10),
                    PageIndicator(isActive: _currentPage == 1),
                  ],
                ),
              ),
            ],
          ),

          // Second page
          const DatingTipsPage(),
        ],
      ),
      // Bottom page indicators
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 12.0, right: 12, top: 12, bottom: 22),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(50),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: BottomNavigationBar(
              backgroundColor: Colors.grey[200],
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icons/home.png', width: 30),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icons/localcon.png',
                      width: 30),
                  label: 'Location',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icons/chatIcon.png',
                      width: 30),
                  label: 'Chats',
                ),
                BottomNavigationBarItem(
                  icon:
                      Image.asset('assets/images/icons/matches.png', width: 30),
                  label: 'Matches',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icons/blueProfile.png',
                      width: 30),
                  label: 'Profile',
                ),
              ],
              onTap: (index) {
                // Handle navigation based on the index
                switch (index) {
                  case 0:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                    break;
                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PeopleNearbyPage()),
                    );

                    break;
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Mainchat()),
                    );

                    break;
                  case 3:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Likes()),
                    );
                    break;
                  case 4:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditLowProfileScreen()),
                    );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

// Custom widget for page indicator
class PageIndicator extends StatelessWidget {
  final bool isActive;

  const PageIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? const Color.fromRGBO(54, 40, 221, 1.0) : Colors.grey,
      ),
    );
  }
}

class DatingTipsPage extends StatefulWidget {
  const DatingTipsPage({super.key});

  @override
  State<DatingTipsPage> createState() => _DatingTipsPageState();
}

class _DatingTipsPageState extends State<DatingTipsPage> {
  @override
  Widget build(BuildContext context) {
    final List<String> datingBlue = [
      """The questions are:,\n
 1. What side of me did they bring out?\n
 2. How did my body feel during the date? Stiff, relaxed, or somewhere in between?\n
 3. Do I feel more energized or de-energized than I did before the date?\n
 4. Is there something about them that I'm curious about?\n
 5. Did they make me laugh?\n
 6. Did I feel heard?\n
 7. Did I feel attractive in their presence?\n
 8. Did I feel captivated, bored, or something in between?"""
    ];
    final List<String> datingTips2 = [
      "By the third date, be sure to ask about family and deal breakers.",
      "Always give yourself grace.",
    ];
    final List<String> datingTips = [
      "Before you start swiping, get into a playful mood.",
      "Use dates as an opportunity to connect with someone, no strings attached.",
      "Don't rely on only one form of dating to try to meet someone.",
      "Take it slow; plan but not too fast.",
      "Prioritize your dating life as much as your work life.",
      "Expect challenges and have support ready for when things get tough.",
      "Use dates as an opportunity to connect with someone, no strings attached.",
      "Do a chemistry test before meeting someone from an app.",
      "Have only one expectation on a first date: to enjoy yourself.",
      "Don’t allow your phone to become the third wheel on your date.",
      "Focus on quality over quantity",
      "Suggest plans if you want to keep in touch.",
      "When using dating apps, reference a match's profile to keep the cnversation flowing.",
      "To start the conversation, give a compliment or ask for advice.",
      "Always ask a match, 'What keeps you busy?'",
      "Get curious about a match's differences instead of writing them off.",
      "On the first date, ask about your date's career and relationships.",
      "If you're enjoying the date, end it with an 'accidental touch.'",
      "After a first date, ask yourself 8 questions to decide if you could be compatible for the long term.",
    ];
    Color blue = const Color.fromRGBO(54, 40, 221, 1.0);
    // final screenHeight = MediaQuery.of(context).size.height;
    //  final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Divider(thickness: 2, color: blue),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ListView.builder(
                      physics:
                          const NeverScrollableScrollPhysics(), // Prevent inner scroll
                      shrinkWrap:
                          true, // Makes ListView take only necessary space
                      itemCount: datingTips.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading:
                              Image.asset('assets/images/icons/loveTips.png'),
                          title: Text(
                            datingTips[index],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: ListView.builder(
                      physics:
                          const NeverScrollableScrollPhysics(), // Prevent inner scroll
                      shrinkWrap:
                          true, // Makes ListView take only necessary space
                      itemCount: datingBlue.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            datingBlue[index],
                            style:
                                TextStyle(fontSize: 16, color: blue, height: 1),
                          ),
                        );
                      },
                    ),
                  ),
                  ListView.builder(
                    physics:
                        const NeverScrollableScrollPhysics(), // Prevent inner scroll
                    shrinkWrap:
                        true, // Makes ListView take only necessary space
                    itemCount: datingTips2.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading:
                            Icon(Icons.favorite_border_outlined, color: blue),
                        title: Text(
                          datingTips2[index],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
