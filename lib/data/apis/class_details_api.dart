import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:braucoe/data/models/student_card.dart';

void main() async {
  ClassDetailsAPI classDetailsAPI = ClassDetailsAPI();
  await classDetailsAPI.getAllStudents();
  // Future.delayed(const Duration(seconds: 5), () {});
}

class ClassDetailsAPI {
  List<StudentCard> allStudentsList = [];

  Future<List<StudentCard>> getAllStudents() async {
    final uri =
        Uri.parse('http://braucoeapi-production.up.railway.app/getAllStudents');
    final response = await http.get(uri);
    final students = jsonDecode(response.body);
    for (final student in students) {
      StudentCard studentCard = StudentCard(
          studentRegNo: student['studentRegNo'],
          studentName: student['studentName'],
          phoneNo: student['mobileNo'],
          admissionNo: student['admissionNo']);
      allStudentsList.add(studentCard);
    }
    print(allStudentsList);
    return allStudentsList;
  }
}
