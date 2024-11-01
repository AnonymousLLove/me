import 'package:flutter/material.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HelpCenterScreenState createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
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
              'Help Center',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(color: Color(0xFF3628DD)),
          const SizedBox(height: 5.0), // Space after the divider
          _buildSearchBar(), // Search bar
          const SizedBox(height: 10.0), // Space after the search bar
          // const SizedBox(height: 8.0), // Space before the list
          Expanded(
            child: ListView(
              children: const [
                ListTile(title: Text('Popular questions', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)),
                ListTile(title: Text('About Love Bird', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)),
                ListTile(title: Text('Profile', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)),
                ListTile(title: Text('Profile verification', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)),
                ListTile(title: Text('People nearby and search', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)),
                ListTile(title: Text('Home', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)),
                ListTile(title: Text('Messages', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)),
                ListTile(title: Text('Love Bird premium', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)),
                ListTile(title: Text('Credits', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)),
                ListTile(title: Text('Photos', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)),
                ListTile(title: Text('Settings and privacy', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20.0),
  child: SizedBox(
    height: MediaQuery.of(context).size.height * 0.05,
    child: TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF3628DD).withOpacity(0.19), // Background color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), // Rounded corners
          borderSide: BorderSide.none, // No border
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), // Rounded corners
          borderSide: BorderSide.none, // No border when enabled
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), // Rounded corners
          borderSide: BorderSide.none, // No border when focused
        ),
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 30.0, // Padding inside the search bar
        ),
      ),
    ),
  ),
);

  }
}
