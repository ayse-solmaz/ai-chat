import 'package:ai_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'screens/chat_screen.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: const ChatScreen(),
    );
  }
}