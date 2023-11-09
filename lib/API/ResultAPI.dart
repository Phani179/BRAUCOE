import 'dart:convert';
import 'package:http/http.dart' as http;
import '../ModelClasses/ResultInfo.dart';

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
    "Semester - 1" : 6,
    "Semester - 2" : 10,
    "Semester - 3" : 10,
    "Semester - 4" : 9,
    "Semester - 5" : 9,
    "Semester - 6" : 0,
    "Semester - 7" : 4,
    "Semester - 8" : 3,
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
    print(body);
    if(body == null)
      {
        return "";
      }
    print("Body Parsed");
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
    print(DateTime.now());
    print("Results Fetched");
    print(result);

    return result;
  }
}
