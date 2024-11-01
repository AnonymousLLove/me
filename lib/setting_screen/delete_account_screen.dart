import 'package:love_bird/setting_screen/account_delete_successful_screen.dart';
import 'package:flutter/material.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  // Individual bool variables for each checkbox
  bool isCheckedNoLongerInterested = false;
  bool isCheckedPersonalReasons = false;
  bool isCheckedAppNotExpected = false;
  bool isCheckedRatherNotSay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            Container(width: 45),
            const Text(
              'Delete Account',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Why do you want to delete your account?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),

                // Checkbox 1
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'I am no longer interested',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Checkbox(
                      value: isCheckedNoLongerInterested,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isCheckedNoLongerInterested = newValue!;
                        });
                      },
                    ),
                  ],
                ),

                // Checkbox 2
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Personal reasons',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Checkbox(
                      value: isCheckedPersonalReasons,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isCheckedPersonalReasons = newValue!;
                        });
                      },
                    ),
                  ],
                ),

                // Checkbox 3
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'The app isn’t what I expected',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Checkbox(
                      value: isCheckedAppNotExpected,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isCheckedAppNotExpected = newValue!;
                        });
                      },
                    ),
                  ],
                ),

                // Checkbox 4
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'I’d rather not say',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Checkbox(
                      value: isCheckedRatherNotSay,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isCheckedRatherNotSay = newValue!;
                        });
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 8.0),
              ],
            ),
          ),
          const SizedBox(height: 150),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Action when deleting the account
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const AccountDeleteSuccessfulScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3628DD),
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text(
                  'Delete account',
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
