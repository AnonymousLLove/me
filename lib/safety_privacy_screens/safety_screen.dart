import 'package:love_bird/chat/mainChat.dart';
import 'package:love_bird/homeScreen/homeScreen2.dart';
import 'package:love_bird/matches/likes.dart';
import 'package:love_bird/matches/peopleNearby.dart';
import 'package:love_bird/safety_privacy_screens/get_help_screen.dart';
import 'package:love_bird/safety_privacy_screens/incognito_mode.dart';
import 'package:love_bird/safety_privacy_screens/privacy_screen.dart';
import 'package:flutter/material.dart';

class SafetyScreen extends StatefulWidget {
  const SafetyScreen({super.key});

  @override
  State<SafetyScreen> createState() => _SafetyScreenState();
}

class _SafetyScreenState extends State<SafetyScreen> {
  // State variables for the first modal
  bool _allowEveryone1 = false;
  bool _allowLiked1 = false;

  // State variables for the second modal
  bool _allowEveryone2 = false;
  bool _allowLiked2 = false;

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
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Image.asset(
                  "images/ai.png",
                ),
              ),
              const SizedBox(width: 45),
              const Text(
                'Safety',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(15.0),
          children: [
            _buildContainer(
              'images/help.png',
              'Get help from Love Bird',
              'Send us a message if you have any concerns',
              showArrow: false,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GetHelp()),
                );
              },
            ),
            _buildContainer(
              'images/setting.png',
              'Control your experience',
              'Manage who can see or message you',
              showArrow: true,
              onTap: () {
                _showControlExperienceModal(context);
              },
            ),
            _buildContainer(
              'images/privately.png',
              'Turn on incognito mode',
              'Go invisible to browse privately',
              showArrow: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const IncognitoModeScreen()),
                );
              },
            ),
            _buildContainer(
              'images/help.png',
              'Manage your privacy',
              'Choose what information you share',
              showArrow: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrivacyScreen()),
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.only(left: 12.0, right: 12, top: 12, bottom: 22),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: BottomNavigationBar(
                type:
                    BottomNavigationBarType.fixed, // Ensure all items are shown
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icons/homeBlack.png',
                        width: 30),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icons/localcon.png',
                        width: 30),
                    label: 'People Nearby',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icons/chatIcon.png',
                        width: 30),
                    label: 'Chats',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icons/matches.png',
                        width: 30),
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
                        MaterialPageRoute(
                            builder: (context) => const Mainchat()),
                      );

                      break;
                    case 3:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Likes()),
                      );
                      break;
                    case 4:
                      break;
                  }
                },
              ),
            ),
          ),
        ));
  }

  Widget _buildContainer(String imagePath, String title, String subtitle,
      {bool showArrow = true, void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xFF3628DD), width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              if (showArrow)
                const Opacity(
                  opacity: 0.5,
                  child:
                      Icon(Icons.arrow_forward_ios, color: Color(0xFF000000)),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showControlExperienceModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            height: 400, // Set a height for the modal
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_ios)),
                      Image.asset("images/who can see your message.png"),
                      const Icon(Icons.close),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Who can message you?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  CheckboxListTile(
                    title: const Text('Everyone'),
                    value: _allowEveryone1, // Use the state variable
                    onChanged: (bool? value) {
                      setState(() {
                        _allowEveryone1 = value ?? false; // Update state
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('People I’ve liked'),
                    value: _allowLiked1, // Use the state variable
                    onChanged: (bool? value) {
                      setState(() {
                        _allowLiked1 = value ?? false; // Update state
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'If everyone can message you, you’re more likely to get more matches.',
                    style: TextStyle(fontSize: 11),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('(1/4)'),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _showControllExperienceModal(context);
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showControllExperienceModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            height: 410, // Set a height for the modal
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_ios)),
                      Image.asset("images/who do you want to chat with.png"),
                      const Icon(Icons.close),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Who do you want to chat with?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  CheckboxListTile(
                    title: const Text('Everyone'),
                    value: _allowEveryone2, // Use the state variable
                    onChanged: (bool? value) {
                      setState(() {
                        _allowEveryone2 = value ?? false; // Update state
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Verified People'),
                    value: _allowLiked2, // Use the state variable
                    onChanged: (bool? value) {
                      setState(() {
                        _allowLiked2 = value ?? false; // Update state
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'When people are verified, it means we’re sure they’re real. This helps us keep Love Bird safe.',
                    style: TextStyle(fontSize: 11),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('(2/4)'),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _showControlllExperienceModal(context);
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showControlllExperienceModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            height: 410, // Set a height for the modal
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_ios)),
                      Image.asset("images/When should we notify you.png"),
                      const Icon(Icons.close),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'When should we notify you?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  CheckboxListTile(
                    title: const Text('When i get a message'),
                    value: _allowEveryone2, // Use the state variable
                    onChanged: (bool? value) {
                      setState(() {
                        _allowEveryone2 = value ?? false; // Update state
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('When i make a match'),
                    value: _allowLiked2, // Use the state variable
                    onChanged: (bool? value) {
                      setState(() {
                        _allowLiked2 = value ?? false; // Update state
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('When someone likes me'),
                    value: _allowLiked2, // Use the state variable
                    onChanged: (bool? value) {
                      setState(() {
                        _allowLiked2 = value ?? false; // Update state
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  // const Text(
                  //   'When people are verified, it means we’re sure they’re real. This helps us keep Love Bird safe.',
                  //   style: TextStyle(fontSize: 11),
                  // ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('(3/4)'),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _showControllllExperienceModal(context);
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showControllllExperienceModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            height: 410, // Set a height for the modal
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_ios)),
                      Image.asset("images/Want to show when you’re online.png"),
                      const Icon(Icons.close),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Want to show when you’re online?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  CheckboxListTile(
                    title: const Text('Yes'),
                    value: _allowEveryone2, // Use the state variable
                    onChanged: (bool? value) {
                      setState(() {
                        _allowEveryone2 = value ?? false; // Update state
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('No'),
                    value: _allowLiked2, // Use the state variable
                    onChanged: (bool? value) {
                      setState(() {
                        _allowLiked2 = value ?? false; // Update state
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'If you hide when you’re online, you won’t see when other people are online.',
                    style: TextStyle(fontSize: 11),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('(4/4)'),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _showControlllllExperienceModal(context);
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showControlllllExperienceModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            height: 410, // Set a height for the modal
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_ios)),
                      Image.asset("images/You’re all done!.png"),
                      const Icon(Icons.close),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'You’re all done!',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'Great - you’re all set for a better experience. Time to make some meaningful and amazing connections.',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DatingProfilePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3628DD),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      'Start Swiping',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DatingProfilePage()),
                      );
                    },
                    child: const Text(
                      'Go to Settings',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
