import 'package:ai_chat/models/message_model.dart';
import 'package:flutter/material.dart';
import '../widgets/message_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
  
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessage> _messages = [];
  TextEditingController _textController = TextEditingController();
  void _sendMessage() {
    if (_textController.text.trim().isEmpty) {
      return;
    }
    setState(() {
      _messages.add(ChatMessage(
        text: _textController.text, 
        isUser: true, 
        createdAt: DateTime.now(),
        )
        );
        _textController.clear();
    });
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
