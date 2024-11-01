import 'package:flutter/material.dart';
import 'package:love_bird/homeScreen/preference2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class FilterOptionss extends StatefulWidget {
  const FilterOptionss({super.key});

  @override
  State<FilterOptionss> createState() => _FilterOptionssState();
}

int _startAge = 30;
int _endAge = 40;

// Gender variable
String _selectedGender = 'Men';

String _location = 'People nearby';

void showAgeRangePicker(
    BuildContext context, Function(int, int) onAgeRangeSelected) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            padding: const EdgeInsets.all(20),
            height: 400, // Adjusted height for scrolling
            child: Column(
              children: [
                const Text('Age range',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Spacer(),
                Expanded(
                  child: Row(
                    children: [
                      // Start Age Wheel
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          itemExtent: 50, // Height of each item
                          onSelectedItemChanged: (index) {
                            setState(() {
                              _startAge = 20 + index; // Adjust range as needed
                            });
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      (20 + index).toString(),
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: (20 + index) == _startAge
                                            ? Colors.black
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                ],
                              );
                            },
                            childCount: 31, // Total number of items (20 to 50)
                          ),
                        ),
                      ),
                      const SizedBox(width: 20), // Spacing between wheels
                      // End Age Wheel
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          itemExtent: 50,
                          onSelectedItemChanged: (index) {
                            setState(() {
                              _endAge = 20 + index; // Adjust range as needed
                            });
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      (20 + index).toString(),
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: (20 + index) == _endAge
                                            ? Colors.black
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                ],
                              );
                            },
                            childCount: 31, // Total number of items (20 to 50)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    // Call the callback function to pass the selected values back
                    onAgeRangeSelected(_startAge, _endAge);
                    Navigator.pop(context); // Close the modal
                  },
                  child: Container(
                    width: 240,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(54, 40, 221, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text('Apply',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
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

//String _location = 'No location selected';
String? selectedValue;
final List<String> items = [
  'Afghanistan',
  'Albania',
  'Algeria',
  'Andorra',
  'Angola',
  'Antigua and Barbuda',
  'Argentina',
  'Armenia',
  'Australia',
  'Austria',
  'Azerbaijan',
  'Bahamas',
  'Bahrain',
  'Bangladesh',
  'Barbados',
  'Belarus',
  'Belgium',
  'Belize',
  'Benin',
  'Bhutan',
  'Bolivia',
  'Bosnia and Herzegovina',
  'Botswana',
  'Brazil',
  'Brunei',
  'Bulgaria',
  'Burkina Faso',
  'Burundi',
  'Cabo Verde',
  'Cambodia',
  'Cameroon',
  'Canada',
  'Central African Republic',
  'Chad',
  'Chile',
  'China',
  'Colombia',
  'Comoros',
  'Congo, Democratic Republic of the',
  'Congo, Republic of the',
  'Costa Rica',
  'Croatia',
  'Cuba',
  'Cyprus',
  'Czech Republic',
  'Denmark',
  'Djibouti',
  'Dominica',
  'Dominican Republic',
  'Ecuador',
  'Egypt',
  'El Salvador',
  'Equatorial Guinea',
  'Eritrea',
  'Estonia',
  'Eswatini',
  'Ethiopia',
  'Fiji',
  'Finland',
  'France',
  'Gabon',
  'Gambia',
  'Georgia',
  'Germany',
  'Ghana',
  'Greece',
  'Grenada',
  'Guatemala',
  'Guinea',
  'Guinea-Bissau',
  'Guyana',
  'Haiti',
  'Honduras',
  'Hungary',
  'Iceland',
  'India',
  'Indonesia',
  'Iran',
  'Iraq',
  'Ireland',
  'Israel',
  'Italy',
  'Jamaica',
  'Japan',
  'Jordan',
  'Kazakhstan',
  'Kenya',
  'Kiribati',
  'Korea, North',
  'Korea, South',
  'Kuwait',
  'Kyrgyzstan',
  'Laos',
  'Latvia',
  'Lebanon',
  'Lesotho',
  'Liberia',
  'Libya',
  'Liechtenstein',
  'Lithuania',
  'Luxembourg',
  'Madagascar',
  'Malawi',
  'Malaysia',
  'Maldives',
  'Mali',
  'Malta',
  'Marshall Islands',
  'Mauritania',
  'Mauritius',
  'Mexico',
  'Micronesia',
  'Moldova',
  'Monaco',
  'Mongolia',
  'Montenegro',
  'Morocco',
  'Mozambique',
  'Myanmar',
  'Namibia',
  'Nauru',
  'Nepal',
  'Netherlands',
  'New Zealand',
  'Nicaragua',
  'Niger',
  'Nigeria',
  'North Macedonia',
  'Norway',
  'Oman',
  'Pakistan',
  'Palau',
  'Palestine',
  'Panama',
  'Papua New Guinea',
  'Paraguay',
  'Peru',
  'Philippines',
  'Poland',
  'Portugal',
  'Qatar',
  'Romania',
  'Russia',
  'Rwanda',
  'Saint Kitts and Nevis',
  'Saint Lucia',
  'Saint Vincent and the Grenadines',
  'Samoa',
  'San Marino',
  'Sao Tome and Principe',
  'Saudi Arabia',
  'Senegal',
  'Serbia',
  'Seychelles',
  'Sierra Leone',
  'Singapore',
  'Slovakia',
  'Slovenia',
  'Solomon Islands',
  'Somalia',
  'South Africa',
  'South Sudan',
  'Spain',
  'Sri Lanka',
  'Sudan',
  'Suriname',
  'Sweden',
  'Switzerland',
  'Syria',
  'Taiwan',
  'Tajikistan',
  'Tanzania',
  'Thailand',
  'Togo',
  'Tonga',
  'Trinidad and Tobago',
  'Tunisia',
  'Turkey',
  'Turkmenistan',
  'Tuvalu',
  'Uganda',
  'Ukraine',
  'United Arab Emirates',
  'United Kingdom',
  'United States',
  'Uruguay',
  'Uzbekistan',
  'Vanuatu',
  'Vatican City',
  'Venezuela',
  'Vietnam',
  'Yemen',
  'Zambia',
  'Zimbabwe',
];

final TextEditingController textEditingController = TextEditingController();
final TextEditingController cityController = TextEditingController();

void showLocationPicker(
    BuildContext context, Function(String) onLocationSelected) {
  String selectedLocation = '';
  String? selectedValue; // Track the selected country
  TextEditingController cityController = TextEditingController();

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Country Picker Dropdown

                  // City Input Field
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: const Color.fromRGBO(54, 40, 221, 1),
                      )),
                      child: TextField(
                        controller: cityController,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          hintText: 'Enter City',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: DropdownButtonHideUnderline(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromRGBO(54, 40, 221, 1),
                          ),
                        ),
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            'Enter Country',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          items: items
                              .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            height: 40,
                            width: 200,
                          ),
                          dropdownStyleData: const DropdownStyleData(
                            maxHeight: 200,
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                          ),
                          dropdownSearchData: DropdownSearchData(
                            searchController: textEditingController,
                            searchInnerWidgetHeight: 50,
                            searchInnerWidget: Container(
                              height: 50,
                              padding: const EdgeInsets.only(
                                top: 8,
                                bottom: 4,
                                right: 8,
                                left: 8,
                              ),
                              child: TextFormField(
                                expands: true,
                                maxLines: null,
                                controller: textEditingController,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  hintText: 'Search for an item...',
                                  hintStyle: const TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            searchMatchFn: (item, searchValue) {
                              return item.value
                                  .toString()
                                  .toLowerCase()
                                  .contains(searchValue.toLowerCase());
                            },
                          ),
                          onMenuStateChange: (isOpen) {
                            if (!isOpen) {
                              textEditingController.clear();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 120),
                  // Apply Button
                  InkWell(
                    onTap: () {
                      Navigator.pop(context); // Close the modal

                      // Concatenate country and city values
                      if (selectedValue != null &&
                          cityController.text.isNotEmpty) {
                        selectedLocation =
                            '$selectedValue, ${cityController.text}';
                      } else if (selectedValue != null) {
                        selectedLocation = selectedValue!;
                      }

                      onLocationSelected(
                          selectedLocation); // Pass the concatenated location back
                    },
                    child: Container(
                      width: 240,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(54, 40, 221, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text('Apply',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
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

bool _switchValue = true; // Track the switch state
// Show the filter options modal
void showFilterOptions(
    BuildContext context, Function(int, int) onAgeRangeSelected) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    isScrollControlled:
        true, // Allows the bottom sheet to take more vertical space
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Adjusts height to fit content
                children: [
                  // Show me (Gender selection)
                  GestureDetector(
                    onTap: () {
                      showGenderSelection(context, (selectedGender) {
                        setState(() {
                          _selectedGender =
                              selectedGender; // Update selected gender
                        });
                      });
                    },
                    child: _buildFilterRow('Show me', _selectedGender),
                  ),

                  // Age range row with dynamic age range
                  GestureDetector(
                    onTap: () {
                      showAgeRangePicker(context, (start, end) {
                        onAgeRangeSelected(start, end);
                        setState(() {
                          _startAge = start; // Update start age
                          _endAge = end; // Update end age
                        });
                      }); // Open the age range picker
                    },
                    child:
                        _buildFilterRow('Age range', '$_startAge - $_endAge'),
                  ),

                  // Location
                  GestureDetector(
                    onTap: () {
                      showLocationPicker(context, (selectedLocation) {
                        setState(() {
                          _location =
                              selectedLocation; // Update the selected location
                        });
                      });
                    },
                    child: _buildFilterRow('Location', _location),
                  ),

                  // Online now switch
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Online now',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),

                        // The actual switch
                        Transform.scale(
                          scale:
                              0.9, // Adjust the scale to reduce the size (1.0 is default)
                          child: Switch(
                            value: _switchValue, // Current state of the switch
                            onChanged: (bool newValue) {
                              setState(() {
                                _switchValue =
                                    newValue; // Toggle the switch value
                              });
                            },
                            activeColor: Color.fromRGBO(
                                54, 40, 221, 1), // Thumb color when active
                            activeTrackColor:
                                Colors.white, // Track color when active
                            inactiveThumbColor:
                                Colors.grey, // Thumb color when inactive
                            inactiveTrackColor:
                                Colors.grey[300], // Track color when inactive
                          ),
                        ),
                      ],
                    ),
                  ),

                  // "More options" placeholder
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'More options',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MoreOptions()),
                            );
                          },
                          icon: Icon(Icons.arrow_forward_ios,
                              size: 16, color: Colors.grey[600]),
                        ),
                      ]),
                  const SizedBox(height: 20),
                  // Apply Filters Button

                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 240,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(54, 40, 221, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text('Apply Filters',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
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

// Gender selection modal
void showGenderSelection(
    BuildContext context, Function(String) onGenderSelected) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Show me',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Which gender(s) would you like to see?',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),
            genderOption(context, 'Women', onGenderSelected),
            genderOption(context, 'Men', onGenderSelected),
            genderOption(context, 'Everyone', onGenderSelected),
            const SizedBox(height: 20),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    },
  );
}

// Gender option button builder
Widget genderOption(
    BuildContext context, String gender, Function(String) onGenderSelected) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: InkWell(
      onTap: () {
        onGenderSelected(gender); // Pass selected gender back
        Navigator.pop(context); // Close gender selection modal
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        decoration: BoxDecoration(
          color: gender == _selectedGender
              ? const Color(0xFF3628DD)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
            color: const Color(0xFF3628DD), // Border color for all buttons
          ),
        ),
        child: Center(
          child: Text(
            gender,
            style: TextStyle(
                color: gender == _selectedGender ? Colors.white : Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ),
  );
}

// Filter row builder
Widget _buildFilterRow(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(width: 5),
            Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey[600]),
          ],
        ),
      ],
    ),
  );
}

// Helper method to create each filter option tile
Widget _buildFilterTile(String title, String subtitle) {
  return ListTile(
    title: Text(title),
    subtitle: Text(subtitle),
    trailing: const Icon(Icons.chevron_right),
    onTap: () {
      // Handle filter tap if needed
    },
  );
}

class _FilterOptionssState extends State<FilterOptionss> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
