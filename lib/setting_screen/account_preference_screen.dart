import 'package:love_bird/safety_privacy_screens/instantly_translate_languages_to_english_screen.dart';
import 'package:love_bird/safety_privacy_screens/notifications_screen.dart';
import 'package:love_bird/safety_privacy_screens/payment_settings_screen.dart';
import 'package:love_bird/safety_privacy_screens/sexual_orgasm_picture.dart';
import 'package:love_bird/setting_screen/incognito_mode_onsetting_screen.dart';
import 'package:love_bird/setting_screen/privacy_onsetting_screen.dart';
import 'package:love_bird/setting_screen/verification_screen.dart';
import 'package:flutter/material.dart';

class AccountPreferenceScreen extends StatefulWidget {
  const AccountPreferenceScreen({super.key});

  @override
  State<AccountPreferenceScreen> createState() =>
      _AccountPreferenceScreenState();
}

class _AccountPreferenceScreenState extends State<AccountPreferenceScreen> {
  bool isDarkMode = false; // State variable for Dark Mode

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
            Image.asset(
              "images/ai.png",
            ),
            Container(width: 20),
            const Text(
              'Account Preference',
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
            title: const Text(
              'Privacy',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Basic Info Screen
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PrivacyOnSettingsScreen()),
              );
            },
          ),
          const Divider(color: Color(0xFF3628DD)),
          ListTile(
            title: const Text(
              'Notifications',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Basic Info Screen
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationsScreen()),
              );
            },
          ),
          const Divider(color: Color(0xFF3628DD)),
          ListTile(
            title: const Text(
              'Verifications',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Account Preferences Screen
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const VerificationScreen()),
              );
            },
          ),
          const Divider(color: Color(0xFF3628DD)),
          ListTile(
            title: const Text(
              'Payment settings',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Personalize Experience Screen
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PaymentSettingScreen()),
              );
            },
          ),
          const Divider(color: Color(0xFF3628DD)),
          ListTile(
            title: const Text(
              'Incognito mode',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Help Center Screen
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const IncognitoModeOnSettingScreen()),
              );
            },
          ),
          const Divider(color: Color(0xFF3628DD)),
          ListTile(
            title: const Text(
              'Sexual organ picture recognition and censoring',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to About Screen
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SexualOrgasmPicturesScreen()),
              );
            },
          ),
          const Divider(color: Color(0xFF3628DD)),
          ListTile(
            title: const Text(
              'Instantly translate other languages to English',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Blocked Users Screen
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const InstantlyTranslateOtherLanguageToEnglishScreen()),
              );
            },
          ),
          const Divider(color: Color(0xFF3628DD)),
          ListTile(
            title: const Text(
              'Dark mode',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: Transform.scale(
              scale: 0.75,
              child: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value; // Update the dark mode state
                  });
                },
                activeColor: const Color(
                    0xFF3628DD), // Color of the switch when it is ON
                activeTrackColor:
                    Colors.white, // Color of the track when switch is ON
                inactiveThumbColor: const Color(
                    0xFF3628DD), // Color of the thumb when switch is OFF
                inactiveTrackColor:
                    Colors.grey[200], // Color of the track when switch is OFF
              ),
            ),
            onTap: () {
              // Optionally, you can also toggle dark mode on tap
              setState(() {
                isDarkMode = !isDarkMode; // Toggle dark mode on tap
              });
            },
          ),
          const Divider(color: Color(0xFF3628DD)),
        ],
      ),
    );
  }
}
