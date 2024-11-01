import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final String assetImage;
  final String title;
  final String message;
  final String time;
  final VoidCallback onDelete;

  const NotificationItem({
    super.key,
    required this.assetImage,
    required this.title,
    required this.message,
    required this.time,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              assetImage,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
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
                const SizedBox(height: 5),
                Text(
                  message,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 5),
                Text(
                  time,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Today',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          NotificationItem(
            assetImage: 'homeImage.png', // Local asset image
            title: 'New Match Alert!',
            message:
                'You have got a new match waiting to connect with you. Start a conversation now.',
            time: '10:00am',
            onDelete: () {
              // Handle delete action
            },
          ),
          const Text(
            'Yesterday',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          NotificationItem(
            assetImage: 'homeImage.png', // Local asset image
            title: 'New Match Alert!',
            message:
                'You have got a new match waiting to connect with you. Start a conversation now.',
            time: '10:00am',
            onDelete: () {
              // Handle delete action
            },
          ),
          NotificationItem(
            assetImage: 'homeImage.png', // Local asset image
            title: 'New Match Alert!',
            message:
                'You have got a new match waiting to connect with you. Start a conversation now.',
            time: '10:00am',
            onDelete: () {
              // Handle delete action
            },
          ),
          // Add more NotificationItem widgets as needed
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), label: 'People Nearby'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Matches'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class PurchaseCreditsPage extends StatelessWidget {
  const PurchaseCreditsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Go back
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            const Icon(Icons.android, size: 40, color: Colors.deepPurple),
            const SizedBox(height: 16.0),
            const Text(
              "Get more messages, matches, and get to the top at one click!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: const [
                  // First Row (50 credits, N500.00)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CreditOption(
                        credits: '50 credits',
                        price: 'N500.00',
                        description: 'Send up to 15 messages',
                      ),
                      CreditOption(
                        credits: '150 credits',
                        price: 'N1,100',
                        description:
                            'Send up to 25 messages, and get more chances to be matched instantly',
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  // Second Row (200 credits, N1600)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CreditOption(
                        credits: '200 credits',
                        price: 'N1,600',
                        description:
                            'Send up to 30 messages, get more chances to be matched instantly, and appear at the top on people nearby',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Buttons at the bottom
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle continue action
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: Colors.deepPurple, // Background color
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Handle close action
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor:
                        Colors.deepPurple.shade100, // Background color
                  ),
                  child: const Text(
                    'Close',
                    style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CreditOption extends StatelessWidget {
  final String credits;
  final String price;
  final String description;

  const CreditOption({
    super.key,
    required this.credits,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepPurple),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              credits,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            price,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proffile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  // Profile picture
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      'assets/profile_image.jpg', // Path to the profile image
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Daniel, 31",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Icon(Icons.male, color: Colors.purple),
                    ],
                  ),
                  const Text(
                    "Man",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Profile action button (chat icon)
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.deepPurpleAccent.withOpacity(0.1),
                    child:
                        const Icon(Icons.chat_bubble, color: Colors.deepPurple),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            // Profile details
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Biiio',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Fun & interesting',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const ProfileDetail(
              icon: Icons.height,
              title: "145cm 65kg",
            ),
            const ProfileDetail(
              icon: Icons.work,
              title: "Banker at Citi Bank",
            ),
            const ProfileDetail(
              icon: Icons.school,
              title: "University of Leeds, UK",
            ),
            const ProfileDetail(
              icon: Icons.home,
              title: "Lives in New London",
            ),
            const ProfileDetail(
              icon: Icons.location_on,
              title: "25km away",
            ),
            const SizedBox(height: 20.0),
            // Relationship basics
            const Text(
              'My relationship Basics',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const RelationshipOption(
              title: 'Friendship',
              icon: Icons.people,
              color: Colors.pinkAccent,
            ),
            const SizedBox(height: 20),
            // Interests
            const Text(
              'Interests',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Wrap(
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
            const SizedBox(height: 20),
          ],
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
          Icon(icon, color: Colors.purple),
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
          Icon(icon, color: color),
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
          Icon(icon, color: color),
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
