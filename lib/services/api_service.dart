import 'dart:convert';
import 'package:http/http.dart' as http;


class ApiService{
static const String _apiKey = 'YOUR_API_KEY';
static const String _baseUrl = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=' + _apiKey;
Future<String> sendMessage(String prompt) async {
  final body=jsonEncode({
    'contents' : [ {'parts' : [{ 'text': prompt }]}],
  });
  final response = await http.post(
    Uri.parse(_baseUrl),
    headers: {'Content-Type': 'application/json'},
    body:body,
    );
    print(response.statusCode);
    print(response.body);
    if(response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final reply = data['candidates'][0]['content']['parts'][0]['text'];
      return reply;
      }
    else { 
      throw Exception('Hata: ${response.statusCode}'); 
      }
}
}