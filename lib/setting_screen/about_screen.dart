import 'package:love_bird/setting_screen/about_love_bird_screen.dart';
import 'package:love_bird/setting_screen/privacy_setting_name.dart';
import 'package:love_bird/setting_screen/terms_and_conditions_name.dart';
import 'package:love_bird/setting_screen/terms_condition_summary_screen.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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
              child: Image.asset("images/ai.png"),
            ),
            Container(width: 50),
            const Text(
              'About',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const Divider(
              color: Color(0xFF3628DD)), // Divider at the top of the first item
          Expanded(
            child: ListView.builder(
              itemCount: 4, // Total number of items
              itemBuilder: (context, index) {
                String title;
                String? subtitle;

                switch (index) {
                  case 0:
                    title = 'Terms and Conditions Summary';
                    break;
                  case 1:
                    title = 'Terms and Conditions';
                    break;
                  case 2:
                    title = 'Privacy';
                    break;
                  case 3:
                    title = 'About Lovebird';
                    subtitle = 'v1.0.45';
                    break;
                  default:
                    title = '';
                }

                return Column(
                  children: [
                    index == 3
                        ? _buildLastItem(
                            title: title, context: context, subtitle: subtitle!)
                        : _buildItem(
                            title: title, context: context, index: index),
                    const Divider(
                        thickness: 1.0,
                        color: Color(0xFF3628DD)), // Divider between items
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
      {required String title,
      required BuildContext context,
      required int index}) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        switch (index) {
          case 0:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const TermsAndConditionsSummaryScreen()));
            break;
          case 1:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const TermsAndConditionsNameScreen()));
            break;
          case 2:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PrivacyNameOnSettingsScreen()));
            break;
        }
      },
    );
  }

  Widget _buildLastItem({
    required String title,
    required String subtitle,
    required BuildContext context,
  }) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AboutLoveBirdScreen(),
          ),
        );
      },
    );
  }
}
