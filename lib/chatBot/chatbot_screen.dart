import 'package:flutter/material.dart';
import 'package:love_bird/chatBot/chatbot_config_provider.dart';

import 'package:provider/provider.dart';
import 'package:ikchatbot/ikchatbot.dart';

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the provider
    final chatBotConfigProvider = Provider.of<ChatBotConfigProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF3628DD),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      // Pass the configuration to `ikchatbot`
      body: ikchatbot(config: chatBotConfigProvider.chatBotConfig),
    );
  }
}
