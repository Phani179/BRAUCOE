import 'package:flutter/material.dart';
import 'package:untitled/Screens/ResultsModule/ResultTable.dart';
import 'package:untitled/Screens/ResultsModule/ResultHomePage.dart';

import 'ProfilePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "University-BRAU",
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home:  Material(
        color: Color(0xFFEFE1D0),
        child: ProfilePage(),
      ),
    );
  }
  }


