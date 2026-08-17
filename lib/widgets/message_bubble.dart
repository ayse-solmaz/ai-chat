import 'package:flutter/material.dart';
import 'package:ai_chat/models/message_model.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble
({super.key, required this.message});
final ChatMessage message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight: Alignment.centerLeft,
      child:Container(
        padding:EdgeInsets.all(12),
        decoration: BoxDecoration(
          color:message.isUser ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
          ),
          child:Text(message.text),
      ),
    );
  }
}