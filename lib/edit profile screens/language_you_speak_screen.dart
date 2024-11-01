import 'package:love_bird/edit%20profile%20screens/relationship_screen.dart';
import 'package:flutter/material.dart';

class LanguageYouSpeakScreen extends StatefulWidget {
  const LanguageYouSpeakScreen({super.key});

  @override
  State<LanguageYouSpeakScreen> createState() => _LanguageYouSpeakScreenState();
}

class _LanguageYouSpeakScreenState extends State<LanguageYouSpeakScreen> {
  // List of items
  final List<String> items = [
    'English',
    'German',
    'French',
    'Spanish',
    'Italian',
    'Portuguese',
    'Russian',
    'Chinese',
  ];

  // List to keep track of selected items
  List<bool> selectedItems = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  void initState() {
    super.initState();
    // Initialize selectedItems with the same length as items
    selectedItems = List<bool>.filled(items.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            // Pop the screen when close icon is pressed
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('images/lang.png'),
            const SizedBox(height: 16),
            const Text(
              'What language(s) do you speak?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items[index]),
                    trailing: Checkbox(
                      value: selectedItems[index],
                      onChanged: (bool? value) {
                        setState(() {
                          selectedItems[index] = value!;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('(3/11)'), // Placeholder for your count logic
                InkWell(
                  onTap: () {
                    // Navigate to the next screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const RelationshipScreen(), // Replace with your next screen
                      ),
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: const Color(0xFF3628DD).withOpacity(0.19),
                    child: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
