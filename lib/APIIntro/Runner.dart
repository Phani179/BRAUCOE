import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/Screens/ScreenLoading.dart';
import '../API/ResultInfo.dart';
import '../ModelClasses/StudentInfo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Material(
        child: ScreenLoading(),
      ),
    );
  }
}

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   getResult(2081951044);
  // }
  late StudentInfo? studentInfo = null;
  late ResultInfo resultInfo;
  static List student = [];
  static List result =[];
  static List studentResultDetails = [];
  Future getResult(var reg_no) async
  {
    print(DateTime.now());
    final url = "https://springbootdemo-production-70a9.up.railway.app/result/${reg_no}";
    final uri = Uri.parse(url);
    print("Request Sent");
    var response = await http.get(uri);
    if(response.statusCode == 200)
      {
          var body = jsonDecode(response.body);
          print(body);
          print("Body Parsed");
          // Student Data
          studentInfo = StudentInfo();
          studentInfo?.setStudentId(body["student_id"]);
          studentInfo?.setStudentName(body["student_name"]);
          studentInfo?.setBranch(body["branch"]);
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
          studentResultDetails.add(student);
          studentResultDetails.add(result);
      }
    return studentResultDetails;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      // child: Container(
      //     child: studentInfo == null ? Center(child: Text("Loading")) : Center(child: Text("${studentInfo?.getStudentName()}")),
      // ),
      child: AlertDialog(
        title: FutureBuilder(
          future: getResult(2081951044),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
          {
            if(snapshot.hasData)
            {
              return Center(child: Text("${studentInfo?.getStudentName()}"));
            }
            else if(snapshot.connectionState == ConnectionState.waiting)
            {
              return Center(child: CircularProgressIndicator());
            }
            else
              {
                return Center(child: Text("Loading Failed"),);
              }
          },
        ),
      ),
    );
  }
}
