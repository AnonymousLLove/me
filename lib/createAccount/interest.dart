import 'package:flutter/material.dart';
import 'package:love_bird/config/routes.dart';
import 'package:love_bird/providers/interest_provider.dart';
import 'package:provider/provider.dart';

class InterestsSelectionScreen extends StatelessWidget {
  const InterestsSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final interestsProvider = Provider.of<InterestsProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal:
                MediaQuery.of(context).size.width * 0.05, // 5% of screen width
            vertical: MediaQuery.of(context).size.height *
                0.02, // 5% of screen height
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Your existing UI components
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 15,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        color: const Color(0xFF3628DD).withOpacity(0.19),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        color: const Color(0xFF3628DD),
                      ),
                    ),
                  ],
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
                onChanged: interestsProvider.onSearchQueryChanged,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(149, 140, 250, 0.48),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search Interest",
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                ),
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 15.0,
                runSpacing: 15.0,
                children: interestsProvider.filteredInterests.map((interest) {
                  bool isSelected =
                      interestsProvider.selectedInterests.contains(interest);
                  return ChoiceChip(
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          interestsProvider.interestIcons[interest]!,
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
                      interestsProvider.toggleInterest(interest);
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
                onPressed: interestsProvider.selectedInterests.isNotEmpty
                    ? () {
                        Navigator.pushNamed(context, uploadPicturesScreen);
                      }
                    : null,
                child: Text(
                  "Continue (${interestsProvider.selectedInterests.length}/6)",
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
