import 'dart:convert';
import 'package:http/http.dart' as http;


class ApiService{
static const String _apiKey = '...';
static const String _baseUrl = '...';
Future<String> sendMessage(String prompt) async {
  final body=jsonEncode({
    'contents' : [ {'parts' : [{ 'text': prompt }]}],
  });
  final response = await http.post(
    Uri.parse(_baseUrl),
    headers: {'Content-Type': 'application/json'},
    body:body,
    );
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