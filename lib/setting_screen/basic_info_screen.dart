import 'package:flutter/material.dart';
class BasicInfoScreen extends StatelessWidget {
  const BasicInfoScreen({super.key});

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
            Container(width: 45),
            const Text(
              'Basic info',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          const Divider(color: Color(0xFF3628DD)),
          ListTile(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text('Hailey', style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),), // Subtitle placed in the Row
              ],
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Account Screen
            },
          ),
          const Divider(color: Color(0xFF3628DD)),
          ListTile(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Birthday',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text('12/12/2002', style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),), // Subtitle placed in the Row
              ],
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Account Screen
            },
          ),
          const Divider(color: Color(0xFF3628DD)),
          ListTile(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Gender',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text('Female', style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),), // Subtitle placed in the Row
              ],
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Account Screen
            },
          ),
          const Divider(color: Color(0xFF3628DD)),
          ListTile(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Current Location',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text('London', style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),), // Subtitle placed in the Row
              ],
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Account Screen
            },
          ),
          const Divider(color: Color(0xFF3628DD)),
        ],
      ),
    );
  }
}
