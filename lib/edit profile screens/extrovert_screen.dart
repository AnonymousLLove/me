import 'package:love_bird/edit%20profile%20screens/education_screen.dart';
import 'package:flutter/material.dart';

class ExtrovertScreen extends StatefulWidget {
  const ExtrovertScreen({super.key});

  @override
  State<ExtrovertScreen> createState() => _ExtrovertScreenState();
}

class _ExtrovertScreenState extends State<ExtrovertScreen> {
  // List of items
  final List<String> items = [
    'Introvert',
    'Extrovert',
    'Somewhere in between',
    'Other',
  ];

  // List to keep track of selected items
  List<bool> selectedItems = [false, false, false, false];

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
      body: Column(
        children: [
          Image.asset('images/extrovert.png'),
          const Text(
            'Are you an introvert or an extrovert?',
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
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('(10/11)'),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EducationScreen()),
                  );
                },
                child: CircleAvatar(
                  backgroundColor: const Color(0xFF3628DD).withOpacity(0.19),
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
