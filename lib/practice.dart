import 'package:flutter/material.dart';

// These are for screens that i do not know where they link to
// to show you have a match
//to show the matches you have while absent
// to show if someone chats you up without having matched
void showMatchDialog(BuildContext context) {
  const Color blue = Color.fromRGBO(54, 40, 221, 1.0);
  showDialog(
    context: context,
    barrierDismissible: true, // Dismiss when tapped outside
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Rounded corners
        ),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          height: 400, // Adjust the height as needed
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Row for the two heart-shaped avatars
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.favorite,
                        size: 90,
                        color: Colors.purple[200], // Heart color
                      ),
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                            'assets/profile1.jpg'), // Profile image 1
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.favorite,
                        size: 90,
                        color: Colors.purple[200], // Heart color
                      ),
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                            'assets/profile2.jpg'), // Profile image 2
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Main text
              const Text(
                'You Got The Match!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: blue,
                ),
              ),
              const SizedBox(height: 10),
              // Subtitle text
              const Text(
                'You both liked each other. Take charge and start a meaningful conversation.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: blue,
                ),
              ),
              const SizedBox(height: 30),
              // "Chat Now" button
              ElevatedButton(
                onPressed: () {
                  // Handle Chat Now action
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: blue, // Button background color
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Chat Now',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // "Maybe Later" button
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300], // Button background color
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Maybe Later',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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

void showMatchPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        content: SingleChildScrollView(
          // Make the content scrollable
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Row of avatars
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildProfileAvatar(
                      'assets/images/homeImage.png',
                    ),
                    _buildProfileAvatar(
                      'assets/images/homeImage.png',
                    ),
                    _buildProfileAvatar(
                      'assets/images/homeImage.png',
                    ),
                    _buildProfileAvatar(
                      'assets/images/homeImage.png',
                    ),
                    _buildProfileAvatar(
                      'assets/images/homeImage.png',
                    ),
                    _buildProfileAvatar(
                      'assets/images/homeImage.png',
                    ),
                  ],
                ),
              ),

              // Title message
              Text(
                "You've got lots of matches!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),

              // Subtitle message
              Text(
                "You have got 14 matches already - why not start a conversation?",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 20),

              // Buttons
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Handle "Chat with a match" action
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  backgroundColor:
                      Color.fromRGBO(54, 40, 221, 1.0), // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  "Chat with a match",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Handle "Maybe later" action
                },
                child: Text(
                  "Maybe later",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
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

Widget _buildProfileAvatar(String i) {
  return Stack(
    children: [
      Column(
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
        ],
      ),
      Positioned(
        right: 14,
        bottom: 20,
        child: Container(
          height: 12,
          width: 12,
          decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
        ),
      ),
    ],
  );
}

void showChatPopup(BuildContext context, String name) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Text(
              "Want to chat with $name?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),

            // Subtitle
            Text(
              "If you're not interested, end the chat. We'll let $name know, and they won't be able to contact you again.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            SizedBox(height: 20),

            // Keep Chatting button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Handle "Keep Chatting" action
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                backgroundColor: Colors.blue, // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text("Keep Chatting"),
            ),
            SizedBox(height: 10),

            // End The Chat button
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Handle "End The Chat" action
              },
              child: Text(
                "End The Chat",
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
