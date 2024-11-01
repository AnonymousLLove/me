import 'package:flutter/material.dart';
import 'package:love_bird/onboarding/screen1.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const VideoApp();
  }
}
