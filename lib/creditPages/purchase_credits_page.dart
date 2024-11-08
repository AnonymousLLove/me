import 'package:flutter/material.dart';
import 'package:love_bird/config/routes.dart';

import 'package:love_bird/homeScreen/homescreen.dart';

class PurchaseCreditsPage extends StatelessWidget {
  const PurchaseCreditsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color blue = Color.fromRGBO(54, 40, 221, 1.0);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0, right: 16, left: 16),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back,
                      color: Colors.black, size: 40),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  },
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, chatbotWelcomeScreen);
                  },
                  child: Image.asset(
                    'assets/images/robot.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),

            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Get more messages, matches, and get to the top at one click!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: blue),
              ),
            ),
            const SizedBox(height: 10.0),
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
                      Spacer(),
                      CreditOption(
                        credits: '150 credits',
                        price: 'N1,100',
                        description:
                            'Send up to 25 messages, and get more chances to be matched instantly',
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0),
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
                      backgroundColor: blue // Background color
                      ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    ); // Handle close action
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor:
                        Colors.deepPurple.shade100, // Background color
                  ),
                  child: const Text(
                    'Close',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
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
    const Color blue = Color.fromRGBO(54, 40, 221, 1.0);
    return Stack(
      clipBehavior: Clip.none, // Allow overflow
      alignment:
          Alignment.topCenter, // Aligns the "200 credits" to the top center
      children: [
        // Main container for N1,600, description, etc.
        Container(
          width: 140,
          height: 150,
          padding: const EdgeInsets.only(top: 40, bottom: 20),
          decoration: BoxDecoration(
            border: Border.all(
              color: blue, // Your color
              width: 2.0, // Adjust this value to make the border thicker
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //  SizedBox(height: 20), // Spacer for the stacked "200 credits"
              Text(
                price,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromRGBO(149, 140, 250, 1),
                  fontSize: 8,
                ),
              ),
            ],
          ),
        ),

        // Stacked "200 credits" container
        Positioned(
          top: -10, // This aligns the container to sit on the border
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: blue,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(
              credits,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
