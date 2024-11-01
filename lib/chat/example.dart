import 'package:flutter/material.dart';

void showCustomPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Close Button
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(); // Close the popup
                  },
                  child: const Icon(Icons.close, color: Colors.blue),
                ),
              ),

              // Header Text Section
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Text(
                      'Hello there 👋',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'I am Libby!',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Welcome to Love Bird AI Virtual Assistance.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'You can ask me anything on dating, relationship advice, event & activity suggestions, conversation advice, and life queries.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        //textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Action Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // Action when button is pressed
                  Navigator.of(context).pop();
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.chat_bubble, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      'Ask me anything',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Bottom Icon
              const Icon(
                Icons.favorite,
                color: Colors.blue,
                size: 30,
              ),
            ],
          ),
        ),
      );
    },
  );
}

class PopupExample extends StatelessWidget {
  const PopupExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Popup Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showCustomPopup(context); // Trigger the popup
          },
          child: const Text("Show Popup"),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: PopupExample()));
