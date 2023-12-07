// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// import '../ModelClasses/student_details.dart';
// import '../ModelClasses/student_personal_info.dart';
//
// void main()
// {
//   StudentDetailsAPI studentDetailsAPI = StudentDetailsAPI();
//   studentDetailsAPI.getStudentDetails(2081951001);
//   Future.delayed(Duration(seconds: 2), ()
//   {
//   print(StudentDetailsAPI.studentDetails.student_name);
//   print(StudentDetailsAPI.studentDetails.studentId);
//   print(StudentDetailsAPI.studentPersonalInfo.password);
// });
// }
//
// class StudentDetailsAPI
// {
//   // static StudentDetails studentDetails = StudentDetails();
//   // static StudentPersonalInfo studentPersonalInfo = StudentPersonalInfo();
//
//   Future<dynamic> getStudentDetails(var studentId) async
//   {
//     print(DateTime.now());
//     final url = "https://braucoeapi-production.up.railway.app/student/${studentId}";
//     final uri = Uri.parse(url);
//     print("URL Parsed");
//     var response = await http.get(uri);
//     print("Response decoded");
//     var body = jsonDecode(response.body);
//     studentDetails.student_name = body[0]["student_name"];
//     studentDetails.studentId = body[0]["studentRegNo"];
//     studentDetails.father_name = body[0]["father_name"];
//     studentDetails.branch = body[0]["branch"];
//     studentDetails.mobile_no = body[0]["mobile_no"];
//     studentDetails.gender = body[0]["gender"];
//     studentDetails.dateOfWillingness = body[0]["dateOfWillingness"];
//     studentPersonalInfo.dateOfBirth = body[0]["studentPersonalInfo"]["dateOfBirth"];
//     studentPersonalInfo.category = body[0]["studentPersonalInfo"]["category"];
//     studentPersonalInfo.feeReimbursementStatus = body[0]["studentPersonalInfo"]["feeReimbursementStatus"];
//     studentPersonalInfo.isPhysicalHandicap =body[0]["studentPersonalInfo"]["isPhysicalHandicap"];
//     studentPersonalInfo.password = body[0]["studentPersonalInfo"]["password"];
//     studentPersonalInfo.passportSizePhoto = body[0]["studentPersonalInfo"]["passportSizePhoto"];
//     studentPersonalInfo.permanentAddress = body[0]["studentPersonalInfo"]["permanentAddress"];
//     print(DateTime.now());
//   }
// }