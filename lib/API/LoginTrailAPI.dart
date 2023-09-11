import 'dart:convert';
import 'package:http/http.dart' as http;

// This API is Trail API, Which is for Testing. Now it is Deprecated.
class LoginTrailAPI
{
  static List<dynamic> student = [];
  Future<dynamic> getUser(var reg_no) async
  {
    print(DateTime.now());
    final url = "https://springbootdemo-production-70a9.up.railway.app/student/${reg_no}";
    print("URL Fetched");
    final uri = Uri.parse(url);
    print("URI Parsed");
    var response = await http.get(uri);
    print(response);
    print("Response Fetched");
    var body = jsonDecode(response.body);
    print("Response Decoded");
    student = body;
    print("Converted to Student");
    print(DateTime.now());
    return student;
  }
}
