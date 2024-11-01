import 'package:flutter/material.dart';
import 'package:love_bird/createAccount/sixphoto.dart';

class InterestsSelectionScreen extends StatefulWidget {
  const InterestsSelectionScreen({super.key});

  @override
  _InterestsSelectionScreenState createState() =>
      _InterestsSelectionScreenState();
}

class _InterestsSelectionScreenState extends State<InterestsSelectionScreen> {
  List<String> interests = [
    'Travel',
    'Cooking',
    'Hiking',
    'Yoga',
    'Gaming',
    'Movies',
    'Photography',
    'Music',
    'Pets',
    'Painting',
    'Art',
    'Fitness',
    'Reading',
    'Dancing',
    'Sport',
    'Board games',
    'Technology',
    'Fashion',
    'Motorcycling'
  ];

  List<String> selectedInterests = [];

  final Map<String, String> interestIcons = {
    'Travel': 'assets/images/icons/interest/travel.png', // Path to travel image
    'Cooking':
        'assets/images/icons/interest/cooking.png', // Path to cooking image
    'Hiking': 'assets/images/icons/interest/hiking.png', // Path to hiking image
    'Yoga': 'assets/images/icons/interest/yoga.png', // Path to yoga image
    'Gaming': 'assets/images/icons/interest/gaming.png', // Path to gaming image
    'Movies': 'assets/images/icons/interest/movies.png', // Path to movies image
    'Photography':
        'assets/images/icons/interest/photography.png', // Path to photography image
    'Music': 'assets/images/icons/interest/music.png', // Path to music image
    'Pets': 'assets/images/icons/interest/pets.png', // Path to pets image
    'Painting':
        'assets/images/icons/interest/painting.png', // Path to painting image
    'Art': 'assets/images/icons/interest/art.png', // Path to art image
    'Fitness':
        'assets/images/icons/interest/fitness.png', // Path to fitness image
    'Reading':
        'assets/images/icons/interest/reading.png', // Path to reading image
    'Dancing':
        'assets/images/icons/interest/dancing.png', // Path to dancing image
    'Sport': 'assets/images/icons/interest/sports.png', // Path to sport image
    'Board games':
        'assets/images/icons/interest/board_games.png', // Path to board games image
    'Technology':
        'assets/images/icons/interest/technology.png', // Path to technology image
    'Fashion':
        'assets/images/icons/interest/fashion.png', // Path to fashion image
    'Motorcycling':
        'assets/images/icons/interest/motorcycling.png', // Path to motorcycling image
  };

  void toggleInterest(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else if (selectedInterests.length < 6) {
        selectedInterests.add(interest);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value: 0.6,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(54, 40, 221, 1),
                  ),
                  minHeight: 8,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                const Text(
                  'Discover Like-Minded People',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 2),
                Image.asset('assets/images/icons/smile.png', width: 30),
              ],
            ),
            const SizedBox(height: 5),
            const Text(
              "Share your interests, passions, hobbies. We'll connect you with people who share your enthusiasm.",
              style: TextStyle(fontSize: 19),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search Interest",
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 30),
            Wrap(
              spacing: 15.0,
              runSpacing: 15.0,
              children: interests.map((interest) {
                bool isSelected = selectedInterests.contains(interest);
                return ChoiceChip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        interestIcons[interest]!,
                        width: 18,
                        height: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        interest,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  selected: isSelected,
                  onSelected: (selected) {
                    toggleInterest(interest);
                  },
                  selectedColor: const Color.fromRGBO(54, 40, 221, 1),
                  backgroundColor: Colors.white,
                  shape: const StadiumBorder(
                    side: BorderSide(
                      color: Color.fromRGBO(54, 40, 221, 1),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 80),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(54, 40, 221, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: selectedInterests.isNotEmpty
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UploadPicturesScreen()),
                      );
                    }
                  : null,
              child: Text(
                "Continue (${selectedInterests.length}/6)",
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            // Space above the button
          ],
        ),
      ),
      // Continue button at the bottom
    );
  }
}
