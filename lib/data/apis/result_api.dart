import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:braucoe/data/models/result_info.dart';

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
  late ResultInfo resultInfo;
  static List result =[];
  static double SGPA = 0;
  static List studentResultDetails = [];
  Map<String, int> semesterDetails = {
    "semester_1" : 6,
    "semester_2" : 10,
    "semester_3" : 10,
    "semester_4" : 9,
    "semester_5" : 9,
    "semester_6" : 8,
    "semester_7" : 4,
    "semester_8" : 3,
  };
  Future getResult(var semester,var reg_no) async
  {
    // if(semesterDetails[semester] != null)
    //   {
    //     print("Same User");
    //     result = [];
    //     result = semesterDetails[semester]?[1];
    //     return;
    //   }
    result.clear();
    print("First User");
    print(DateTime.now());
    final url = "https://braucoeapi-production.up.railway.app/result/${semester}/${reg_no}";
    final uri = Uri.parse(url);
    print("URL Parsed");
    final response = await http.get(uri);
    print(response);
    print("Request Sent");
    var body = jsonDecode(response.body);
    if(body == null)
    {
      return "";
    }
    SGPA = body["sgpa"];
    // Student Result
    int? noOfSubjects = semesterDetails[semester];
    for(var i = 1; i <= noOfSubjects!; i++)
    {
      resultInfo = ResultInfo();
      resultInfo.setPapName = body["pap${i}n"];
      resultInfo.setPapGR = body["pap${i}gr"];
      resultInfo.setPapGRP = body["pap${i}grp"];
      result.add(resultInfo);
    }
    print("Results Fetched");
    return body;
    // print(body);
    // if(body == null)
    //   {
    //     return "";
    //   }
    // SGPA = body["sgpa"];
    // // Student Result
    // int? noOfSubjects = semesterDetails[semester];
    // for(var i = 1; i <= noOfSubjects!; i++)
    // {
    //   resultInfo = ResultInfo();
    //   resultInfo.setPapName = body["pap${i}n"];
    //   resultInfo.setPapGR = body["pap${i}gr"];
    //   resultInfo.setPapGRP = body["pap${i}grp"];
    //   result.add(resultInfo);
    // }
    // print("Results Fetched");
    // print(result);
    //
    // return result;
    // print("Body Parsed");

  }
}
