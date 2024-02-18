import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:braucoe/data/apis/login_api.dart';

class RenewPasswordAPI {
  Future renewPassword(String newPassword) async {
    // LoginAPI.studentDetails?.studentId
    // print(LoginAPI.studentDetails?.studentId);
    final url =
        "https://braucoeapi-production.up.railway.app/updatePassword/${LoginAPI.studentDetails?.studentId}";
    final uri = Uri.parse(url);
    HashPassword hashPassword = HashPassword();
    String hashedPassword = hashPassword.hashPassword(newPassword);
    print(hashedPassword);
    final response = await http.put(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"newPassword": hashedPassword}),
    );
    final body = jsonDecode(response.body);
    print(body);
    return body;
  }
}

class HashPassword {
  String hashPassword(String password) {
    final bytes = utf8.encode(password);
    final hashedPassword = sha256.convert(bytes);
    return hashedPassword.toString();
  }
}
