import 'package:flutter/material.dart';
import 'package:untitled/Screens/OtpPage.dart';
import 'package:untitled/Screens/ResetPasswordPage.dart';
import 'package:untitled/Screens/HomePageShimmerLoading.dart';
import 'package:untitled/Trails/ImageLoading.dart';
import 'package:untitled/Screens/LoginShimmer.dart';
import 'package:untitled/Trails/ShimmerLoading.dart';
import 'package:untitled/Trails/ShowProfile.dart';

import '../Screens/ForgotPassword.dart';

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
        child: HomePageShimmerLoading(),
      ),
    );
  }
  }


