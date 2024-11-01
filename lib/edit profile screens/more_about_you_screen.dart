import 'package:love_bird/edit%20profile%20screens/drinks_screen.dart';
import 'package:love_bird/edit%20profile%20screens/education_screen.dart';
import 'package:love_bird/edit%20profile%20screens/extrovert_screen.dart';
import 'package:love_bird/edit%20profile%20screens/kids_screen.dart';
import 'package:love_bird/edit%20profile%20screens/language_you_speak_screen.dart';
import 'package:love_bird/edit%20profile%20screens/pets_screen.dart';
import 'package:love_bird/edit%20profile%20screens/relationship_screen.dart';
import 'package:love_bird/edit%20profile%20screens/religion_screen.dart';
import 'package:love_bird/edit%20profile%20screens/sexuality_screen.dart';
import 'package:love_bird/edit%20profile%20screens/smoking_screen.dart';
import 'package:love_bird/edit%20profile%20screens/star_sign_screen.dart';
import 'package:flutter/material.dart';

class MoreAboutYouScreen extends StatefulWidget {
  const MoreAboutYouScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MoreAboutYouScreenState createState() => _MoreAboutYouScreenState();
}

class _MoreAboutYouScreenState extends State<MoreAboutYouScreen> {
  final List<String> items = [
    'Kids',
    'Drinking',
    'You speak',
    'Relationship',
    'Sexuality',
    'Smoking',
    'Star sign',
    'Pets',
    'Religion',
    'Personality',
    'Education level',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "More about you",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(items[index]),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Handle item tap
                      // Navigate to different screens based on the tapped item
                      switch (index) {
                        case 0:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const KidsScreen()),
                          );
                          break;
                        case 1:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DrinksScreen()),
                          );
                          break;
                        case 2:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LanguageYouSpeakScreen()),
                          );
                          break;
                        case 3:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RelationshipScreen()),
                          );
                          break;
                        case 4:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SexualityScreen()),
                          );
                          break;
                        case 5:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SmokingScreen()),
                          );
                          break;
                        case 6:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StarSignScreen()),
                          );
                          break;
                        case 7:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PetsScreen()),
                          );
                          break;
                        case 8:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ReligionScreen()),
                          );
                          break;
                        case 9:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ExtrovertScreen()),
                          );
                          break;
                        case 10:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EducationScreen()),
                          );
                          break;
                        // Add more cases for other items if needed
                        default:
                          break;
                      }
                    });
              },
            ),
            Divider(
              color: const Color(0xFF3628DD).withOpacity(0.47),
            ),
            const Center(
              child: Text(
                "Interest",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            const Text(
              "Connect with people who are into what you’re into",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 80,
                    height: 30,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color(0xFF3628DD).withOpacity(0.19),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          "#beer",
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                  height: 30,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color(0xFF3628DD).withOpacity(0.19),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        "#fashion",
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                // TextButton(
                //   onPressed: () {
                //   },
                //   child: const Text(
                //     "Edit",
                //     style: TextStyle(
                //         fontSize: 16,
                //         fontWeight: FontWeight.w600,
                //         color: Colors.black),
                //   ),
                // ),

                TextButton(
                  onPressed: () {
                    _showAddInterestsModal(context,
                        isEdit: true); // Open modal for editing
                  },
                  child: const Text(
                    "Edit",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    _showAddInterestsModal(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3628DD),
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text(
                    'Add Interests',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              color: const Color(0xFF3628DD).withOpacity(0.47),
            ),
            const Center(
              child: Text(
                "Instagram",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            const Text(
              "Let people see your recent instagram post on your profile. Adding instagram won’t share your username.",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: 55,
                      height: 40,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: const Color(0xFF3628DD).withOpacity(0.19),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            "+",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: 55,
                      height: 40,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: const Color(0xFF3628DD).withOpacity(0.19),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            "+",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: 55,
                      height: 40,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: const Color(0xFF3628DD).withOpacity(0.19),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            "+",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: 55,
                      height: 40,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: const Color(0xFF3628DD).withOpacity(0.19),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            "+",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: 55,
                      height: 40,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: const Color(0xFF3628DD).withOpacity(0.19),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            "+",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3628DD),
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  icon: Image.asset('images/instagram.png'),
                  label: const Text(
                    'Connect Instagram',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddInterestsModal(BuildContext context, {bool isEdit = false}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return DefaultTabController(
          length: 5,
          child: Builder(
            builder: (BuildContext context) {
              final TabController tabController =
                  DefaultTabController.of(context);

              return SizedBox(
                height: 400, // Set height of the modal
                child: Column(
                  children: [
                    const TabBar(
                      indicatorColor: Colors.transparent, // Hide the indicator
                      labelColor:
                          Color(0xFF3628DD), // Color of the selected tab text
                      unselectedLabelColor:
                          Colors.black, // Color of the unselected tab text
                      tabs: [
                        Tab(text: "Mine"),
                        Tab(text: "Foods"),
                        Tab(text: "Music"),
                        Tab(text: "Movies"),
                        Tab(text: "Fashion"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          _buildMineContent(
                              tabController, isEdit), // Pass the isEdit flag
                          _buildFoodContent(),
                          _buildMusicContent(),
                          _buildMoviesContent(),
                          _buildFashionContent(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildMineContent(TabController tabController, bool isEdit) {
    if (isEdit) {
      // Content for "Edit" mode
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Here are your interests",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
              ),
            ),
            // SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Check out people near by to find people who like the same things!",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 80,
                    height: 30,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color(0xFF3628DD).withOpacity(0.19),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          "#beer",
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      width: 80,
                      height: 30,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: const Color(0xFF3628DD).withOpacity(0.19),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            "#fashion",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      // Content for "Add Interests" mode
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              "You’ll see your interest appear here",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              "Pick interest from the categories above to help make a great match!",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Move to the next tab
                  tabController.animateTo(tabController.index + 1);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3628DD),
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text(
                  'Add Interests',
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  // Custom content for the "Drinks" Tab
  Widget _buildFoodContent() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 300,
              child: TextField(
                onChanged: (value) {
                  // Implement your search logic here
                  // print('Search query: $value');
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                  isDense: true,
                  // contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color(0xFF3628DD).withOpacity(0.19),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 80,
            height: 30,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFF3628DD).withOpacity(0.19),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "#chinese",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 80,
            height: 30,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFF3628DD).withOpacity(0.19),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "#cheesecake",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 80,
            height: 30,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFF3628DD).withOpacity(0.19),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "#pizza",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 80,
            height: 30,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFF3628DD).withOpacity(0.19),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "#icecream",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Custom content for the "Smoking" Tab
  Widget _buildMusicContent() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w800),
                  isDense: true,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color(0xFF3628DD).withOpacity(0.19),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 80,
            height: 30,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFF3628DD).withOpacity(0.19),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "#psquare",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 80,
            height: 30,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFF3628DD).withOpacity(0.19),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "#soljaboy",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 80,
            height: 30,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFF3628DD).withOpacity(0.19),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "#jerry",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 80,
            height: 30,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFF3628DD).withOpacity(0.19),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "#saed",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Custom content for the "Pets" Tab
  Widget _buildMoviesContent() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w800),
                  isDense: true,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color(0xFF3628DD).withOpacity(0.19),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 80,
            height: 30,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFF3628DD).withOpacity(0.19),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "#caught",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 80,
            height: 30,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFF3628DD).withOpacity(0.19),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "#soljaboy",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 80,
            height: 30,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFF3628DD).withOpacity(0.19),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "#jerry",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 80,
            height: 30,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFF3628DD).withOpacity(0.19),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "#saed",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Custom content for the "Religion" Tab
  Widget _buildFashionContent() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w800),
                  isDense: true,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color(0xFF3628DD).withOpacity(0.19),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 80,
            height: 30,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFF3628DD).withOpacity(0.19),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "#gown",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 80,
            height: 30,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFF3628DD).withOpacity(0.19),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "#lingerie",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 80,
            height: 30,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFF3628DD).withOpacity(0.19),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "#shorts",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 80,
            height: 30,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFF3628DD).withOpacity(0.19),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "#bottoms",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
