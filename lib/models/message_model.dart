
class ChatMessage{
    final String text;
    final bool isUser;
    final DateTime createdAt;


ChatMessage(
  {
    required this.text,
    required this.isUser,
    required this.createdAt,

  }
);
Map<String,dynamic> toMap() {
  return{
    'text': text,
    'isUser': isUser,
    'createdAt':createdAt.toIso8601String(),
  } ;}
factory ChatMessage.fromMap(Map<String, dynamic> map) {
  return ChatMessage(
    text:map['text'] ?? '',
    isUser:map['isUser'] ?? false,
   createdAt: DateTime.parse(map['createdAt'] ?? DateTime.now().toIso8601String()),
   );
   }
}