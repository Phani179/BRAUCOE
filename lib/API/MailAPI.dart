import 'dart:convert';
import 'package:http/http.dart' as http;

class MailAPI
{
  Future sendMail(var studentId, String subject, String message) async
  {
    final uri = Uri.parse("https://braucoeapi-production.up.railway.app/sendMail");
    final reponse = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "subject" : "${subject}",
        "message" : "${studentId} \n ${message}"
      }),
    );
    final body = jsonDecode(reponse.body);
    print(body);
    return body;
  }
}