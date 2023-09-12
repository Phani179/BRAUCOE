import 'package:flutter/material.dart';
import 'package:untitled/Screens/OtpPage.dart';
import 'package:untitled/Screens/ResetPasswordPage.dart';

import '../Screens/ForgotPassword.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "University-BRAU",
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home:  Material(
        child: ForgotPassword(),
      ),
    );
  }
  }


