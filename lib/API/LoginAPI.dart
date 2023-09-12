import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled/ModelClasses/StudentDetails.dart';
import '../ModelClasses/StudentPersonalInfo.dart';

void main()
{
  LoginAPI loginAPI = LoginAPI();
  loginAPI.getStudent(2081951001);
  Future.delayed(Duration(seconds: 5), (){print(LoginAPI.studentDetails?.student_name);});
}

class LoginAPI
{
  static StudentDetails? studentDetails;
  static StudentPersonalInfo? personalInfo;
  Map<dynamic, dynamic>? users = {};
  Future<dynamic> getStudent(var studentId) async
  {
    print("Login API Called");
    if(users != null && users?[studentDetails?.studentId] != null)
      {
        print("Same User");
        return users?[studentDetails?.studentId];
      }
    print("New User");
    final url = "https://braucoeapi-production.up.railway.app/student/${studentId}";
    final uri = Uri.parse(url);
    print("Request Sent");
    final response = await http.get(uri);
    final body = jsonDecode(response.body);
    print("Data Parsed");
    studentDetails = StudentDetails.fromMap(body[0]);
    personalInfo = StudentPersonalInfo.fromMap(body[0]);
    print("Data Converted");
    List<dynamic> userDetails = [];
    userDetails.add(studentDetails);
    userDetails.add(personalInfo);
    users?[studentDetails?.studentId] = userDetails;
    print("User Saved");
    print(personalInfo?.password);
    return users;
  }
}