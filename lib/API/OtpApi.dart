import 'dart:convert';
import 'package:http/http.dart' as http;

void main()
{
  OtpApi otpApi = OtpApi();
  otpApi.getOTP(7989220011).then((value) => print(value));
}

class OtpApi
{
  Future<int> getOTP(var mobileNumber) async
  {
    final url = "http://braucoeapi-production.up.railway.app/getOTP/${mobileNumber}";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final otp = jsonDecode(response.body);
    return otp;
  }
}