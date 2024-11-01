import 'package:flutter/material.dart';

class AboutLoveBirdScreen extends StatelessWidget {
  const AboutLoveBirdScreen({super.key});

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
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Image.asset(
                "images/ai.png",
              ),
            ),
            Container(width: 25),
            const Text(
              'About Love Bird',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Divider(
            thickness: 1.0,
            color: Color(0xFF3628DD),
          ),
          const SizedBox(
            height: 100,
          ),
          Image.asset(
            "images/LoveBird.png",
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'v1.0.43',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black.withOpacity(
                  0.5), // Adjust the opacity value between 0.0 and 1.0
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Released on - 12/12/2024',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black.withOpacity(
                  0.5), // Adjust the opacity value between 0.0 and 1.0
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'branch: release_android_6.0111',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black.withOpacity(
                  0.5), // Adjust the opacity value between 0.0 and 1.0
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            child: Center(
              child: Text(
                'Copyright 2024 Hans Technology, all rights reserved',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3628DD)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
