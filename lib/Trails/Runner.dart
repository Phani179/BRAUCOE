import 'package:flutter/material.dart';
import 'package:untitled/Screens/CarosuelSliding.dart';
import 'package:untitled/Trails/PasswordValidaion.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "University-BRAU",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body :  PasswordValidation(hintText: "Password",),
      )
    );
  }
  }


