import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginTrailAPI
{
  static List<dynamic> student = [];
  Future getUser(var reg_no) async
  {
    final url = "https://springbootdemo-production-70a9.up.railway.app/student/${reg_no}";
    print("URL Fetched");
    final uri = Uri.parse(url);
    print("URI Parsed");
    var response = await http.get(uri).timeout(Duration(milliseconds: 4000));
    print("Response Fetched");
    var body = jsonDecode(response.body);
    print("Response Decoded");
    student = body;
    print("Converted to Student");
    return student;
  }
}
