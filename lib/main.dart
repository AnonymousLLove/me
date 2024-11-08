import 'package:flutter/material.dart';
import 'package:love_bird/chatBot/chatbot_config_provider.dart';
import 'package:love_bird/chatBot/font_size_provider.dart';
import 'package:love_bird/config/routes.dart';
import 'package:love_bird/providers/birthday_provider.dart';
import 'package:love_bird/providers/create_account_provider.dart';
import 'package:love_bird/providers/distance_preference_provider.dart';
import 'package:love_bird/providers/gender_provider.dart';
import 'package:love_bird/providers/interest_provider.dart';
import 'package:love_bird/providers/nickname_provider.dart';
import 'package:love_bird/providers/relationship_goal_provider.dart';
import 'package:love_bird/providers/image_provider.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatBotConfigProvider()),
        ChangeNotifierProvider(create: (_) => FontSizeProvider()),
        ChangeNotifierProvider(create: (_) => NicknameProvider()),
        ChangeNotifierProvider(create: (_) => CelebrateYouProvider()),
        ChangeNotifierProvider(create: (_) => UserAccountProvider()),
        ChangeNotifierProvider(create: (_) => GenderProvider()),
        ChangeNotifierProvider(create: (_) => GoalProvider()),
        ChangeNotifierProvider(create: (_) => DistanceProvider()),
        ChangeNotifierProvider(create: (_) => InterestsProvider()),
        // ChangeNotifierProvider<SixImageProvider>(
        //     create: (_) => SixImageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Use addPostFrameCallback to schedule your update
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Access the FontSizeProvider and update it
      Provider.of<FontSizeProvider>(context, listen: false).updateFontSize(20);
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Love Bird',
      initialRoute: relationshipGoalsScreen, // Starting screen
      routes: routes,
    );
  }
}
