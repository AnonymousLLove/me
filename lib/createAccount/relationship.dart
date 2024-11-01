import 'package:flutter/material.dart';
import 'package:love_bird/createAccount/location.dart';

class RelationshipGoalsScreen extends StatefulWidget {
  const RelationshipGoalsScreen({super.key});

  @override
  _RelationshipGoalsScreenState createState() =>
      _RelationshipGoalsScreenState();
}

class _RelationshipGoalsScreenState extends State<RelationshipGoalsScreen> {
  String? selectedGoal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        height: 25,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: LinearProgressIndicator(
                            value: 0.4, // Simulating progress
                            backgroundColor: Colors.grey[300],
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color.fromRGBO(54, 40, 221, 1),
                            ),
                            minHeight: 8,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const Text(
                            'Your Relationship Goals',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            // Optional: add ellipsis for long text
                          ),
                          const SizedBox(
                              width:
                                  8), // Add some spacing between text and image
                          Image.asset(
                            'assets/images/icons/love.png',
                            height: 50,
                            width: 30,
                          ),
                        ],
                      ),
                    ),

                    // SizedBox(height: 5),
                    const Text(
                      'Choose the type of relationship you are seeking on Love Bird. Love, friendship, or something in between. It’s your choice.',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    const SizedBox(height: 20),
                    // Dating Option
                    RelationshipOption(
                      label: "Dating",
                      description:
                          "Seeking love and meaningful connections? Choose dating for genuine relationships",
                      image: 'assets/images/icons/couple.png',
                      selected: selectedGoal == 'Dating',
                      onTap: () {
                        setState(() {
                          selectedGoal = 'Dating';
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    // Friendship Option
                    RelationshipOption(
                      label: "Friendship",
                      description:
                          "Expand your social circle and make new friends. Opt for friendship today.",
                      image: 'assets/images/icons/friend.png',
                      selected: selectedGoal == 'Friendship',
                      onTap: () {
                        setState(() {
                          selectedGoal = 'Friendship';
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    // Casual Option
                    RelationshipOption(
                      label: "Casual",
                      description:
                          "Looking for fun and relaxed encounters? Select casual for carefree connections.",
                      image: 'assets/images/icons/casual.png',
                      selected: selectedGoal == 'Casual',
                      onTap: () {
                        setState(() {
                          selectedGoal = 'Casual';
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    // Serious Relationship Option
                    RelationshipOption(
                      label: "Serious Relationship",
                      description:
                          "Ready for a commitment and a lasting partnership? Pick serious relationship.",
                      image: 'assets/images/icons/couple.png',
                      selected: selectedGoal == 'Serious Relationship',
                      onTap: () {
                        setState(() {
                          selectedGoal = 'Serious Relationship';
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Continue Button fixed at the bottom
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DistancePreferenceScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(
                    54, 40, 221, 1), // Set the blue background color
                foregroundColor: Colors.white, // Text color
                minimumSize:
                    const Size(double.infinity, 50), // Full-width button
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20), // Optional: Rounded corners
                ),
              ),
              child: Text('Continue',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }
}

class RelationshipOption extends StatelessWidget {
  final String label;
  final String description;
  final String image;
  final bool selected;
  final VoidCallback onTap;

  const RelationshipOption({
    super.key,
    required this.label,
    required this.description,
    required this.image,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? Colors.blue[100] : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(54, 40, 221, 1),
              spreadRadius: 2,
            ),
          ],
          border: Border.all(
            color: selected ? Colors.blue : Colors.grey[300]!,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              Image.asset(image, width: 30),
            ]),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
