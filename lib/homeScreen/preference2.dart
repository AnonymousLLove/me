import 'package:flutter/material.dart';
import 'package:love_bird/homeScreen/homeScreen.dart';

String selectedMinHeight = "No minimum"; // Default value
String selectedMaxHeight = "No maximum"; //

class MoreOptions extends StatefulWidget {
  const MoreOptions({super.key});

  @override
  State<MoreOptions> createState() => _MoreOptionsState();
}

class _MoreOptionsState extends State<MoreOptions> {
  void showSexualityPreferencePopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        int selectedCheckboxIndex = -1;
        bool isContainerTapped = false;

        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          showHeightPreferenceDialog(
                            context,
                            (minHeight, maxHeight) {
                              setState(() {
                                selectedMinHeight = minHeight;
                                selectedMaxHeight = maxHeight;
                              });
                            },
                          );
                        },
                        icon: const Icon(Icons.chevron_left),
                      ),
                      const Text(
                        'Sexuality',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Which sexual orientation(s) are you looking for?',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),

                  // Checkbox list
                  CheckboxListTile(
                    title: const Text(
                      'Straight',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    value: selectedCheckboxIndex == 0,
                    onChanged: (bool? value) {
                      setState(() {
                        selectedCheckboxIndex = value! ? 0 : -1;
                      });
                    },
                    activeColor: const Color.fromRGBO(54, 40, 221, 1),
                    checkColor: Colors.white,
                  ),
                  CheckboxListTile(
                    title: const Text(
                      'Open minded',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    value: selectedCheckboxIndex == 1,
                    onChanged: (bool? value) {
                      setState(() {
                        selectedCheckboxIndex = value! ? 1 : -1;
                      });
                    },
                    activeColor: const Color.fromRGBO(54, 40, 221, 1),
                    checkColor: Colors.white,
                  ),
                  CheckboxListTile(
                    title: const Text(
                      'Bisexual',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    value: selectedCheckboxIndex == 2,
                    onChanged: (bool? value) {
                      setState(() {
                        selectedCheckboxIndex = value! ? 2 : -1;
                      });
                    },
                    activeColor: const Color.fromRGBO(54, 40, 221, 1),
                    checkColor: Colors.white,
                  ),
                  CheckboxListTile(
                    title: const Text(
                      'Gay/Lesbian',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    value: selectedCheckboxIndex == 3,
                    onChanged: (bool? value) {
                      setState(() {
                        selectedCheckboxIndex = value! ? 3 : -1;
                      });
                    },
                    activeColor: const Color.fromRGBO(54, 40, 221, 1),
                    checkColor: Colors.white,
                  ),
                  const SizedBox(height: 20),

                  // Bottom button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isContainerTapped = !isContainerTapped;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 45,
                        decoration: BoxDecoration(
                          color: isContainerTapped
                              ? const Color(0xFF3628DD)
                              : const Color.fromRGBO(149, 140, 250, 1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFF3628DD),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'See other people if I run out',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: double.infinity,
                        height: 45,
                        decoration: BoxDecoration(
                          color: const Color(0xFF3628DD),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            'Apply',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // Default values

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, size: 30),
          onPressed: () {
            Navigator.pop(context); // Go back when pressed
          },
        ),
        title: const Text(
          'More options',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        // Add your title or leave blank
        actions: [
          IconButton(
            icon: const Icon(Icons.close, size: 30),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 18.0, right: 18),
              child: Text(
                textAlign: TextAlign.center,
                'Use the filters to focus your search on the people you really want to meet',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'Popular',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showPhoto(
                        context,
                      );
                    },
                    child: _buildFilterTile(
                      'Photo verified',
                      'Are their photos real?',
                      () => showPhoto(
                        context,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showHeightPreferenceDialog(
                        context,
                        (minHeight, maxHeight) {
                          // Handle the selected height values here
                          print(
                              "Selected Height Range: $minHeight to $maxHeight");

                          // You can set the selected values to a state or variable, for example:
                          setState(() {
                            selectedMinHeight = minHeight;
                            selectedMaxHeight = maxHeight;
                          });
                        },
                      );
                    },
                    child: _buildFilterTile(
                      'Height',
                      'Want someone you can look up to?',
                      () => showHeightPreferenceDialog(
                        context,
                        (minHeight, maxHeight) {
                          // Handle the selected height values here
                          print(
                              "Selected Height Range: $minHeight to $maxHeight");

                          // You can set the selected values to a state or variable, for example:
                          setState(() {
                            selectedMinHeight = minHeight;
                            selectedMaxHeight = maxHeight;
                          });
                        },
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showSexualityPreferencePopup(
                        context,
                      );
                    },
                    child: _buildFilterTile(
                      'Sexuality',
                      'What’s their sexual orientation?',
                      () => showSexualityPreferencePopup(
                        context,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showHerePreferencePopup(
                        context,
                      );
                    },
                    child: _buildFilterTile(
                      'Here for',
                      'Do they want to date or find a relationship?',
                      () => showHerePreferencePopup(
                        context,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showStarPreferencePopup(
                        context,
                      );
                    },
                    child: _buildFilterTile(
                      'Star sign',
                      'What’s written in their stars?',
                      () => showStarPreferencePopup(
                        context,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showLanguagePreferencePopup(
                        context,
                      );
                    },
                    child: _buildFilterTile(
                      'Language',
                      'Will you understand each other?',
                      () => showLanguagePreferencePopup(
                        context,
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'LifeStyle',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showChildrenPreferencePopup(
                        context,
                      );
                    },
                    child: _buildFilterTile(
                      'Children',
                      'Have them? Want them? Not sure?',
                      () => showChildrenPreferencePopup(
                        context,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showPetsPreferencePopup(
                        context,
                      );
                    },
                    child: _buildFilterTile(
                      'Pets',
                      'Kitty litters or morning walkies?',
                      () => showPetsPreferencePopup(
                        context,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showSmokingPreferencePopup(
                        context,
                      );
                    },
                    child: _buildFilterTile(
                      'Smoking',
                      'Do you mind if they light up?',
                      () => showSmokingPreferencePopup(
                        context,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDrinkingPreferencePopup(
                        context,
                      );
                    },
                    child: _buildFilterTile(
                      'Drinking',
                      'Will you raise a glass together?',
                      () => showDrinkingPreferencePopup(
                        context,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showEducationPreferencePopup(
                        context,
                      );
                    },
                    child: _buildFilterTile(
                      'Education',
                      'Diploma, or school of life?',
                      () => showEducationPreferencePopup(
                        context,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showReligionPreferencePopup(
                        context,
                      );
                    },
                    child: _buildFilterTile(
                      'Religion',
                      'What do they believe in?',
                      () => showReligionPreferencePopup(
                        context,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showRelationshipPreferencePopup(
                        context,
                      );
                    },
                    child: _buildFilterTile(
                      'Relationship',
                      'Are they single and ready to mingle?',
                      () => showRelationshipPreferencePopup(
                        context,
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'Personality',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showPersonalityPreferencePopup(
                        context,
                      );
                    },
                    child: _buildFilterTile(
                      'Personality',
                      'What’s their social style?',
                      () => showPersonalityPreferencePopup(
                        context,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showInterestSearchPopup(
                        context,
                      );
                    },
                    child: _buildFilterTile(
                      'Interest',
                      'What have you got in common?',
                      () => showInterestSearchPopup(
                        context,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: Container(
                  width: screenSize.width * 0.6,
                  height: screenSize.height * 0.05,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(54, 40, 221, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text('Apply',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTile(String title, String subtitle, VoidCallback onTap) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 13)),
      trailing: GestureDetector(
        onTap: onTap, // Call the provided onTap function
        child: const Icon(Icons.chevron_right),
      ),
      onTap: () {
        // Optionally handle filter tap here if needed
      },
    );
  }

  void showPhoto(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    bool isContainerTapped = false;
    bool isContainerTapped2 = false;
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                // Set the width as a percentage
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min, // Wraps content size
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.chevron_left),
                        ),
                        SizedBox(width: screenSize.width * 0.15),
                        const Text(
                          'Photo Verified',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: screenSize.width * 0.15),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    const Text(
                      'Are their photos for real?',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isContainerTapped2 =
                                !isContainerTapped2; // Toggle container state
                          });
                        },
                        child: Container(
                          width: screenSize.width * 0.65,
                          height: screenSize.height * 0.05,
                          decoration: BoxDecoration(
                              // color: Colors.white,
                              color:
                                  isContainerTapped2 // Change color based on state
                                      ? const Color(
                                          0xFF3628DD) // Container color when tapped
                                      : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: const Color.fromRGBO(149, 140, 250, 1),
                              )),
                          child: const Center(
                            child: Text(
                              'Photo Verified',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),

                    //  const SizedBox(height: 10),

                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isContainerTapped =
                                  !isContainerTapped; // Toggle container state
                            });
                            // Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.65,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color:
                                  isContainerTapped // Change color based on state
                                      ? const Color(
                                          0xFF3628DD) // Container color when tapped
                                      : const Color.fromRGBO(
                                          149, 140, 250, 1), // Default color
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFF3628DD),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'See other people if I run out',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Option 2 Button

                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: screenSize.width * 0.45,
                          height: screenSize.height * 0.05,
                          decoration: BoxDecoration(
                            color: const Color(0xFF3628DD),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              'Apply',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Apply Button
                  ],
                ),
              );
            },
          );
        });
  }

  void showHeightPreferenceDialog(
      BuildContext context, Function(String, String) onHeightRangeSelected) {
    List<String> heightValues = [
      "No minimum",
      "150cm (5'0\")",
      "160cm (5'3\")",
      "170cm (5'7\")",
      "180cm (5'11\")",
      "190cm (6'3\")",
      "219cm (7'3\")",
    ];

    List<String> heightValues2 = [
      "No maximum",
      "219cm (7'3\")",
      "190cm (6'3\")",
      "180cm (5'11\")",
      "170cm (5'7\")",
      "160cm (5'3\")",
      "150cm (5'0\")",
    ];
    String selectedMinHeight = "No minimum"; // Default value for min
    String selectedMaxHeight = "No maximum"; // Default value for max
    final screenSize = MediaQuery.of(context).size;
    bool isContainerTapped = false;

    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showPhoto(
                                context,
                              );
                            },
                            icon: (const Icon(Icons.chevron_left))),
                        SizedBox(width: screenSize.width * 0.15),
                        const Text(
                          'Height',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: screenSize.width * 0.15),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: (const Icon(Icons.close))),
                      ],
                    ),
                    const Text(
                      'How tall should they be?',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 150, // Limit the height
                                child: ListWheelScrollView.useDelegate(
                                  itemExtent: 60, // Height of each item
                                  onSelectedItemChanged: (index) {
                                    setState(() {
                                      selectedMinHeight = heightValues[index];
                                    });
                                  },
                                  childDelegate: ListWheelChildBuilderDelegate(
                                    builder: (context, index) {
                                      return Column(
                                        children: [
                                          Text(
                                            heightValues[index],
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: heightValues[index] ==
                                                      selectedMinHeight
                                                  ? Colors.black
                                                  : Colors.grey,
                                            ),
                                          ),
                                          if (index != heightValues.length - 1)
                                            const Divider(), // Add a divider
                                        ],
                                      );
                                    },
                                    childCount: heightValues.length,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 150, // Limit the height
                                child: ListWheelScrollView.useDelegate(
                                  itemExtent: 60, // Height of each item
                                  onSelectedItemChanged: (index) {
                                    setState(() {
                                      selectedMaxHeight = heightValues2[index];
                                    });
                                  },
                                  childDelegate: ListWheelChildBuilderDelegate(
                                    builder: (context, index) {
                                      return Column(
                                        children: [
                                          Text(
                                            heightValues2[index],
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: heightValues2[index] ==
                                                      selectedMaxHeight
                                                  ? Colors.black
                                                  : Colors.grey,
                                            ),
                                          ),
                                          if (index != heightValues2.length - 1)
                                            const Divider(), // Add a divider
                                        ],
                                      );
                                    },
                                    childCount: heightValues2.length,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isContainerTapped =
                                !isContainerTapped; // Toggle container state
                          });
                          // Navigator.pop(context);
                        },
                        child: Container(
                          width: screenSize.width * 0.65,
                          height: screenSize.height * 0.05,
                          decoration: BoxDecoration(
                            color:
                                isContainerTapped // Change color based on state
                                    ? const Color(
                                        0xFF3628DD) // Container color when tapped
                                    : const Color.fromRGBO(
                                        149, 140, 250, 1), // Default color
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 1,
                              color: const Color(0xFF3628DD),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'See other people if I run out',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Option 2 Button

                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          onHeightRangeSelected(
                              selectedMinHeight, selectedMaxHeight);
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: screenSize.width * 0.45,
                          height: screenSize.height * 0.05,
                          decoration: BoxDecoration(
                            color: const Color(0xFF3628DD),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              'Apply',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }

  void showHerePreferencePopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    int selectedCheckboxIndex = -1;
    bool isContainerTapped = false;

    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                height: screenSize.height * 0.5,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min, // Wrap content size
                    children: [
                      // Header with back and close buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showSexualityPreferencePopup(context);
                            },
                            icon: const Icon(Icons.chevron_left),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          const Text(
                            'Here For',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Choose as many options as you want. We’ll show you people who are here for this.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),

                      // Relationship Preference Options
                      Column(
                        children: [
                          CheckboxListTile(
                            title: const Text(
                              'Open to chat',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            value: selectedCheckboxIndex == 0,
                            onChanged: (bool? value) {
                              setState(() {
                                selectedCheckboxIndex = value! ? 0 : -1;
                              });
                            },
                            activeColor: const Color.fromRGBO(54, 40, 221, 1),
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            side: const BorderSide(
                              color: Color.fromRGBO(54, 40, 221, 1),
                              width: 1,
                            ),
                          ),
                          CheckboxListTile(
                            title: const Text(
                              'Here to Date',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            value: selectedCheckboxIndex == 1,
                            onChanged: (bool? value) {
                              setState(() {
                                selectedCheckboxIndex = value! ? 1 : -1;
                              });
                            },
                            activeColor: const Color.fromRGBO(54, 40, 221, 1),
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            side: const BorderSide(
                              color: Color.fromRGBO(54, 40, 221, 1),
                              width: 1,
                            ),
                          ),
                          CheckboxListTile(
                            title: const Text(
                              'Casual',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            value: selectedCheckboxIndex == 2,
                            onChanged: (bool? value) {
                              setState(() {
                                selectedCheckboxIndex = value! ? 2 : -1;
                              });
                            },
                            activeColor: const Color.fromRGBO(54, 40, 221, 1),
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            side: const BorderSide(
                              color: Color.fromRGBO(54, 40, 221, 1),
                              width: 1,
                            ),
                          ),
                          CheckboxListTile(
                            title: const Text(
                              'Ready for a Relationship',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            value: selectedCheckboxIndex == 3,
                            onChanged: (bool? value) {
                              setState(() {
                                selectedCheckboxIndex = value! ? 3 : -1;
                              });
                            },
                            activeColor: const Color.fromRGBO(54, 40, 221, 1),
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            side: const BorderSide(
                              color: Color.fromRGBO(54, 40, 221, 1),
                              width: 1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // "See other people" button
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isContainerTapped =
                                  !isContainerTapped; // Toggle container state
                            });
                            // Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.65,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color:
                                  isContainerTapped // Change color based on state
                                      ? const Color(
                                          0xFF3628DD) // Container color when tapped
                                      : const Color.fromRGBO(
                                          149, 140, 250, 1), // Default color
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFF3628DD),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'See other people if I run out',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Apply Button
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.45,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3628DD),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  void showStarPreferencePopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    bool isContainerTapped = false;
    // Define a variable to keep track of the selected star sign
    String? selectedStarSign;
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                height: screenSize.height * 0.5,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showRelationshipPreferencePopup(context);
                            },
                            icon: const Icon(Icons.chevron_left),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          const Text(
                            'Star Sign',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Are you looking for a particular star sign?",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),

                      // List of Star Sign options with exclusive selection
                      Column(
                        children: [
                          'Aries',
                          'Taurus',
                          'Gemini',
                          'Cancer',
                          'Leo',
                          'Virgo',
                          'Libra',
                          'Scorpio',
                          'Sagittarius',
                          'Capricorn',
                          'Aquarius',
                          'Pisces'
                        ].map((starSign) {
                          return CheckboxListTile(
                            title: Text(starSign,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            value: selectedStarSign == starSign,
                            onChanged: (bool? value) {
                              setState(() {
                                // Update the selected star sign
                                selectedStarSign = value! ? starSign : null;
                              });
                            },
                            activeColor: const Color.fromRGBO(54, 40, 221, 1),
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            side: const BorderSide(
                              color: Color.fromRGBO(54, 40, 221, 1),
                              width: 2,
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isContainerTapped =
                                  !isContainerTapped; // Toggle container state
                            });
                            // Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.65,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color:
                                  isContainerTapped // Change color based on state
                                      ? const Color(
                                          0xFF3628DD) // Container color when tapped
                                      : const Color.fromRGBO(
                                          149, 140, 250, 1), // Default color
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFF3628DD),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'See other people if I run out',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            // Apply selected preference action here
                          },
                          child: Container(
                            width: screenSize.width * 0.45,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3628DD),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  void showLanguagePreferencePopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    bool isContainerTapped = false;
    // Change selectedLanguage to a list to hold multiple selections
    List<String> selectedLanguages = []; // For multiple selections

    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                height: screenSize.height * 0.7,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showSexualityPreferencePopup(context);
                            },
                            icon: const Icon(Icons.chevron_left),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          const Text(
                            'Language',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "What Language(s) should they speak?",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          ...[
                            'English',
                            'Spanish',
                            'Mandarin',
                            'Hindi',
                            'French',
                            'Arabic',
                            'Bengali',
                            'Portuguese',
                            'Russian',
                            'Japanese',
                            'German',
                            'Korean',
                            'Italian',
                            'Turkish',
                            'Persian',
                            'Swahili',
                            'Vietnamese',
                            'Urdu',
                            'Punjabi',
                            'Javanese',
                            'Yoruba',
                            'Hausa',
                            'Igbo',
                            'Fula',
                            'Zulu',
                            'Thai',
                            'Dutch',
                            'Greek',
                          ].map((language) {
                            return CheckboxListTile(
                              title: Text(language,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              value: selectedLanguages.contains(language),
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value == true) {
                                    // Add to list if selected
                                    selectedLanguages.add(language);
                                  } else {
                                    // Remove from list if unselected
                                    selectedLanguages.remove(language);
                                  }
                                });
                              },
                              activeColor: const Color.fromRGBO(54, 40, 221, 1),
                              checkColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              side: const BorderSide(
                                color: Color.fromRGBO(54, 40, 221, 1),
                                width: 2,
                              ),
                            );
                          }),
                          ...[
                            'Romanian',
                            'Tamil',
                            'Polish',
                            'Swedish',
                            'Finnish',
                            'Norwegian',
                            'Danish',
                            'Hebrew',
                            'Hungarian',
                            'Czech',
                            'Slovak',
                            'Catalan',
                            'Lithuanian',
                            'Latvian',
                            'Estonian',
                            'Serbian',
                            'Croatian',
                            'Bosnian',
                            'Albanian',
                            'Malay',
                            'Filipino',
                            'Nepali',
                            'Sinhala',
                            'Burmese',
                            'Khmer',
                            'Lao',
                            'Mongolian',
                            'Armenian',
                            'Georgian',
                            'Kazakh',
                            'Uzbek',
                            'Tatar'
                          ].map((language) {
                            return CheckboxListTile(
                              title: Text(language,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              value: selectedLanguages.contains(language),
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value == true) {
                                    // Add to list if selected
                                    selectedLanguages.add(language);
                                  } else {
                                    // Remove from list if unselected
                                    selectedLanguages.remove(language);
                                  }
                                });
                              },
                              activeColor: const Color.fromRGBO(54, 40, 221, 1),
                              checkColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              side: const BorderSide(
                                color: Color.fromRGBO(54, 40, 221, 1),
                                width: 2,
                              ),
                            );
                          }),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isContainerTapped =
                                  !isContainerTapped; // Toggle container state
                            });
                            // Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.65,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color: isContainerTapped
                                  ? const Color(
                                      0xFF3628DD) // Container color when tapped
                                  : const Color.fromRGBO(
                                      149, 140, 250, 1), // Default color
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFF3628DD),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'See other people if I run out',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            // Apply selected preference action here
                            // For example, you can print selected languages
                            print('Selected Languages: $selectedLanguages');
                          },
                          child: Container(
                            width: screenSize.width * 0.45,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3628DD),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  void showChildrenPreferencePopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    bool isContainerTapped = false;
    // Variable to track which checkbox is selected
    int selectedCheckboxIndex = -1;

    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                height: screenSize.height * 0.5,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min, // Wrap content size
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showLanguagePreferencePopup(context);
                            },
                            icon: const Icon(Icons.chevron_left),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          const Text(
                            'Children',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Are you looking for someone who has or wants children?",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),

                      // Checkbox ListTiles with rounded borders and single-selection logic
                      CheckboxListTile(
                        title: const Text(
                          'Would like them someday',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 0,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 0 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Already has children',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 1,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 1 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Doesn’t want them',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 2,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 2 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),

                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isContainerTapped =
                                  !isContainerTapped; // Toggle container state
                            });
                            // Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.65,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color:
                                  isContainerTapped // Change color based on state
                                      ? const Color(
                                          0xFF3628DD) // Container color when tapped
                                      : const Color.fromRGBO(
                                          149, 140, 250, 1), // Default color
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFF3628DD),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'See other people if I run out',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.45,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3628DD),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  void showPetsPreferencePopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    bool isContainerTapped = false;
    // Variable to track which checkbox is selected
    int selectedCheckboxIndex = -1;

    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                height: screenSize.height * 0.5,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min, // Wrap content size
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showLanguagePreferencePopup(context);
                            },
                            icon: const Icon(Icons.chevron_left),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          const Text(
                            'Pets',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Are you looking for someone who has pets?",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),

                      // Checkbox ListTiles with rounded borders and single-selection logic
                      CheckboxListTile(
                        title: const Text(
                          'Cat(s)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 0,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 0 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Dog(s)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 1,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 1 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Doesn’t want Multiple',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 2,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 2 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),

                      CheckboxListTile(
                        title: const Text(
                          'Other',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 3,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 3 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),

                      CheckboxListTile(
                        title: const Text(
                          'None',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 4,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 4 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),

                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isContainerTapped =
                                  !isContainerTapped; // Toggle container state
                            });
                            // Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.65,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color:
                                  isContainerTapped // Change color based on state
                                      ? const Color(
                                          0xFF3628DD) // Container color when tapped
                                      : const Color.fromRGBO(
                                          149, 140, 250, 1), // Default color
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFF3628DD),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'See other people if I run out',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.45,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3628DD),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  void showSmokingPreferencePopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    bool isContainerTapped = false;
    // Variable to track which checkbox is selected
    int selectedCheckboxIndex = -1;
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                height: screenSize.height * 0.5,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min, // Wrap content size
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showLanguagePreferencePopup(context);
                            },
                            icon: const Icon(Icons.chevron_left),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          const Text(
                            'Smoking',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "What Should their smoking habit be?",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),

                      // Checkbox ListTiles with rounded borders and single-selection logic
                      CheckboxListTile(
                        title: const Text(
                          'Smoking',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 0,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 0 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Non- Smoking',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 1,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 1 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),

                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isContainerTapped =
                                  !isContainerTapped; // Toggle container state
                            });
                            // Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.65,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color:
                                  isContainerTapped // Change color based on state
                                      ? const Color(
                                          0xFF3628DD) // Container color when tapped
                                      : const Color.fromRGBO(
                                          149, 140, 250, 1), // Default color
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFF3628DD),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'See other people if I run out',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.45,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3628DD),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  void showDrinkingPreferencePopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    bool isContainerTapped = false;
    // Variable to track which checkbox is selected
    int selectedCheckboxIndex = -1;

    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                height: screenSize.height * 0.5,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min, // Wrap content size
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showLanguagePreferencePopup(context);
                            },
                            icon: const Icon(Icons.chevron_left),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          const Text(
                            'Drinking',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Should They Drink?",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),

                      // Checkbox ListTiles with rounded borders and single-selection logic
                      CheckboxListTile(
                        title: const Text(
                          'Socially',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 0,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 0 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Never',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 1,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 1 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Other',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 2,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 2 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          "No, they're Sober",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 3,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 3 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),

                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isContainerTapped =
                                  !isContainerTapped; // Toggle container state
                            });
                            // Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.65,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color:
                                  isContainerTapped // Change color based on state
                                      ? const Color(
                                          0xFF3628DD) // Container color when tapped
                                      : const Color.fromRGBO(
                                          149, 140, 250, 1), // Default color
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFF3628DD),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'See other people if I run out',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.45,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3628DD),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  void showEducationPreferencePopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Variable to track which checkbox is selected
    int selectedCheckboxIndex = -1;
    bool isContainerTapped = false;

    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                height: screenSize.height * 0.5,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                // Adjust width as needed
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min, // Wrap content size
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showLanguagePreferencePopup(context);
                            },
                            icon: const Icon(Icons.chevron_left),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          const Text(
                            'Education',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Are You Looking For Someone with a specfic Education Level?",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),

                      // Checkbox ListTiles with rounded borders and single-selection logic
                      CheckboxListTile(
                        title: const Text(
                          'High School',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 0,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 0 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'In College',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 1,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 1 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Finished College',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 2,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 2 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          "In grad School",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 3,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 3 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          "Finished Graduate degree or higher",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 4,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 4 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),

                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isContainerTapped =
                                  !isContainerTapped; // Toggle container state
                            });
                            // Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.65,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color:
                                  isContainerTapped // Change color based on state
                                      ? const Color(
                                          0xFF3628DD) // Container color when tapped
                                      : const Color.fromRGBO(
                                          149, 140, 250, 1), // Default color
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFF3628DD),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'See other people if I run out',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.45,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3628DD),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  void showReligionPreferencePopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Variable to track which checkbox is selected
    int selectedCheckboxIndex = -1;
    bool isContainerTapped = false;

    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                height: screenSize.height * 0.5,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min, // Wrap content size
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showLanguagePreferencePopup(context);
                            },
                            icon: const Icon(Icons.chevron_left),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          const Text(
                            'Religion',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Are You Looking for a particular religion?",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),

                      // Checkbox ListTiles with rounded borders and single-selection logic
                      CheckboxListTile(
                        title: const Text(
                          'Atheist',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 0,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 0 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Christian',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 1,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 1 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Muslim',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 2,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 2 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          "Other",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 3,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 3 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),

                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isContainerTapped =
                                  !isContainerTapped; // Toggle container state
                            });
                            // Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.65,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color:
                                  isContainerTapped // Change color based on state
                                      ? const Color(
                                          0xFF3628DD) // Container color when tapped
                                      : const Color.fromRGBO(
                                          149, 140, 250, 1), // Default color
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFF3628DD),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'See other people if I run out',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.45,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3628DD),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  void showRelationshipPreferencePopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Variable to track which checkbox is selected
    int selectedCheckboxIndex = -1;
    bool isContainerTapped = false;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: screenSize.height * 0.5,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min, // Wrap content size
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            showLanguagePreferencePopup(context);
                          },
                          icon: const Icon(Icons.chevron_left),
                        ),
                        SizedBox(width: screenSize.width * 0.15),
                        const Text(
                          'Relationship',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: screenSize.width * 0.15),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "What Relationship status(es) are you looking for?",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),

                    // Checkbox ListTiles with rounded borders and single-selection logic
                    CheckboxListTile(
                      title: const Text(
                        'Single',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      value: selectedCheckboxIndex == 0,
                      onChanged: (bool? value) {
                        setState(() {
                          selectedCheckboxIndex = value! ? 0 : -1;
                        });
                      },
                      activeColor: const Color.fromRGBO(54, 40, 221, 1),
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(
                        color: Color.fromRGBO(54, 40, 221, 1),
                        width: 1,
                      ),
                    ),
                    CheckboxListTile(
                      title: const Text(
                        'Taken',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      value: selectedCheckboxIndex == 1,
                      onChanged: (bool? value) {
                        setState(() {
                          selectedCheckboxIndex = value! ? 1 : -1;
                        });
                      },
                      activeColor: const Color.fromRGBO(54, 40, 221, 1),
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(
                        color: Color.fromRGBO(54, 40, 221, 1),
                        width: 1,
                      ),
                    ),
                    CheckboxListTile(
                      title: const Text(
                        'Muslim',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      value: selectedCheckboxIndex == 2,
                      onChanged: (bool? value) {
                        setState(() {
                          selectedCheckboxIndex = value! ? 2 : -1;
                        });
                      },
                      activeColor: const Color.fromRGBO(54, 40, 221, 1),
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(
                        color: Color.fromRGBO(54, 40, 221, 1),
                        width: 1,
                      ),
                    ),
                    CheckboxListTile(
                      title: const Text(
                        "Other",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      value: selectedCheckboxIndex == 3,
                      onChanged: (bool? value) {
                        setState(() {
                          selectedCheckboxIndex = value! ? 3 : -1;
                        });
                      },
                      activeColor: const Color.fromRGBO(54, 40, 221, 1),
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(
                        color: Color.fromRGBO(54, 40, 221, 1),
                        width: 1,
                      ),
                    ),

                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isContainerTapped =
                                !isContainerTapped; // Toggle container state
                          });
                          // Navigator.pop(context);
                        },
                        child: Container(
                          width: screenSize.width * 0.65,
                          height: screenSize.height * 0.05,
                          decoration: BoxDecoration(
                            color:
                                isContainerTapped // Change color based on state
                                    ? const Color(
                                        0xFF3628DD) // Container color when tapped
                                    : const Color.fromRGBO(
                                        149, 140, 250, 1), // Default color
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 1,
                              color: const Color(0xFF3628DD),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'See other people if I run out',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: screenSize.width * 0.45,
                          height: screenSize.height * 0.05,
                          decoration: BoxDecoration(
                            color: const Color(0xFF3628DD),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              'Apply',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void showPersonalityPreferencePopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Variable to track which checkbox is selected
    int selectedCheckboxIndex = -1;
    bool isContainerTapped = false;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: screenSize.height * 0.5,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min, // Wrap content size
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            showLanguagePreferencePopup(context);
                          },
                          icon: const Icon(Icons.chevron_left),
                        ),
                        SizedBox(width: screenSize.width * 0.15),
                        const Text(
                          'Personality',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: screenSize.width * 0.15),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Introvert(more quiet and reserved) or extrovert(more social and outgoing)",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),

                    // Checkbox ListTiles with rounded borders and single-selection logic
                    CheckboxListTile(
                      title: const Text(
                        'Extrovert',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      value: selectedCheckboxIndex == 0,
                      onChanged: (bool? value) {
                        setState(() {
                          selectedCheckboxIndex = value! ? 0 : -1;
                        });
                      },
                      activeColor: const Color.fromRGBO(54, 40, 221, 1),
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(
                        color: Color.fromRGBO(54, 40, 221, 1),
                        width: 1,
                      ),
                    ),
                    CheckboxListTile(
                      title: const Text(
                        'Introvert',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      value: selectedCheckboxIndex == 1,
                      onChanged: (bool? value) {
                        setState(() {
                          selectedCheckboxIndex = value! ? 1 : -1;
                        });
                      },
                      activeColor: const Color.fromRGBO(54, 40, 221, 1),
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(
                        color: Color.fromRGBO(54, 40, 221, 1),
                        width: 1,
                      ),
                    ),
                    CheckboxListTile(
                      title: const Text(
                        'Somewhere in between',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      value: selectedCheckboxIndex == 2,
                      onChanged: (bool? value) {
                        setState(() {
                          selectedCheckboxIndex = value! ? 2 : -1;
                        });
                      },
                      activeColor: const Color.fromRGBO(54, 40, 221, 1),
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(
                        color: Color.fromRGBO(54, 40, 221, 1),
                        width: 1,
                      ),
                    ),

                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isContainerTapped =
                                !isContainerTapped; // Toggle container state
                          });
                          // Navigator.pop(context);
                        },
                        child: Container(
                          width: screenSize.width * 0.65,
                          height: screenSize.height * 0.05,
                          decoration: BoxDecoration(
                            color:
                                isContainerTapped // Change color based on state
                                    ? const Color(
                                        0xFF3628DD) // Container color when tapped
                                    : const Color.fromRGBO(
                                        149, 140, 250, 1), // Default color
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 1,
                              color: const Color(0xFF3628DD),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'See other people if I run out',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: screenSize.width * 0.45,
                          height: screenSize.height * 0.05,
                          decoration: BoxDecoration(
                            color: const Color(0xFF3628DD),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              'Apply',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void showInterestSearchPopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    TextEditingController searchController = TextEditingController();
    List<String> popularInterests = [
      "#listeningtomusic",
      "#laughing",
      "#chilling",
      "#honesty",
      "#pizza",
      "#dinnerwithfriends"
    ];
    List<String> displayedInterests = List.from(popularInterests);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              height: screenSize.height * 0.5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            showSexualityPreferencePopup(
                              context,
                            );
                          },
                          icon: (const Icon(Icons.chevron_left))),
                      SizedBox(width: screenSize.width * 0.15),
                      const Text(
                        'Interest',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: screenSize.width * 0.15),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: (const Icon(Icons.close))),
                    ],
                  ),

                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        // Perform search filtering
                        setState(() {
                          displayedInterests = popularInterests
                              .where((interest) => interest
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Search by interest",
                        hintStyle: const TextStyle(
                          color: Color(0xFF9B9B9B),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFF3628DD),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFF3628DD),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Popular",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // List of popular interests
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: displayedInterests.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                            displayedInterests[index],
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[800]),
                          ),
                          onTap: () {
                            // Handle interest selection
                            print("Selected: ${displayedInterests[index]}");
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
