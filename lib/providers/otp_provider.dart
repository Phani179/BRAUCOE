import 'dart:convert';
import 'package:http/http.dart' as http;

class OtpAPI
{
  Future<int> getOTP(var mobileNumber) async
  {
    final url = "http://braucoeapi-production.up.railway.app/getOTP/${mobileNumber}";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final otp = jsonDecode(response.body);
    print(otp);
    return otp;
  }
}