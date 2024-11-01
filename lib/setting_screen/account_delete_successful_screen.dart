import 'package:flutter/material.dart';

class AccountDeleteSuccessfulScreen extends StatefulWidget {
  const AccountDeleteSuccessfulScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AccountDeleteSuccessfulScreenState createState() =>
      _AccountDeleteSuccessfulScreenState();
}

class _AccountDeleteSuccessfulScreenState
    extends State<AccountDeleteSuccessfulScreen> {
  bool marketingPermission = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // This removes the back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your UI elements here
            const Center(
              child: Text(
                'We hate to see you leave',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Image.asset('images/crying-emoji.gif'),
              
              // Image.network(
              //   'https://media.tenor.com/yoMMbzDjFl4AAAAj/crying-emoji.gif',
              //   fit: BoxFit.cover,
              // ),
            ),

            const SizedBox(
              height: 100,
            ),

            const Center(
              child: Text(
                'Account deleted successfully!',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF3628DD)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'You can come back anytime!',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
