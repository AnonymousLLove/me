import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// class StandardPlan extends StatefulWidget {
//   const StandardPlan({super.key});

//   @override
//   State<StandardPlan> createState() => _StandardPlanState();
// }

// class _StandardPlanState extends State<StandardPlan> {
//   String _appBarTitle = 'Standard'; // Default title

//   void _onTabChanged(int index) {
//     setState(() {
//       _appBarTitle = index == 0
//           ? 'Standard' // Title for Standard Tab
//           : 'Premium'; // Title for Premium Tab
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2, // Number of tabs (Standard and Premium)
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text(
//             _appBarTitle,
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//           ),
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           actions: [
//             Padding(
//               padding: const EdgeInsets.only(right: 10.0),
//               child: Image.asset("images/ai.png"),
//             ),
//           ],
//         ),
//         body: Flexible(
//           child: Column(
//             children: [
//               // TabBar for Standard and Premium
//               Container(
//                 color: const Color(0xFF3628DD),
//                 child: TabBar(
//                   onTap: _onTabChanged, // Listen for tab changes
//                   labelColor: Colors.white,
//                   unselectedLabelColor: Colors.white,
//                   indicatorColor: Colors.white,
//                   indicatorWeight: 3.0,
//                   tabs: const [
//                     Tab(text: 'Standard'),
//                     Tab(text: 'Premium'),
//                   ],
//                 ),
//               ),
//               const Expanded(
//                 child: TabBarView(
//                   children: [
//                     // Standard Page
//                     StandardTab(),
//                     // Premium Page
//                     PremiumTab(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Ensure to import your PremiumTab widget

// Ensure to import your PremiumTab widget

class StandardPlan extends StatefulWidget {
  const StandardPlan({super.key});

  @override
  State<StandardPlan> createState() => _StandardPlanState();
}

class _StandardPlanState extends State<StandardPlan> {
  String _appBarTitle = 'Standard'; // Default title

  void _onTabChanged(int index) {
    setState(() {
      _appBarTitle = index == 0
          ? 'Standard'
          : 'Premium'; // Update title based on selected tab
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs (Standard and Premium)
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            _appBarTitle,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Image.asset("images/ai.png"),
            ),
          ],
        ),
        body: Column(
          children: [
            // TabBar for Standard and Premium
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.transparent,
              child: TabBar(
                onTap: _onTabChanged, // Listen for tab changes
                labelColor: Colors.white, // Text color for the active tab
                unselectedLabelColor:
                    Colors.white, // Text color for the inactive tab
                indicator: BoxDecoration(
                  color: const Color(
                      0xFF3628DD), // Background color for the active tab
                  borderRadius:
                      BorderRadius.circular(10), // Shape for active tab
                ),
                tabs: [
                  Tab(
                    child: Container(
                      width: 150, // Ensures consistent width
                      height: 35, // Ensures consistent height
                      alignment: Alignment.center, // Centers the text
                      decoration: BoxDecoration(
                        color: const Color(0xFF3628DD)
                            .withOpacity(0.6), // Inactive tab background
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text('Standard'),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 150, // Ensures consistent width
                      height: 35, // Ensures consistent height
                      alignment: Alignment.center, // Centers the text
                      decoration: BoxDecoration(
                        color: const Color(0xFF3628DD)
                            .withOpacity(0.6), // Inactive tab background
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text('Premium'),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  StandardTab(), // Make sure this widget is defined and imported
                  PremiumTab(), // Make sure this widget is defined and imported
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StandardTab extends StatelessWidget {
  const StandardTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> containers = [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Curved edges
          color: Colors.transparent, // Background color (optional)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'images/message.png',
                ), // First image
                const SizedBox(height: 5),
                const Text(
                  'Send unlimited messages ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Send messages to everyone on your list\nwithout restrictions',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Curved edges
          color: Colors.transparent, // Background color (optional)
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/goodbye.png',
              ), // Second image
              const SizedBox(height: 5),
              const Text(
                'Say goodbye to ads',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 2),
              const Text(
                'Turn off all ads shown on the app.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Curved edges
          color: Colors.transparent, // Background color (optional)
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/threetimes.png',
              ), // Third image
              const SizedBox(height: 5),
              const Text(
                'Get 3 times more matches',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 2),
              const Text(
                'Get more chances to be matched with your favourite people.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Curved edges
          color: Colors.transparent, // Background color (optional)
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/undo.png',
              ), // Third image
              const SizedBox(height: 5),
              const Text(
                'Undo accidental left swipes',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 2),
              const Text(
                'You can undo a left swipe.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Curved edges
          color: Colors.transparent, // Background color (optional)
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/bonus.png',
              ), // Third image
              const SizedBox(height: 5),
              const Text(
                'Bonus credit on credit purchases in app',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 2),
              const Text(
                'Get up to 25% more credit on all credit purchases',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Curved edges
          color: Colors.transparent, // Background color (optional)
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/pushmessage.png',
              ), // Third image
              const SizedBox(height: 5),
              const Text(
                'Push your messages to the top of the recipient’s inbox',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 2),
              const Text(
                'Be the first on their list when you send a message',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Curved edges
          color: Colors.transparent, // Background color (optional)
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/visibility.png',
              ), // Third image
              const SizedBox(height: 5),
              const Text(
                'Get more visibility',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 2),
              const Text(
                'Get 3 times more visibility when you subscribe to premium',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Curved edges
          color: Colors.transparent, // Background color (optional)
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/language.png',
              ), // Third image
              const SizedBox(height: 5),
              const Text(
                'Instantly translate other languages to English',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 2),
              const Text(
                'Chat with diverse tribes of the world and have it translated to English',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Curved edges
          color: Colors.transparent, // Background color (optional)
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/like.png',
              ), // Third image
              const SizedBox(height: 5),
              const Text(
                'Unlock the people who already sent you a like',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 2),
              const Text(
                'See everyone that already liked you instantly!',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
      Container(
        // width: MediaQuery.of(context).size.width,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Curved edges
          color: Colors.transparent, // Background color (optional)
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/privately.png',
              ), // Third image
              const SizedBox(height: 5),
              const Text(
                'Browse profiles privately, hide your profile for everyone except your existing matches',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 2),
              const Text(
                'Chat with diverse tribes of the world and have it translated to English',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 110, // Adjust the height as needed
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
            ),
            items: containers.map((item) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0), // Curved edges
                  child: item, // Use the container directly
                ),
              );
            }).toList(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Main container
                      Container(
                        width: 135,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0xFF3628DD),
                            width: 3,
                          ),
                        ),
                        child: const Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '₦1,200.00',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text(
                                  'This plan expires in 14 days',
                                  style: TextStyle(
                                      color: Color(0xFF958CFA), fontSize: 9),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Smaller container on top border
                      Positioned(
                        top: -15, // Position it above the main container
                        left: 25, // Adjust left position if needed
                        child: Container(
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                            color: const Color(0xFF3628DD),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: const Color(0xFF3628DD),
                              width: 2,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              '2 weeks',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20), // Space between containers

                  // Second Container with another container on top
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Main container
                      Container(
                        width: 135,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0xFF3628DD),
                            width: 3,
                          ),
                        ),
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '₦2,000.00',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text(
                                  'This plan expires in 30 days',
                                  style: TextStyle(
                                      color: Color(0xFF958CFA), fontSize: 9),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Smaller container on top border
                      Positioned(
                        top: -15, // Position it above the main container
                        left: 25, // Adjust left position if needed
                        child: Container(
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                            color: const Color(0xFF3628DD),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: const Color(0xFF3628DD),
                              width: 2,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              '1 month',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Main container
                      Container(
                        width: 135,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0xFF3628DD),
                            width: 3,
                          ),
                        ),
                        child: const Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '₦10,000.00',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text(
                                  'This plan expires in 180 days',
                                  style: TextStyle(
                                      color: Color(0xFF958CFA), fontSize: 9),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Smaller container on top border
                      Positioned(
                        top: -15, // Position it above the main container
                        left: 25, // Adjust left position if needed
                        child: Container(
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                            color: const Color(0xFF3628DD),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: const Color(0xFF3628DD),
                              width: 2,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              '6 months',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20), // Space between containers

                  // Second Container with another container on top
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Main container
                      Container(
                        width: 135,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0xFF3628DD),
                            width: 3,
                          ),
                        ),
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '₦20,000.00',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'This plan expires in 365 days',
                                style: TextStyle(
                                    color: Color(0xFF958CFA), fontSize: 9),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Smaller container on top border
                      Positioned(
                        top: -15, // Position it above the main container
                        left: 25, // Adjust left position if needed
                        child: Container(
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                            color: const Color(0xFF3628DD),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: const Color(0xFF3628DD),
                              width: 2,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              '1 year',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3628DD),
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text(
                      'Get Now',
                      style: TextStyle(color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPremiumPlans() {
    return const Center(
      child: Text('Premium plan coming soon'),
    );
  }

  Widget buildSubscriptionCard(String duration, String price) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              duration,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              price,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

// Premium Tab Section

class PremiumTab extends StatelessWidget {
  const PremiumTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> containers = [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Curved edges
          color: Colors.transparent, // Background color (optional)
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/message.png',
              ), // First image
              const SizedBox(height: 5),
              const Text(
                'Send unlimited messages ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 2),
              const Text(
                'Send messages to everyone on your list\nwithout restrictions',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Curved edges
          color: Colors.transparent, // Background color (optional)
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/goodbye.png',
              ), // Second image
              const SizedBox(height: 5),
              const Text(
                'Say goodbye to ads',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 2),
              const Text(
                'Turn off all ads shown on the app.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Curved edges
          color: Colors.transparent, // Background color (optional)
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/threetimes.png',
              ), // Third image
              const SizedBox(height: 5),
              const Text(
                'Get 3 times more matches',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 2),
              const Text(
                'Get more chances to be matched with your favourite people.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Curved edges
          color: Colors.transparent, // Background color (optional)
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/undo.png',
              ), // Third image
              const SizedBox(height: 5),
              const Text(
                'Undo accidental left swipes',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 2),
              const Text(
                'You can undo a left swipe.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Curved edges
          color: Colors.transparent, // Background color (optional)
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/bonus.png',
              ), // Third image
              const SizedBox(height: 5),
              const Text(
                'Bonus credit on credit purchases in app',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 2),
              const Text(
                'Get up to 25% more credit on all credit purchases',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Curved edges
          color: Colors.transparent, // Background color (optional)
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/pushmessage.png',
              ), // Third image
              const SizedBox(height: 5),
              const Text(
                'Push your messages to the top of the recipient’s inbox',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 2),
              const Text(
                'Be the first on their list when you send a message',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Curved edges
          color: Colors.transparent, // Background color (optional)
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/visibility.png',
              ), // Third image
              const SizedBox(height: 5),
              const Text(
                'Get more visibility',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 2),
              const Text(
                'Get 3 times more visibility when you subscribe to premium',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Curved edges
          color: Colors.transparent, // Background color (optional)
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/language.png',
              ), // Third image
              const SizedBox(height: 5),
              const Text(
                'Instantly translate other languages to English',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 2),
              const Text(
                'Chat with diverse tribes of the world and have it translated to English',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Curved edges
          color: Colors.transparent, // Background color (optional)
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/like.png',
              ), // Third image
              const SizedBox(height: 5),
              const Text(
                'Unlock the people who already sent you a like',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 2),
              const Text(
                'See everyone that already liked you instantly!',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Curved edges
          color: Colors.transparent, // Background color (optional)
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/privately.png',
              ), // Third image
              const SizedBox(height: 5),
              const Text(
                'Browse profiles privately, hide your profile for everyone except your existing matches',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 2),
              const Text(
                'Chat with diverse tribes of the world and have it translated to English',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 110, // Adjust the height as needed
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
            ),
            items: containers.map((item) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0), // Curved edges
                  child: item, // Use the container directly
                ),
              );
            }).toList(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Main container
                      Container(
                        width: 135,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0xFF3628DD),
                            width: 3,
                          ),
                        ),
                        child: const Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '₦2,000.00',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'This plan expires in 14 days',
                                style: TextStyle(
                                    color: Color(0xFF958CFA), fontSize: 9),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Smaller container on top border
                      Positioned(
                        top: -15, // Position it above the main container
                        left: 25, // Adjust left position if needed
                        child: Container(
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                            color: const Color(0xFF3628DD),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: const Color(0xFF3628DD),
                              width: 2,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              '2 weeks',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20), // Space between containers

                  // Second Container with another container on top
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Main container
                      Container(
                        width: 135,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0xFF3628DD),
                            width: 3,
                          ),
                        ),
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '₦4,000.00',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'This plan expires in 30 days',
                                style: TextStyle(
                                    color: Color(0xFF958CFA), fontSize: 9),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Smaller container on top border
                      Positioned(
                        top: -15, // Position it above the main container
                        left: 25, // Adjust left position if needed
                        child: Container(
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                            color: const Color(0xFF3628DD),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: const Color(0xFF3628DD),
                              width: 2,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              '1 month',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Main container
                      Container(
                        width: 135,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0xFF3628DD),
                            width: 3,
                          ),
                        ),
                        child: const Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '₦22,000.00',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'This plan expires in 180 days',
                                style: TextStyle(
                                    color: Color(0xFF958CFA), fontSize: 9),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Smaller container on top border
                      Positioned(
                        top: -15, // Position it above the main container
                        left: 25, // Adjust left position if needed
                        child: Container(
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                            color: const Color(0xFF3628DD),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: const Color(0xFF3628DD),
                              width: 2,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              '6 months',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20), // Space between containers

                  // Second Container with another container on top
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Main container
                      Container(
                        width: 135,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0xFF3628DD),
                            width: 3,
                          ),
                        ),
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '₦42,000.00',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'This plan expires in 365 days',
                                style: TextStyle(
                                    color: Color(0xFF958CFA), fontSize: 9),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Smaller container on top border
                      Positioned(
                        top: -15, // Position it above the main container
                        left: 25, // Adjust left position if needed
                        child: Container(
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                            color: const Color(0xFF3628DD),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: const Color(0xFF3628DD),
                              width: 2,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              '1 year',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3628DD),
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text(
                      'Get Now',
                      style: TextStyle(color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
