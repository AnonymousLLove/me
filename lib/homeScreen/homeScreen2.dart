import 'package:flutter/material.dart';
import 'package:love_bird/chat/chatScreen.dart';
import 'package:love_bird/chat/mainChat.dart';

import 'package:love_bird/homeScreen/notification.dart';
import 'package:love_bird/homeScreen/preference.dart';
import 'package:love_bird/matches/likes.dart';
import 'package:love_bird/matches/peopleNearby.dart';
import 'dart:async';

import 'package:love_bird/profile/profile.dart';

class DatingProfilePage extends StatefulWidget {
  const DatingProfilePage({super.key});

  @override
  State<DatingProfilePage> createState() => _DatingProfilePageState();
}

class _DatingProfilePageState extends State<DatingProfilePage> {
  List<String> messages = [
    "You've got this! The right person will appreciate everything you bring to the table.",
    "You are more than enough. The right person will see and cherish that.",
    "It’s all about the journey, not just the destination. Enjoy meeting new people along the way!",
    "Keep your heart open—you never know when a new connection will surprise you!",
    "A positive attitude is contagious—let your optimism shine through!",
    "The right person will love you for who you are, flaws and all. Keep the faith!",
    "Every great love story starts with a little courage. Keep putting yourself out there!",
    "Trust the process and enjoy the ourney—your perfect match could be just around the corner.",
    "Every experience is a step closer to finding the right person. Learn from each one and keep moving forward!",
    "Take a deep breath and relax—dating should be fun and exciting, not stressful!",
    "Sometimes love finds you when you least expect it. Stay hopeful!",
    "Stay confident and trust in them process. Good things are coming your way!",
    "Every date is an opportunity to learn more about yourself and what you truly want.",
    "Your perfect match is out there, and they’re probably searching for you too. Keep going!",
    "Be yourself—authenticity is the most attractive quality you can have.",
    "Don’t forget to smile—it’s the best way to attract positive energy and people!",
    "Remember, you deserve someone who appreciates and respects you. Don’t settle for anything less!",
    "Every great connection starts with a simple 'hello.' Don’t be afraid to make the first move!",
    "You are worthy of love and happiness. Don’t settle for anything less than you deserve!",
    "Don’t be afraid to take the initiative. You never know what amazing connection might start with a simple message!",
    "Remember, each ‘no’ is one step closer to the ‘yes’ that really matters.",
    "It’s okay if it takes time. The best things in life are worth waiting for.",
    "Dating can be a journey, but every interaction brings you closer to what you’re looking for.",
    "You’re one step closer to finding someone special. Stay patient and hopeful!",
    "It only takes one special connection to make all the effort worthwhile. Stay positive, and keep exploring!",
    "It’s okay to take a break if you need one—self-care is just as important as finding love.",
    "Remember, the right person is out there—sometimes it just takes a little time to find them. Keep being yourself!",
  ];

  String currentMessage = '';
  Timer? popupTimer;

  @override
  void initState() {
    super.initState();
    startPopupTimer(); // Start the popup timer when the app starts
  }

  // Start the timer to show popup every 2 minutes
  //chnage timer as whaever they say
  void startPopupTimer() {
    popupTimer = Timer.periodic(const Duration(hours: 10), (timer) {
      showPopup();
    });
  }

