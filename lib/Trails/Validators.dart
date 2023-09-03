import 'package:http/http.dart';

class Validators
{
  String? validatePassword(String password)
  {
    if(password == RegExp(r'[^\S]'))
      {
        return "Success";
      }
    return "Fail";
  }
}