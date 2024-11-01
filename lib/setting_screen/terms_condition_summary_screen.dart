import 'package:flutter/material.dart';

class TermsAndConditionsSummaryScreen extends StatefulWidget {
  const TermsAndConditionsSummaryScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TermsAndConditionsSummaryScreenState createState() =>
      _TermsAndConditionsSummaryScreenState();
}

class _TermsAndConditionsSummaryScreenState
    extends State<TermsAndConditionsSummaryScreen> {
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
        title: const Text('Terms and Conditions Summary',
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
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0), // Add padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(color: Color(0xFF3628DD),),
            const Center(
              child: Text(
                'Love Bird Terms of Use and Privacy Policy',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 8.0), // Space before the next text
            const Text(
              'By using this app you agree to Love Bird’s Terms and Conditions and confirm that you are 18 or older.',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16.0), // Space before the main points
            const Text(
              'The main points are:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8.0), // Space before the numbered list
            // Numbered list with specified items
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Total number of main points
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getListItemText(index + 1), // Get the appropriate text for each item
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                      // Check if it's the last item to add bullet points
                      if (index == 4) ...[
                        const SizedBox(height: 8.0), // Space before bullet points
                        _buildBulletPoint('Mislead or harass other users'),
                        _buildBulletPoint('Use Love Bird to sell any goods or services'),
                        _buildBulletPoint('Post anything insulting, illegal, obscene, or pornographic'),
                        _buildBulletPoint('Post other people’s materials or photos without their permission'),
                      ],
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getListItemText(int index) {
    switch (index) {
      case 1:
        return '1. You must be at least 18 years old.';
      case 2:
        return '2. Your profile data will be available to Love Bird users.';
      case 3:
        return '3. Love Bird will report anything illegal to the proper authorities.';
      case 4:
        return '4. Love Bird will not share your cell phone number or email address, or sell your personal data to third parties.';
      case 5:
        return '5. Please do not:'; // Title for the bullet points
      default:
        return '';
    }
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      children: [
        const Icon(Icons.fiber_manual_record, size: 8.0), // Bullet point icon
        const SizedBox(width: 8.0), // Space between bullet and text
        Flexible(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