  // Function to display the popup
  void showPopup() {
    setState(() {
      currentMessage =
          messages[(messages.indexOf(currentMessage) + 1) % messages.length];
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Container(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            width: 150,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Space between items
                  children: [
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 28.0),
                          child: SizedBox(
                            width: 30,
                            height: 40,
                            child: Image.asset('assets/images/image1.png',
                                fit: BoxFit.cover), // Adjusted size
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close, size: 20),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 20, right: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff6156EA).withOpacity(0.4),

                      //    color: Color.fromRGBO(97, 86, 234, 0.19),

                      // Match the dialog's border radius
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(10, 10),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                          10), // Add padding inside the container
                      child: Text(
                        '"$currentMessage"',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight
                                .w500), // Optional: change text color for better contrast
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    popupTimer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    // FilterOptionss filterOptions = const FilterOptionss();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
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
                    icon: const Icon(Icons.arrow_back_outlined),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      showLibbyChatbot(
                          context); // Call the separate function to show the popup
                    },
                    child: Image.asset('assets/images/robot.png', width: 30),
                  ),
                  const Expanded(
                    child: Center(
                        child: Text(
                      'Love Bird',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      textAlign: TextAlign.center,
                    )),
                  ),
                  InkWell(
                    onTap: () {
                      showExtraViewsPopup(context); // Show extra views popup
                    },
                    child: Image.asset('assets/images/message.png', width: 30),
                  ),
                  SizedBox(width: 5),
                  IconButton(
                    icon: const Icon(Icons.notifications,
                        color: Colors.black, size: 30),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationsPage()),
                      );
                    },
                  ),
                  SizedBox(width: 5),
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
            const Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      // SizedBox(height: 20),
                      // Replace this part with the ProfileInfo widget
                      ProfileInfo(
                        imageUrl: 'assets/images/homeImage.png',
                        name: 'Daniel, 31',
                        location: '26km away',
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
                  icon: Image.asset('assets/images/icons/home.png',
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

void showLibbyChatbot(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Align(
        alignment:
            Alignment.bottomCenter, // Aligns the dialog at the bottom center
        child: Padding(
          padding: const EdgeInsets.only(
              bottom: 20), // Adds some space at the bottom
          child: AlertDialog(
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(0), // Rounded corners for the dialog
            ),
            content: SizedBox(
              height: 350,
              width: 300, // Adjust dimensions based on your design
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2, // Occupies 2/3 of the total height
                          child: Container(
                            color: const Color.fromRGBO(54, 40, 221, 1),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 5, right: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Hello there",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Image.asset('assets/images/wave.png',
                                          height: 18), // Adjust wave icon size
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    "I am Libby!",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  const Text(
                                    "You can ask me anything on dating, relationship advice, event & activity suggestions, conversation advice, real-life tips, etc.",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1, // Occupies 1/3 of the total height
                          child: Column(
                            children: [
                              const Spacer(),
                              Image.asset('assets/images/image2.png')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Floating "Ask me Anything" container
                  Positioned(
                    top: 200,
                    left: 50,
                    right: 50,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        showChatPopup(context);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                              offset: Offset(10, 10),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(54, 40, 221, 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Row(
                                children: [
                                  Image.asset('assets/images/icons/sendAi.png'),
                                  const SizedBox(width: 5),
                                  const Text(
                                    'Ask me Anything',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

void showChatPopup(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return ChatDialog();
    },
  );
}

class ChatDialog extends StatefulWidget {
  @override
  _ChatDialogState createState() => _ChatDialogState();
}

class _ChatDialogState extends State<ChatDialog> {
  final List<Map<String, String>> _messages = [
    {
      'text': 'Hi, I need help on event suggestions for a first-time date.',
      'user': 'me',
    },
    {
      'text': 'Sure! How about a picnic in the park?',
      'user': 'ai',
    },
  ];

  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add({
          'text': _controller.text,
          'user': 'me',
        });
      });
      _controller.clear(); // Clear the input field
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 400,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: const Color.fromRGBO(54, 40, 221, 1),
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            const SizedBox(height: 5),
            Image.asset('assets/images/image1.png', width: 40),
            // Chat Messages
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return messageField(
                    text: _messages[index]['text']!,
                    user: _messages[index]['user']!,
                  );
                },
              ),
            ),
            // Text input field for message
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: "Type here and press enter...",
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (_) =>
                          _sendMessage(), // Send message on enter
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.send,
                        color: Color.fromRGBO(54, 40, 221, 1)),
                    onPressed: _sendMessage,
                  ),
                  const SizedBox(width: 5),
                  const Icon(Icons.attachment_sharp, color: Colors.grey),
                  const SizedBox(width: 5),
                  const Icon(Icons.sentiment_satisfied_outlined,
                      color: Colors.grey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget messageField({
  required String text,
  required String user, // Can be "me" or "ai"
  String? image, // Optional image parameter
}) {
  // Set default image if none provided
  String avatarImage =
      user == 'me' ? 'assets/images/homeImage.png' : 'assets/images/robot.png';

  // Define alignment based on user
  Alignment alignment =
      user == 'me' ? Alignment.centerRight : Alignment.centerLeft;

  return Align(
    alignment: alignment,
    child: Row(
      mainAxisAlignment:
          user == 'me' ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (user != 'me')
          CircleAvatar(
            backgroundImage: AssetImage(avatarImage),
            radius: 20,
          ),
        const SizedBox(width: 10),
        Container(
          width: 200,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 5),
          color: const Color.fromRGBO(210, 207, 251, 1),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        if (user == 'me') // Show avatar for user only
          const SizedBox(width: 10),
        if (user == 'me')
          CircleAvatar(
            backgroundImage: AssetImage(avatarImage),
            radius: 20,
          ),
      ],
    ),
  );
}

void showExtraViewsPopup(BuildContext context) {
  const Color blue = Color.fromRGBO(54, 40, 221, 1.0);
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
        height: MediaQuery.of(context).size.height * 0.4,
        child: SingleChildScrollView(
          // Add scroll view
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset('assets/images/credit.png',
                    width: 70, height: 50),
              ),
              const SizedBox(height: 2),
              const Text(
                'Extra Views',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Text(
                'Be seen by more people and get up to 6x more likes.',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PurchaseCreditsPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blue,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text('Get Extra Views For 150 Credits',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'OR',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: OutlinedButton(
                  onPressed: () {
                    // Handle navigation to Premium Plan
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    side: const BorderSide(color: blue, width: 2),
                  ),
                  child: const Text(
                    'Get Love Bird Premium Plan',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Add some spacing before the button
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Maybe Later',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class ProfileInfo extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String location;

  const ProfileInfo({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.location,
  });

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  bool _showSuperLike = false;
  bool _showLike = false;
  bool _showNo = false;
  bool _showCancel = false;
  double _rotationAngle = 0.0;

  void _onStarPressed() {
    setState(() {
      _showSuperLike = true; // Show the small image tilted to the right
      _rotationAngle = -0.2; // Tilt the image slightly to the right
    });

    // Hide the image after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _showSuperLike = false; // Hide the small image
        _rotationAngle = 0.0; // Reset rotation
      });
    });
  }

  void _onLovePressed() {
    setState(() {
      _showLike = true; // Show "Super Like"
      _rotationAngle = 0.3; // Tilt the image to the left
    });

    // Hide the text and reset the rotation after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _showLike = false; // Hide "Super Like"
        _rotationAngle = 0.0; // Reset rotation
      });
    });
  }

  void _onNoPressed() {
    setState(() {
      _showNo = true; // Show "Super Like"
      _rotationAngle = -0.3; // Tilt the image to the left
    });

    // Hide the text and reset the rotation after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _showNo = false; // Hide "Super Like"
        _rotationAngle = 0.0; // Reset rotation
      });
    });
  }

  void _onCancelPressed() {
    setState(() {
      _showCancel = true; // Show "Super Like"
    });

    // Hide the text after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _showCancel = false; // Hide "Super Like"
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The background image and details
        GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.velocity.pixelsPerSecond.dx > 0) {
              // Swipe right detected
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Swiped Right!')),
              );
            }
          },
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const UserProfilePage(), // Replace with your new screen widget
              ),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.74,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(widget.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        // Rotated Home Image
        if (_showLike)
          Positioned.fill(
            child: Transform.rotate(
              angle: _rotationAngle,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(widget.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Opacity(
                    opacity: _showLike ? 1.0 : 0.0,
                    child: const Text(
                      ' Like',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white, // Set your desired color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

        if (_showNo)
          Positioned.fill(
            child: Transform.rotate(
              angle: _rotationAngle,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.74,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(widget.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Opacity(
                    opacity: _showNo ? 1.0 : 0.0,
                    child: const Text(
                      ' No',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white, // Set your desired color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

        if (_showSuperLike)
          Positioned(
            // top: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.1,
            child: Transform.rotate(
              angle: _rotationAngle,
              child: Container(
                width: MediaQuery.of(context).size.width *
                    0.6, // Small image width
                height: MediaQuery.of(context).size.height *
                    0.4, // Small image height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(widget.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Opacity(
                    opacity: _showSuperLike ? 1.0 : 0.0,
                    child: const Text(
                      'Super  Like',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white, // Set your desired color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

        // Combined container for details and action buttons
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            color: Colors.black.withOpacity(0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.location,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: _onCancelPressed,
                          child: Image.asset('assets/images/left.png')),
                      const Spacer(),
                      InkWell(
                        onTap: _onLovePressed,
                        child: Image.asset('assets/images/love2.png'),
                      ),
                      const Spacer(),
                      GestureDetector(
                        // Show "Super Like" text on press
                        onTap: _onStarPressed,
                        child: Image.asset('assets/images/star2.png'),
                      ),
                      const Spacer(),
                      GestureDetector(
                          onTap: _onNoPressed,
                          child: Image.asset('assets/images/cancel.png')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        if (_showCancel)
          Positioned.fill(
            child: Center(
              child: Opacity(
                opacity: _showCancel ? 1.0 : 0.0,
                child: const Text(
                  'Recent Action Reversed',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white, // Set your desired color
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

        // Top right icon (adjust size and positioning as needed)
        Positioned(
          top: 10,
          right: 10,
          child: IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.white, size: 30),
            onPressed: () {
              _showSmallPopup(context);
            },
          ),
        ),

        // Bottom right icon
        Positioned(
          bottom: 170,
          right: 10,
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
            padding: const EdgeInsets.symmetric(vertical: 130, horizontal: 20),
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
