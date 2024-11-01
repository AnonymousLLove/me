import 'package:flutter/material.dart';
import 'package:love_bird/chat/mainChat.dart';

import 'package:love_bird/homeScreen/homeScreen2.dart';
import 'package:love_bird/matches/peopleNearby.dart';

import 'package:love_bird/matches/superLikes.dart';
import 'package:love_bird/profile/profile.dart';
import 'dart:ui';

import 'package:love_bird/renewal/renewal.dart'; // For image blurring

class Likes extends StatefulWidget {
  const Likes({super.key});

  @override
  _LikesState createState() => _LikesState();
}

class _LikesState extends State<Likes> {
  bool premuimPackage = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: screenSize.height * 0.03, right: 11, left: 5),
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
                    // Call the separate function to show the popup
                  },
                  child: Image.asset('assets/images/robot.png', width: 40),
                ),
                Expanded(
                  child: Center(
                    child: InkWell(
                      onTap: () {},
                      child: const Text(
                        'Matches',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.search, size: 30)),
                InkWell(
                  onTap: () {
                    showLikeSort(context);
                  },
                  child: Image.asset('assets/images/icons/likeSort.png',
                      width: 30),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            InkWell(
              onTap: () {},
              child: Container(
                width: screenSize.width * 0.4,
                height: screenSize.height * 0.06,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(54, 40, 221, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Likes(4)', // dynamic number
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SuperLikes()),
                );
              },
              child: Container(
                width: screenSize.width * 0.4,
                height: screenSize.height * 0.06,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(149, 140, 250, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'SuperLikes(4)', //dynamic number
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ]),
          SizedBox(height: 20),
          Expanded(child: PeopleNearbyGrid(premuimPackage: premuimPackage)),
          SizedBox(height: 7),
          if (premuimPackage == false)
            SizedBox(
              width: screenSize.width * 0.7,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpgradePremium()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: const Color.fromRGBO(54, 40, 221, 1),
                ),
                child: const Text(
                  'Upgrade to Premium To See More',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 12.0, right: 12, top: 12, bottom: 22),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF3628DD).withOpacity(0.19),
            borderRadius: BorderRadius.circular(50),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor:
                  Colors.transparent, // Transparent to show container color
              elevation: 0,
              // Ensure all items are shown
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
                  icon: Image.asset('assets/images/icons/blueMatch.png',
                      width: 30, height: 30),
                  label: 'Matches',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icons/personIcon.png',
                      width: 30, height: 30),
                  label: 'Profile',
                ),
              ],
              selectedLabelStyle: TextStyle(
                  fontSize: 11), // Change the font size for the selected label
              unselectedLabelStyle: TextStyle(fontSize: 11),
              onTap: (index) {
                // Handle navigation based on the index
                switch (index) {
                  case 0:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DatingProfilePage()),
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

class PeopleNearbyGrid extends StatelessWidget {
  final bool premuimPackage;

  PeopleNearbyGrid({Key? key, required this.premuimPackage}) : super(key: key);

  final List<User> users = [
    User(imageUrl: 'assets/images/homeImage.png', name: 'David', age: 31),
    User(imageUrl: 'assets/images/homeImage.png', name: 'James', age: 29),
    User(imageUrl: 'assets/images/homeImage.png', name: 'Tom', age: 32),
    User(imageUrl: 'assets/images/homeImage.png', name: 'Michael', age: 30),
    User(imageUrl: 'assets/images/homeImage.png', name: 'James', age: 29),
    User(imageUrl: 'assets/images/homeImage.png', name: 'Tom', age: 32),
    User(imageUrl: 'assets/images/homeImage.png', name: 'Michael', age: 30),
    User(imageUrl: 'assets/images/homeImage.png', name: 'Tom', age: 32),
    User(imageUrl: 'assets/images/homeImage.png', name: 'Michael', age: 30),
    User(imageUrl: 'assets/images/homeImage.png', name: 'James', age: 29),
    User(imageUrl: 'assets/images/homeImage.png', name: 'Tom', age: 32),
    User(imageUrl: 'assets/images/homeImage.png', name: 'Michael', age: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.7,
      ),
      itemCount: users.length,
      itemBuilder: (context, index) {
        bool shouldBlur = !premuimPackage && index >= 2;
        return UserCard(user: users[index], blurImage: shouldBlur);
      },
    );
  }
}

class User {
  final String imageUrl;
  final String name;
  final int age;

  User({required this.imageUrl, required this.name, required this.age});
}

class UserCard extends StatelessWidget {
  final User user;
  final bool blurImage;

  const UserCard({required this.user, required this.blurImage, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          Image.asset(
            user.imageUrl,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          // Blurring effect
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                color: Colors.black.withOpacity(0.5),
              ),
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
          ),
          if (blurImage)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Container(
                height: 150,
                width: double.infinity,
                color: const Color.fromARGB(255, 151, 145, 145).withOpacity(0),
              ),
            ),
        ],
      ),
    );
  }
}
