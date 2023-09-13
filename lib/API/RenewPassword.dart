import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled/API/LoginAPI.dart';

void main()
{
  RenewPassword renewPassword = RenewPassword();
  renewPassword.renewPassword("Aaryan@1234");
}

class RenewPassword
{
  Future renewPassword(String newPassword) async
  {
    // LoginAPI.studentDetails?.studentId
    final url = "https://braucoeapi-production.up.railway.app/updatePassword/${LoginAPI.studentDetails?.studentId}";
    final uri = Uri.parse(url);
    print(jsonEncode({
      "newPassword" : "${newPassword}"
    }));
    final response = await http.put(
        uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "newPassword" : "${newPassword}"
      }
      ),
    );
    final body = jsonDecode(response.body);
    print(body);
    return body;
  }
}