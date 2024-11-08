import 'package:flutter/material.dart';
import 'package:ikchatbot/ikchatbot.dart';
import 'package:love_bird/chatBot/chat_keywords.dart';

class ChatBotConfigProvider with ChangeNotifier {
  final IkChatBotConfig _chatBotConfig = IkChatBotConfig(
    ratingIconYes: const Icon(Icons.star),
    ratingIconNo: const Icon(Icons.star_border),
    ratingIconColor: Colors.black,
    ratingBackgroundColor: Colors.white,
    ratingButtonText: 'Submit Rating',
    thankyouText: 'Thanks for your rating!',
    ratingText: 'Rate your experience:',
    ratingTitle: 'Thank you for using the chatbot!',
    body: 'This is a test email sent from Flutter and Dart.',
    subject: 'Test Rating',
    recipient: 'hr@gn128.com',
    isSecure: false,
    senderName: 'Your Name',
    smtpUsername: 'Your Email',
    smtpPassword: 'your password',
    smtpServer: 'smtp.gmail.com',
    smtpPort: 587,
    sendIcon: const Icon(Icons.send, color: Colors.red),
    userIcon: const Icon(Icons.person, color: Colors.white),
    botIcon: const Icon(Icons.android, color: Colors.white),
    botChatColor: const Color.fromARGB(255, 81, 80, 80),
    delayBot: 100,
    closingTime: 30, // In minutes
    delayResponse: 1, // In seconds
    userChatColor: Colors.blue,
    waitingTime: 1,
    keywords: keywords,
    responses: responses,
    backgroundColor: Colors.white,
    backgroundImage: 'images/wallpaper.jpg',
    initialGreeting:
        "👋 Hello! \nWelcome to LoveBird\nHow can I assist you today?",
    defaultResponse: "Sorry, I didn't understand your response.",
    inactivityMessage: "Is there anything else you need help with?",
    closingMessage: "This conversation will now close.",
    inputHint: 'Send a message',
    waitingText: 'Please wait...',
    useAsset: false,
    backgroundAssetimage: 'images/wallpaper.jpg',
  );

  IkChatBotConfig get chatBotConfig => _chatBotConfig;

  // Update ratingButtonText and notify listeners
  void updateRatingButtonText(String newText) {
    _chatBotConfig.ratingButtonText = newText;
    notifyListeners();
  }

  void initializeChat() {
    // Reset or initialize any required configuration
    // Example: Clearing previous state, setting up new defaults, etc.

    notifyListeners(); // Notify listeners if any state has changed
  }
}
