import 'package:flutter/material.dart';
import 'package:ai_chat/models/chat_message.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.message});
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        // 1. Ekranın kenarlarına yapışmasın diye dış boşluk
        margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        // 2. Mesaj çok uzun olunca tüm satırı kaplayıp taşmasın diye genişlik sınırı
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          // Kullanıcı için şık mavi, bot için belirgin gri tonu
          color: message.isUser ? const Color(0xFF007AFF) : const Color(0xFFE9E9EB),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(message.isUser ? 16 : 4),
            bottomRight: Radius.circular(message.isUser ? 4 : 16),
          ),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            // Kullanıcı mesajında beyaz yazı, bot mesajında net siyah/koyu yazı
            color: message.isUser ? Colors.white : Colors.black87,
            fontSize: 15,
            height: 1.3,
          ),
        ),
      ),
    );
  }
}