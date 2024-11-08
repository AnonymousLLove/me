import 'package:flutter/material.dart';

import 'package:love_bird/chatBot/chatbot_config_provider.dart';
import 'package:love_bird/chatBot/chatbot_screen.dart';
import 'package:love_bird/chatBot/font_size_provider.dart';
import 'package:provider/provider.dart';

class ChatbotWelcomeScreen extends StatefulWidget {
  const ChatbotWelcomeScreen({super.key});

  @override
  State<ChatbotWelcomeScreen> createState() => _ChatbotWelcomeScreenState();
}

class _ChatbotWelcomeScreenState extends State<ChatbotWelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSizeProvider = Provider.of<FontSizeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3628DD),
        leading: const Icon(Icons.arrow_back_ios, color: Colors.white),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: screenWidth,
                    height: screenHeight * 0.6,
                    decoration: const BoxDecoration(
                      color: Color(0xFF3628DD), // Background color
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              color: const Color.fromRGBO(54, 40, 221, 1),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, left: 5, right: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Hello there",
                                          style: TextStyle(
                                            fontSize: fontSizeProvider
                                                .getFontSize(2.0),
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Image.asset('assets/images/wave.png',
                                            height: 18),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "I am Libby!",
                                      style: TextStyle(
                                        fontSize: fontSizeProvider.getFontSize(
                                            1.0), // Smaller font size
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Welcome to Love Bird AI Virtual Assistance.",
                                      style: TextStyle(
                                        fontSize:
                                            fontSizeProvider.getFontSize(1.0),
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      "You can ask me anything on dating, relationship advice, event & activity suggestions, conversation advice, real-life tips, etc.",
                                      style: TextStyle(
                                        fontSize:
                                            fontSizeProvider.getFontSize(1.0),
                                        color: Colors.white,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.2),
                  Image.asset('images/icons/image1.png'),
                ],
              ),
            ),
            Positioned(
              // Using screen height and width to calculate top, left, and right
              top: screenHeight * 0.52,
              left: screenWidth * 0.1,
              right: screenWidth * 0.1,
              child: GestureDetector(
                onTap: () {
                  context.read<ChatBotConfigProvider>().initializeChat();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatBotScreen(),
                    ),
                  );
                },
                child: Container(
                  height: screenHeight * 0.15,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(10, 10),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(54, 40, 221, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 50),
                        child: Row(
                          children: [
                            Image.asset('assets/images/icons/sendAi.png'),
                            const SizedBox(width: 5),
                            Center(
                              child: Text(
                                'Ask me Anything',
                                style: TextStyle(
                                  fontSize: fontSizeProvider.getFontSize(1.0),
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
}
