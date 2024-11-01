import 'package:flutter/material.dart';

class BlockedUsersScreen extends StatelessWidget {
  const BlockedUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
            Container(width: 20),
            const Text(
              'Blocked Users',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const Divider(thickness: 1.0, color: Color(0xFF3628DD)), // Divider at the top
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Adjust based on the number of items
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    _buildItem(
                      imageUrl: 'images/blockeduser.png', // Replace with your image path
                      title: 'Johnny',
                      subtitle: 'Unblock',
                    ),
                    const Divider(thickness: 1.0, color: Color(0xFF3628DD)), // Divider between items
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem({required String imageUrl, required String title, required String subtitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image and text on the left
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(imageUrl), // Circular image
                radius: 25.0, // Adjust size as needed
              ),
              const SizedBox(width: 16.0), // Space between image and text
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          // Text aligned to the right
          Text(
            subtitle,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF3628DD)),
          ),
        ],
      ),
    );
  }
}
