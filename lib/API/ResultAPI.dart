import 'dart:convert';
import 'package:untitled/API/StudentInfo.dart';
import 'package:http/http.dart' as http;
import 'ResultInfo.dart';

void main()
{
  ResultAPI resultAPI = ResultAPI();
  resultAPI.getResult(2081951044);
}
class ResultAPI
{
  late StudentInfo studentInfo;
  late ResultInfo resultInfo;
  static List student = [];
  static List result =[];
  Future<void> getResult(var reg_no) async
  {
    print(DateTime.now());
    final url = "https://springbootdemo-production-70a9.up.railway.app/result/${reg_no}";
    final uri = Uri.parse(url);
    print("Request Sent");
    var response = await http.get(uri);
    var body = jsonDecode(response.body);
    print(body);
    print("Body Parsed");
    // Student Data
    studentInfo = StudentInfo();
    studentInfo.setStudentId(body["student_id"]);
    studentInfo.setStudentName(body["student_name"]);
    studentInfo.setBranch(body["branch"]);
    student.add(studentInfo);
    // Student Result
    for(var i = 1; i <= 4; i++)
      {
        resultInfo = ResultInfo();
        resultInfo.setPapCode(body["results"]["pap${i}c"]);
        resultInfo.setPapName(body["results"]["pap${i}n"]);
        resultInfo.setPapGPA(body["results"]["pap${i}gr"]);
        result.add(resultInfo);
      }
    print(student[0].getStudentId());
    print(result[1].getPapName());
    print(DateTime.now());
    print("Results Fetched");
  }
}
