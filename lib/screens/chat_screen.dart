import 'package:ai_chat/models/message_model.dart';
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
          setState((){_isLoading = false;});}
      
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('AI Chat'),
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
            Row(
              children: [
                Expanded(
                  child:TextField(controller:_textController),
                    ),
              IconButton(
                icon: Icon(Icons.send), 
                onPressed: _sendMessage),],
                )
          ]
              )
        );
  }
}
