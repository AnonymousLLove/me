import 'package:flutter/material.dart';
import 'package:love_bird/chat/chatScreen.dart';
import 'package:love_bird/chat/mainChat.dart';
import 'package:love_bird/edit%20profile%20screens/edit_low_profile_screen.dart';

import 'package:love_bird/homeScreen/homeScreen2.dart';
import 'package:love_bird/matches/likes.dart';
import 'package:love_bird/matches/peopleNearby.dart';

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
                      showLibbyChatbot(
                          context); // Call the separate function to show the popup
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

class PurchaseCreditsPage extends StatelessWidget {
  const PurchaseCreditsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color blue = Color.fromRGBO(54, 40, 221, 1.0);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0, right: 16, left: 16),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back,
                      color: Colors.black, size: 40),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DatingProfilePage()),
                    );
                  },
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    // Call the separate function to show the popup
                    showLibbyChatbot(context);
                  },
                  child: Image.asset(
                    'assets/images/robot.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),

            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Get more messages, matches, and get to the top at one click!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: blue),
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView(
                children: const [
                  // First Row (50 credits, N500.00)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CreditOption(
                        credits: '50 credits',
                        price: 'N500.00',
                        description: 'Send up to 15 messages',
                      ),
                      Spacer(),
                      CreditOption(
                        credits: '150 credits',
                        price: 'N1,100',
                        description:
                            'Send up to 25 messages, and get more chances to be matched instantly',
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  // Second Row (200 credits, N1600)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CreditOption(
                        credits: '200 credits',
                        price: 'N1,600',
                        description:
                            'Send up to 30 messages, get more chances to be matched instantly, and appear at the top on people nearby',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Buttons at the bottom
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle continue action
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: blue // Background color
                      ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DatingProfilePage()),
                    ); // Handle close action
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor:
                        Colors.deepPurple.shade100, // Background color
                  ),
                  child: const Text(
                    'Close',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CreditOption extends StatelessWidget {
  final String credits;
  final String price;
  final String description;

  const CreditOption({
    super.key,
    required this.credits,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    const Color blue = Color.fromRGBO(54, 40, 221, 1.0);
    return Stack(
      clipBehavior: Clip.none, // Allow overflow
      alignment:
          Alignment.topCenter, // Aligns the "200 credits" to the top center
      children: [
        // Main container for N1,600, description, etc.
        Container(
          width: 140,
          height: 150,
          padding: const EdgeInsets.only(top: 40, bottom: 20),
          decoration: BoxDecoration(
            border: Border.all(
              color: blue, // Your color
              width: 2.0, // Adjust this value to make the border thicker
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //  SizedBox(height: 20), // Spacer for the stacked "200 credits"
              Text(
                price,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromRGBO(149, 140, 250, 1),
                  fontSize: 8,
                ),
              ),
            ],
          ),
        ),

        // Stacked "200 credits" container
        Positioned(
          top: -10, // This aligns the container to sit on the border
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: blue,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(
              credits,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // appBar: AppBar(
      //   leading: Row(
      //     children: [
      //       IconButton(
      //         icon: const Icon(Icons.arrow_back, color: Colors.black, size: 10),
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       GestureDetector(
      //         onTap: () {
      //           showLibbyChatbot(context); // Call the popup function
      //         },
      //         child: Image.asset('assets/images/robot.png', width: 0),
      //       ),
      //     ],
      //   ),
      //   title: const Text(
      //     'Profile',
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 20,
      //     ),
      //   ),
      //   centerTitle: true,
      //   actions: [
      //     Padding(
      //       padding: EdgeInsets.only(top: 5),
      //       child: IconButton(
      //         icon: Image.asset('assets/images/icons/verblue.png',
      //             width: 30, height: 30),
      //         onPressed: () {
      //           verify(context);
      //         },
      //       ),
      //     ),
      //     const SizedBox(width: 4),
      //     IconButton(
      //       icon: Image.asset('assets/images/message.png', width: 30),
      //       onPressed: () {
      //         showExtraViewsPopup(context); // Show extra views popup
      //       },
      //     ),
      //     IconButton(
      //       icon: const Icon(Icons.more_vert, color: Colors.black, size: 30),
      //       onPressed: () {
      //         _showPopup(context);
      //       },
      //     ),
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.01,
              ), // Responsive vertical padding
              // horizontal: screenWidth * 0.001),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: Colors.black, size: 40),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      showLibbyChatbot(
                          context); // Call the separate function to show the popup
                    },
                    child: Image.asset('assets/images/robot.png', width: 40),
                  ),
                  const Expanded(
                    child: Center(
                        child: Text(
                      'Profile',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                      textAlign: TextAlign.center,
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: IconButton(
                      icon: Image.asset('assets/images/icons/verblue.png',
                          width: 30, height: 30),
                      onPressed: () {
                        verify(context);
                      },
                    ),
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    icon: Image.asset('assets/images/message.png', width: 30),
                    onPressed: () {
                      showExtraViewsPopup(context); // Show extra views popup
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert,
                        color: Colors.black, size: 30),
                    onPressed: () {
                      _showPopup(context);
                    },
                  ),
                ],
              ),
            ),
            Stack(
              alignment: Alignment
                  .bottomRight, // Aligns child widgets to the bottom right
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    'assets/images/homeImage.png', // Path to the main image
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20, // Distance from the bottom
                  right: 20,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChatDetailScreen(
                            name: 'Daniel',
                            profileImage: 'assets/images/homeImage.png',
                            isOnline: true,
                            lastMessage: 'Hello',
                          ),
                        ),
                      );
                    },
                    child: Image.asset('assets/images/icons/messageicon.png'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20.0),
            // Wrap the following content in a SingleChildScrollView
            const Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Daniel, 31',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Bio',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16.0),
                      Row(children: [
                        const ProfileDetail(
                          icon: Icons.man,
                          title: "Man",
                        ),
                        Spacer(),
                        Text('Fun and Interesting',
                            style: TextStyle(fontSize: 16))
                      ]),

                      const ProfileDetail(
                        icon: Icons.rule_sharp,
                        title: "145cm 65kg",
                      ),
                      ProfileDetail(
                        icon: Icons.work,
                        title: "Banker at Citi Bank",
                      ),
                      const ProfileDetail(
                        icon: Icons.school,
                        title: "University of Leeds, UK",
                      ),
                      const ProfileDetail(
                        icon: Icons.home,
                        title: "Lives in New London",
                      ),
                      const ProfileDetail(
                        icon: Icons.location_on,
                        title: "25km away",
                      ),
                      const SizedBox(height: 20.0),
                      // Relationship basics
                      const Text(
                        'My relationship Basics',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const RelationshipOption(
                        title: 'Friendship',
                        icon: Icons.people,
                        color: Colors.pinkAccent,
                      ),
                      const SizedBox(height: 20),
                      // Interests
                      const Text(
                        'Interests',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Wrap(
                        spacing: 10,
                        children: [
                          InterestOption(
                            title: 'Cooking',
                            icon: Icons.restaurant_menu,
                            color: Colors.orange,
                          ),
                          InterestOption(
                            title: 'Hiking',
                            icon: Icons.hiking,
                            color: Colors.green,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Location',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'London,Uk',
                        style: TextStyle(
                          fontSize: 14,
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
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 12.0, right: 12, top: 12, bottom: 22),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(50),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: BottomNavigationBar(
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
                          builder: (context) => DatingProfilePage()),
                    );
                    break;
                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PeopleNearbyPage()),
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

class ProfileDetail extends StatelessWidget {
  final IconData icon;
  final String title;

  const ProfileDetail({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class RelationshipOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const RelationshipOption({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          Icon(icon, color: color),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}

class InterestOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const InterestOption({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          Icon(icon, color: color),
          const SizedBox(width: 10),
        ],
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
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (context, animation1, animation2) {
      return Align(
        alignment: Alignment.topRight, // Align the dialog to the right
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 90, horizontal: 20),
            child: Container(
              width: 200, // Set the width of your popup
              height: 335, // Set the height of your popup
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      showSharePopup(context);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.share),
                        SizedBox(width: 5),
                        Text('Share this profile',
                            style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                  SizedBox(height: 15), // Space between items
                  InkWell(
                    onTap: () {
                      showBlockPopup(context);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.block),
                        SizedBox(width: 5),
                        Text('Block', style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                  SizedBox(height: 15), // Space between items
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReportPage()),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.report),
                        SizedBox(width: 5),
                        Text('Report', style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                  SizedBox(height: 15), // Space between items
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DatingPicture()),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.tips_and_updates),
                        SizedBox(width: 5),
                        Text('Dating Tips', style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                  SizedBox(height: 15), // Space between items
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditLowProfileScreen()),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.edit),
                        SizedBox(width: 5),
                        Text('Edit profile', style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                  SizedBox(height: 15), // Space between items
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(Icons.money),
                        SizedBox(width: 5),
                        Text('Plans', style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                  SizedBox(height: 15), // Space between items
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SafetyScreen()),
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
                    child: Row(
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
          begin: Offset(1, 0), // Slide in from the right
          end: Offset(0, 0),
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
          padding: EdgeInsets.all(16),
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
        padding: EdgeInsets.all(10),
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
      SizedBox(height: 10),
      Text(
        name,
        style: TextStyle(fontSize: 14),
      ),
      Text(
        lname,
        style: TextStyle(fontSize: 14),
      )
    ],
  );
}

Widget _buildSocialMediaIcon(String social) {
  return Padding(
      padding: EdgeInsets.all(10),
      child: Image.asset(
        social,
        // fit: BoxFit.cover,
        width: 60,
        height: 60,
      ));
}

class ReportPage extends StatefulWidget {
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
              Row(
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
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (context, animation1, animation2) {
      return Align(
        alignment: Alignment.topRight,
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 90, horizontal: 20),
            child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Image.asset('assets/images/icons/verblue.png',
                        width: 30, height: 30),
                    Text('Daniel is Photo Verified',
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
          begin: Offset(1, 0), // Slide in from the right
          end: Offset(0, 0),
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
                    Row(children: [
                      const Icon(Icons.person_remove),
                      const SizedBox(width: 5),
                      Expanded(
                        child: const Text(
                          'They will not be able to find your profile or send you messages.',
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),
                      ),
                    ]),
                    const SizedBox(height: 12),
                    Row(children: [
                      const Icon(Icons.notifications_none),
                      const SizedBox(width: 5),
                      Expanded(
                        child: const Text(
                          'They will not be notified if you block them.',
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),
                      ),
                    ]),
                    const SizedBox(height: 12),
                    Row(children: [
                      const Icon(Icons.settings),
                      const SizedBox(width: 5),
                      Expanded(
                        child: const Text(
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
  @override
  _DatingPictureState createState() => _DatingPictureState();
}

class _DatingPictureState extends State<DatingPicture> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color blue = Color.fromRGBO(54, 40, 221, 1.0);
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
                showLibbyChatbot(context); // Call the popup function
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
                    SizedBox(width: 10),
                    PageIndicator(isActive: _currentPage == 1),
                  ],
                ),
              ),
            ],
          ),

          // Second page
          DatingTipsPage(),
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
                          builder: (context) => DatingProfilePage()),
                    );
                    break;
                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PeopleNearbyPage()),
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

  PageIndicator({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Color.fromRGBO(54, 40, 221, 1.0) : Colors.grey,
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
    Color blue = Color.fromRGBO(54, 40, 221, 1.0);
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
                          NeverScrollableScrollPhysics(), // Prevent inner scroll
                      shrinkWrap:
                          true, // Makes ListView take only necessary space
                      itemCount: datingTips.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading:
                              Image.asset('assets/images/icons/loveTips.png'),
                          title: Text(
                            datingTips[index],
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: ListView.builder(
                      physics:
                          NeverScrollableScrollPhysics(), // Prevent inner scroll
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
                        NeverScrollableScrollPhysics(), // Prevent inner scroll
                    shrinkWrap:
                        true, // Makes ListView take only necessary space
                    itemCount: datingTips2.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading:
                            Icon(Icons.favorite_border_outlined, color: blue),
                        title: Text(
                          datingTips2[index],
                          style: TextStyle(
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
