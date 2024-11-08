import 'package:flutter/material.dart';
import 'package:love_bird/chat/chat_screen.dart';
import 'package:love_bird/chat/main_chat.dart';
import 'package:love_bird/config/routes.dart';

import 'package:love_bird/homeScreen/homescreen.dart';
import 'package:love_bird/homeScreen/notification.dart';
import 'package:love_bird/matches/likes.dart';
import 'package:love_bird/matches/people_nearby.dart';
import 'package:love_bird/profile/profile.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: Colors.black, size: 30),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context,
                          chatbotWelcomeScreen); // Call the separate function to show the popup
                    },
                    child: Image.asset('assets/images/robot.png', width: 40),
                  ),
                  const Expanded(
                    child: Center(
                        child: Text(
                      'Profile',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                      textAlign: TextAlign.center,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
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
                ],
              ),
              Stack(
                alignment: Alignment
                    .bottomRight, // Aligns child widgets to the bottom right
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.5,
                        child: PageView(
                          controller: _pageController,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.asset(
                                'assets/images/homeImage.png',
                                width: screenWidth * 0.9,
                                height: screenHeight * 0.5,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.asset(
                                'assets/images/homeImage.png',
                                width: screenWidth * 0.9,
                                height: screenHeight * 0.5,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.asset(
                                'assets/images/homeImage.png',
                                width: screenWidth * 0.9,
                                height: screenHeight * 0.5,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(3, (index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: _currentPage == index
                                    ? Color.fromRGBO(54, 40, 221, 1)
                                    : Color.fromRGBO(255, 255, 255, 0.54),
                                shape: BoxShape.circle,
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),

                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(12.0),
                  //   child: Image.asset(
                  //     'assets/images/homeImage.png', // Path to the main image
                  //     width: screenWidth * 0.9,
                  //     height: screenHeight * 0.5,
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  Positioned(
                    top: 1,
                    right: 10,
                    child: IconButton(
                      icon: const Icon(Icons.more_horiz,
                          color: Colors.white, size: 30),
                      onPressed: () {
                        _showSmallPopup(context);
                      },
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

                        SizedBox(height: 16.0),
                        Row(children: [
                          ProfileDetail(
                            icon: Icons.man,
                            title: "Man",
                          ),
                          Spacer(),
                          Text('Fun and Interesting',
                              style: TextStyle(fontSize: 16))
                        ]),

                        ProfileDetail(
                          icon: Icons.rule_sharp,
                          title: "145cm 65kg",
                        ),
                        ProfileDetail(
                          icon: Icons.work,
                          title: "Banker at Citi Bank",
                        ),
                        ProfileDetail(
                          icon: Icons.school,
                          title: "University of Leeds, UK",
                        ),
                        ProfileDetail(
                          icon: Icons.home,
                          title: "Lives in New London",
                        ),
                        ProfileDetail(
                          icon: Icons.location_on,
                          title: "25km away",
                        ),
                        SizedBox(height: 20.0),
                        // Relationship basics
                        Text(
                          'My relationship Basics',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        RelationshipOption(
                          title: 'Friendship',
                          icon: Icons.people,
                          color: Colors.pinkAccent,
                        ),
                        SizedBox(height: 20),
                        // Interests
                        Text(
                          'Interests',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Wrap(
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
                        SizedBox(height: 20),
                        Text(
                          'Location',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
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
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.03, // 3% of screen width
          right: MediaQuery.of(context).size.width * 0.03,
          top: MediaQuery.of(context).size.height * 0.01, // 1% of screen height
          bottom:
              MediaQuery.of(context).size.height * 0.03, // 3% of screen height
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(97, 86, 234, 0.19),
            borderRadius: BorderRadius.circular(50),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/icons/home.png',
                    width:
                        MediaQuery.of(context).size.width * 0.07, // 7% of width
                    height: MediaQuery.of(context).size.width * 0.07,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/icons/localcon.png',
                    width: MediaQuery.of(context).size.width * 0.07,
                    height: MediaQuery.of(context).size.width * 0.07,
                  ),
                  label: 'People Nearby',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/icons/chatIcon.png',
                    width: MediaQuery.of(context).size.width * 0.07,
                    height: MediaQuery.of(context).size.width * 0.07,
                  ),
                  label: 'Chats',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/icons/matches.png',
                    width: MediaQuery.of(context).size.width * 0.07,
                    height: MediaQuery.of(context).size.width * 0.07,
                  ),
                  label: 'Matches',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/icons/personIcon.png',
                    width: MediaQuery.of(context).size.width * 0.07,
                    height: MediaQuery.of(context).size.width * 0.07,
                  ),
                  label: 'Profile',
                ),
              ],
              selectedLabelStyle: TextStyle(
                fontSize:
                    MediaQuery.of(context).size.width * 0.03, // 3% of width
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.03,
              ),
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
                          builder: (context) => const ProfilePage()),
                    );
                    break;
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

void _showSmallPopup(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true, // Dismiss when tapped outside
    barrierLabel: 'Dismiss',
    barrierColor: Colors.transparent, // Add a background overlay
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation1, animation2) {
      return Align(
        alignment: Alignment.topRight, // Align the dialog to the right
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 20),
            child: Container(
              width: 140, // Set the width of your popup
              height: 100, // Set the height of your popup
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
                        showBlockPopup(context);
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.block,
                          ),
                          SizedBox(width: 5),
                          Text('Block', style: TextStyle(fontSize: 17))
                        ],
                      )),
                  const Divider(thickness: 2),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ReportPage()),
                        );
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.report,
                          ),
                          SizedBox(width: 5),
                          Text('Report', style: TextStyle(fontSize: 17))
                        ],
                      )),
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
