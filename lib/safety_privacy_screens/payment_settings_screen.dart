import 'package:flutter/material.dart';

class PaymentSettingScreen extends StatefulWidget {
  const PaymentSettingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaymentSettingScreenState createState() => _PaymentSettingScreenState();
}

class _PaymentSettingScreenState extends State<PaymentSettingScreen> {
  bool marketingPermission = false;

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
            Image.asset(
              "images/ai.png",
            ),
            const SizedBox(width: 25),
            const Text(
              'Payment settings',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // First Container
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: const Color(0xFF3628DD)),
              ),
              child: const Text(
                'Love bird premium: Activated',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Second Container with Switch
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: const Color(0xFF3628DD)),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: const Text(
                      'Auto refill',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text(
                      'Save time! select auto refill to recharge when your balance falls below 200 credits.',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    trailing: Transform.scale(
                      scale: 0.65,
                      child: Switch(
                        value: marketingPermission,
                        onChanged: (value) {
                          setState(() {
                            marketingPermission = value;
                          });
                        },
                        activeColor: const Color(0xFF3628DD),
                        activeTrackColor: Colors.white,
                        inactiveThumbColor: Colors.grey,
                        inactiveTrackColor: Colors.grey[200],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Third Container with Arrow Forward Icon and Clickable
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: const Color(0xFF3628DD)),
              ),
              child: InkWell(
                onTap: () {
                  // Add your navigation or functionality here
                  // print("Love bird premium tapped");
                },
                child: const Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Love bird premium:',
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        'Terms and conditions',
                        style:
                            TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                  ],
                ),
              ),
            ),

            // Fourth Container with Arrow Forward Icon and Clickable
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: const Color(0xFF3628DD)),
              ),
              child: InkWell(
                onTap: () {
                  // Add your navigation or functionality here
                  // print("Credits tapped");
                },
                child: const Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Credits',
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        'Terms and conditions',
                        style:
                            TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
