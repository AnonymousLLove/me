import 'package:flutter/material.dart';

class CallScreen extends StatelessWidget {
  final String name;
  final String profileImage;
  final String callDuration; // For showing the call duration

  const CallScreen({
    super.key,
    required this.name,
    required this.profileImage,
    required this.callDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/callbackground.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Profile image and name
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(profileImage),
                ),
                const SizedBox(height: 20),
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  callDuration,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 16,
                  ),
                ),
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
                  color: const Color.fromRGBO(149, 140, 250, 1),
                  onPressed: () {
                    // Handle speaker action
                  },
                ),
                _buildControlButton(
                  icon: Icons.mic,
                  color: const Color.fromRGBO(149, 140, 250, 1),
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
              icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
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
}
