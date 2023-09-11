import 'dart:convert';
import 'package:untitled/ModelClasses/StudentInfo.dart';
import 'package:http/http.dart' as http;
import 'ResultInfo.dart';

void main()
{
  ResultAPI resultAPI = ResultAPI();
  resultAPI.getResult("Semester - 1", 2081951044);
  Future.delayed(const Duration(milliseconds: 3000),()
  {
    print("Data Fetched for User");
    resultAPI.getResult("Semester - 1", 2081951044);
  });
}

class ResultAPI
{
  late StudentInfo studentInfo;
  late ResultInfo resultInfo;
  static List student = [];
  static List result =[];
  static List studentResultDetails = [];
  Map<String, List?> semesterDetails = {
    "Semester - 1" : null,
    "Semester - 2" : null,
    "Semester - 3" : null,
    "Semester - 4" : null,
    "Semester - 5" : null,
    "Semester - 6" : null,
    "Semester - 7" : null,
    "Semester - 8" : null,
  };
  Future getResult(var semester,var reg_no) async
  {
    if(semesterDetails[semester] != null)
      {
        print("Same User");
        student = [];
        result = [];
        student = semesterDetails[semester]?[0];
        result = semesterDetails[semester]?[1];
        return;
      }
    print("First User");
    print(DateTime.now());
    final url = "https://springbootdemo-production-70a9.up.railway.app/result/${semester}/${reg_no}";
 //   final url = "https://springbootdemo-production-70a9.up.railway.app/result/${reg_no}";
    final uri = Uri.parse(url);
    print("URL Parsed");
    final response = await http.get(uri);
    print(response);
    print("Request Sent");
    var body = jsonDecode(response.body);
    print(body);
    print("Body Parsed");
    // Student Data
    studentInfo = StudentInfo();
    studentInfo.setStudentId(body["student_id"]);
    studentInfo.setStudentName(body["student_name"]);
    studentInfo.setBranch(body["branch"]);
    student.add(studentInfo);
    studentResultDetails.add(student);
    print(student[0].getStudentName());
    // Student Result
    for(var i = 1; i <= 4; i++)
      {
        resultInfo = ResultInfo();
        resultInfo.setPapCode(body["results"]["pap${i}c"]);
        resultInfo.setPapName(body["results"]["pap${i}n"]);
        resultInfo.setPapGPA(body["results"]["pap${i}gr"]);
        result.add(resultInfo);
      }
    studentResultDetails.add(result);
    if(semesterDetails[semester] == null)
      {
        semesterDetails[semester] = studentResultDetails;
        studentResultDetails = [];
      }
    print(DateTime.now());
    print("Results Fetched");
  }
}
