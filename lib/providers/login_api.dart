import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled/modal_classes/student_details.dart';
import 'package:untitled/modal_classes/student_qualifications.dart';
import 'package:untitled/modal_classes/student_personal_info.dart';

void main() {
  LoginAPI loginAPI = LoginAPI();
  loginAPI.getStudent(2081951014);
  Future.delayed(const Duration(seconds: 5), () {
  });
}

class LoginAPI {
  static StudentDetails? studentDetails;
  static StudentPersonalInfo? personalInfo;
  static StudentQualifications? studentQualifications;
  Map<dynamic, dynamic>? users = {};

  Future<dynamic> getStudent(var studentId) async {
    // print("Login API Called");
    // if(users != null && users?[studentDetails?.studentId] != null)
    //   {
    //     print("Same User");
    //     return users?[studentDetails?.studentId];
    //   }
    // print("New User");
    final url =
        'http://braucoeapi-production.up.railway.app/student/$studentId';
    final uri = Uri.parse(url);
    print(uri);
    print("Request Sent");
    final response = await http.get(uri);
    final body = jsonDecode(response.body);
    print(body);
    print("Data Parsed");
    studentDetails = StudentDetails.fromMap(body[0]);
    personalInfo = StudentPersonalInfo.fromMap(body[0]["studentPersonalInfo"]);
    studentQualifications =
        StudentQualifications.fromMap(body[0]["studentQualifications"]);
    print("Data Converted");
    List<dynamic> userDetails = [];
    userDetails.add(studentDetails);
    userDetails.add(personalInfo);
    users?[studentDetails?.studentId] = userDetails;
    print("User Saved");
    print(LoginAPI.personalInfo?.passportSizePhoto.runtimeType);
    print(personalInfo?.password);
    return users;
  }
}
