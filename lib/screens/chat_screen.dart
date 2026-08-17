import '../models/chat_message.dart';
import 'package:flutter/material.dart';
import '../widgets/message_bubble.dart';
import '../services/api_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
  
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessage> _messages = [];
  TextEditingController _textController = TextEditingController();
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  void _sendMessage() async {
    final userText = _textController.text;
    if (_textController.text.trim().isEmpty) {
      return;
    }
    _textController.clear();
    setState(() {
      _messages.add(
        ChatMessage(
        text: userText, 
        isUser: true,
        createdAt: DateTime.now(),
        ));
         _isLoading=true;});
        try {
          final response = await _apiService.sendMessage(userText);
          setState(() {
            _messages.add(
              ChatMessage(
                text: response,
                isUser: false,
                createdAt: DateTime.now(),
        ));
        _isLoading = false;
          });
        } catch (e) {
          setState((){_isLoading = false;});
          print('Hata: $e');
          }
      
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        shadowColor: Colors.black26,
        centerTitle: false,
        title: const Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xFFE3F2FD),
              child: Icon(
                Icons.auto_awesome,
                color: Color(0xFF007AFF),
                size: 20,
              ),
            ),
            SizedBox(width: 10),
            Text(
              'AI Chat',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
        body:Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context,index)
                {return MessageBubble(message: _messages[index]);},
              ),
              ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical:8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                  color:Colors.black.withOpacity(0.05),
                  blurRadius:10,
                  offset:const Offset(0,-2),
                  ),
                ],
              ),
              child:SafeArea(
                child: Row(
                  children: [
                    Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F2F5),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: const Color(0xFFE4E6EB)),
                      ),
                      child:TextField(
                        controller: _textController,
                        style: const TextStyle(color: Colors.black87, fontSize: 15),
                        decoration: const InputDecoration(hintText: 'Bir mesaj yazın...',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,),
                          onSubmitted: (_) => _sendMessage(), 
                      ),),),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        radius:22,
                        backgroundColor: const Color(0xFF007AFF),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_upward, color: Colors.white, size: 20),
                      onPressed: _sendMessage,
                      ),
                      ),
                  ],
                )
                )
            )
          ]
              )
        );
  }
}
