import 'package:flutter/material.dart';
import 'package:love_bird/chat/mainChat.dart';
import 'package:love_bird/edit%20profile%20screens/edit_low_profile_screen.dart';
import 'package:love_bird/homeScreen/homeScreen2.dart';
import 'package:love_bird/matches/likes.dart';
import 'package:love_bird/matches/peopleNearby.dart';

class VideoCallScreen extends StatelessWidget {
  final String name;
  final String profileImage;
  final String callDuration;
  final String backgroundImage;

  const VideoCallScreen({
    Key? key,
    required this.name,
    required this.profileImage,
    required this.callDuration,
    this.backgroundImage = 'assets/images/homeImage.png', // Default background
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage(backgroundImage), // Use the selected background

                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Column(children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  callDuration,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 16,
                  ),
                ),
              ])),

          Positioned(
            bottom: 100,
            // left: 40,
            right: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 180,
                  width: 180,
                  child: Image.asset(profileImage),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),

          // Call control buttons (mute, speaker, end call)
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildControlButton(
                  icon: Icons.volume_up,
                  color: Color.fromRGBO(149, 140, 250, 1),
                  onPressed: () {
                    // Handle speaker action
                  },
                ),
                _buildControlButton(
                  icon: Icons.video_call,
                  color: Color.fromRGBO(149, 140, 250, 1),
                  onPressed: () {
                    // Handle video call action
                  },
                ),
                _buildControlButton(
                  icon: Icons.mic,
                  color: Color.fromRGBO(149, 140, 250, 1),
                  onPressed: () {
                    // Handle mute action
                  },
                ),
                _buildControlButton(
                  icon: Icons.call_end,
                  color: Colors.red,
                  onPressed: () {
                    // Handle end call action
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),

          // Back button
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_left, color: Colors.white, size: 28),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 10,
            right: 20,
            child: IconButton(
              icon: Icon(Icons.more_vert, color: Colors.white, size: 28),
              onPressed: () {
                _showVideoPopup(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Helper widget for creating call control buttons
Widget _buildControlButton({
  required IconData icon,
  required Color color,
  required VoidCallback onPressed,
}) {
  return CircleAvatar(
    radius: 30,
    backgroundColor: color,
    child: IconButton(
      icon: Icon(icon, color: Colors.white, size: 28),
      onPressed: onPressed,
    ),
  );
}

void _showVideoPopup(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true, // Dismiss when tapped outside
    barrierLabel: 'Dismiss',
    barrierColor: Colors.black54, // Add a background overlay
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (context, animation1, animation2) {
      return Align(
        alignment: Alignment.topRight,
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: Container(
              width: 150,
              // Use a flexible height to allow more content
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(8), // Optional: add rounded corners
              ),
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                // Make the content scrollable
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Avatar()),
                        );
                      },
                      child: Text('Add Avatar', style: TextStyle(fontSize: 14)),
                    ),
                    const Divider(thickness: 2),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Background()),
                        );
                      },
                      child: Text('Add Background',
                          style: TextStyle(fontSize: 14)),
                    ),
                    // Add more items here to test scrolling
                  ],
                ),
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

class Avatar extends StatefulWidget {
  const Avatar({super.key});

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text('Avatar', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(child: AvatarGrid()),
            SizedBox(
              width: screenSize.width * 0.7,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: const Color.fromRGBO(54, 40, 221, 1),
                ),
                child: const Text(
                  'Apply',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
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
            color: Color.fromRGBO(97, 86, 234, 0.19),
            borderRadius: BorderRadius.circular(50),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icons/homeBlack.png',
                      width: 40),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icons/localcon.png',
                      width: 30),
                  label: 'Location',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icons/blueChat.png',
                      width: 30),
                  label: 'Chats',
                ),
                BottomNavigationBarItem(
                  icon:
                      Image.asset('assets/images/icons/matches.png', width: 30),
                  label: 'Matches',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icons/personIcon.png',
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
                          builder: (context) => const DatingProfilePage()),
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
                    // Navigate to Chats
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

class AvatarGrid extends StatelessWidget {
  AvatarGrid({Key? key}) : super(key: key);

  final List<String> users = [
    'assets/images/avatar1.png',
    'assets/images/avatar2.png',
    'assets/images/avatar3.png',
    'assets/images/avatar4.png',
    'assets/images/avatar5.png',
    'assets/images/avatar6.png',
    'assets/images/avatar7.png',
    'assets/images/avatar8.png',
    'assets/images/avatar9.png',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.7,
      ),
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Image.asset(
            users[index],
            fit: BoxFit.cover,
            width: 60, // Set a width for the images
            height: 60, // Set a height for the images
          ),
        );
      },
    );
  }
}

class Background extends StatefulWidget {
  const Background({super.key});

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  String? selectedBackground;

  final List<String> backgrounds = [
    'assets/images/background1.png',
    'assets/images/background2.png',
    'assets/images/background3.png',
    'assets/images/background4.png',
    'assets/images/background5.png',
    'assets/images/background6.png',
    'assets/images/background7.png',
    'assets/images/background8.png',
    'assets/images/background9.png',
    'assets/images/background10.png',
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text('Background', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.7,
                ),
                itemCount: backgrounds.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedBackground = backgrounds[index];
                      });
                    },
                    child: Stack(
                      children: [
                        Image.asset(
                          backgrounds[index],
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Radio<String>(
                            value: backgrounds[index],
                            groupValue: selectedBackground,
                            onChanged: (value) {
                              setState(() {
                                selectedBackground = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: screenSize.width * 0.7,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedBackground != null) {
                      // Navigate back to VideoCallScreen with the selected background
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => VideoCallScreen(
                          name: "Lil Mama",
                          profileImage: "assets/images/homeImage.png",
                          callDuration: "00:10:45",
                          backgroundImage: selectedBackground!,
                        ),
                      ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    backgroundColor: const Color.fromRGBO(54, 40, 221, 1),
                  ),
                  child: const Text(
                    'Apply',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
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
            color: Color.fromRGBO(97, 86, 234, 0.19),
            borderRadius: BorderRadius.circular(50),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icons/homeBlack.png',
                      width: 40),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icons/localcon.png',
                      width: 30),
                  label: 'Location',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icons/blueChat.png',
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
                          builder: (context) => PeopleNearbyPage()),
                    );
                    break;
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Mainchat()),
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
