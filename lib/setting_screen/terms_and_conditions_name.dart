import 'package:flutter/material.dart';

class TermsAndConditionsNameScreen extends StatefulWidget {
  const TermsAndConditionsNameScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TermsAndConditionsNameScreenState createState() =>
      _TermsAndConditionsNameScreenState();
}

class _TermsAndConditionsNameScreenState
    extends State<TermsAndConditionsNameScreen> {
  bool marketingPermission = false;

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
        title: const Text('Terms and Conditions',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Image.asset(
              "images/ai.png",
            ),
          ),
        ],
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Divider(color: Color(0xFF3628DD),),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
          )
                  ],
                ),
            );
  }
    }
          