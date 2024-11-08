import 'package:flutter/material.dart';
import 'package:love_bird/chat/main_chat.dart';
import 'package:love_bird/config/routes.dart';

import 'package:love_bird/homeScreen/homescreen.dart';
import 'package:love_bird/homeScreen/preference.dart';
import 'package:love_bird/matches/likes.dart';
import 'package:love_bird/matches/profile_visits.dart';
import 'package:love_bird/profile/profile.dart';

class PeopleNearbyPage extends StatelessWidget {
  const PeopleNearbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(
              top: screenSize.height * 0.03, right: 11, left: 5),
          child: Row(
            children: [
              IconButton(
                icon:
                    const Icon(Icons.arrow_back, color: Colors.black, size: 40),
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
              Expanded(
                child: Center(
                  child: InkWell(
                    onTap: () {},
                    child: const Text(
                      'People NearBy',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  showExtraViewsPopup(context); // Show extra views popup
                },
                child: Image.asset('assets/images/message.png', width: 30),
              ),
              const SizedBox(width: 5),
              InkWell(
                onTap: () {
                  showFilterOptions(context, (int startAge, int endAge) {
                    // This callback is triggered when the age range is selected.
                    print('Selected Age Range: $startAge - $endAge');
                  }); // Show filter options
                },
                child: Image.asset('assets/images/Vector.png', width: 30),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildContinueButton(screenSize, 'People NearBy'),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Profilevisits()),
                );
              },
              child: Container(
                width: screenSize.width * 0.4,
                height: screenSize.height * 0.06,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(149, 140, 250, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Profile Visitors',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Use a SizedBox for fixed height
        Expanded(
          // Adjust height as needed
          child: PeopleNearbyGrid(),
        ),
      ]),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 12.0, right: 12, top: 12, bottom: 22),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(97, 86, 234, 0.19),
            borderRadius: BorderRadius.circular(50),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor:
                  Colors.transparent, // Transparent to show container color
              elevation: 0, // Ensure all items are shown
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icons/homeBlack.png',
                      width: 30, height: 30),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icons/localcon.png',
                      width: 30, height: 30),
                  label: 'People Nearby',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icons/chatIcon.png',
                      width: 30, height: 30),
                  label: 'Chats',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icons/matches.png',
                      width: 30, height: 30),
                  label: 'Matches',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icons/personIcon.png',
                      width: 30, height: 30),
                  label: 'Profile',
                ),
              ],
              selectedLabelStyle: const TextStyle(
                  fontSize: 11), // Change the font size for the selected label
              unselectedLabelStyle: const TextStyle(fontSize: 11),
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

  Widget _buildContinueButton(
    Size screenSize,
    String text,
  ) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: screenSize.width * 0.4,
        height: screenSize.height * 0.06,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(54, 40, 221, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

// People Nearby Grid

class PeopleNearbyGrid extends StatelessWidget {
  final List<User> users = [
    User(
        imageUrl: 'assets/images/homeImage.png',
        name: 'David',
        age: 31,
        isOnline: true),
    User(
        imageUrl: 'assets/images/homeImage.png',
        name: 'James',
        age: 29,
        isOnline: false),
    User(
        imageUrl: 'assets/images/homeImage.png',
        name: 'Tom',
        age: 32,
        isOnline: true),
    User(
        imageUrl: 'assets/images/homeImage.png',
        name: 'Michael',
        age: 30,
        isOnline: false),
    User(
        imageUrl: 'assets/images/homeImage.png',
        name: 'Michael',
        age: 30,
        isOnline: true),
    User(
        imageUrl: 'assets/images/homeImage.png',
        name: 'Michael',
        age: 30,
        isOnline: false),
    User(
        imageUrl: 'assets/images/homeImage.png',
        name: 'Michael',
        age: 30,
        isOnline: true),
    User(
        imageUrl: 'assets/images/homeImage.png',
        name: 'Michael',
        age: 30,
        isOnline: false),
    User(
        imageUrl: 'assets/images/homeImage.png',
        name: 'Michael',
        age: 30,
        isOnline: true),
  ];

  PeopleNearbyGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 9.0,
        mainAxisSpacing: 14.0,
        childAspectRatio: 0.7,
      ),
      itemCount: users.length,
      itemBuilder: (context, index) {
        return UserCard(user: users[index]);
      },
    );
  }
}

// User Model
class User {
  final String imageUrl;
  final String name;
  final int age;
  final bool isOnline; // New property to indicate online status

  User({
    required this.imageUrl,
    required this.name,
    required this.age,
    required this.isOnline, // Include isOnline in constructor
  });
}

// User Card
class UserCard extends StatelessWidget {
  final User user;

  const UserCard({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // Use Stack to overlay the online indicator
      alignment: Alignment.topRight,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(user.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Semi-transparent container behind the name and location
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.5),
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${user.age}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Green Online Indicator
        if (user.isOnline) // Only show if the user is online
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}
