import 'package:flutter/material.dart';
import 'package:untitled/Screens/Screen2ImageStyling.dart';
import 'package:untitled/Screens/Screen2TextStyling.dart';

import 'Screen2ButtonStyling.dart';
import 'StudentLogin.dart';

class Screen2 extends StatelessWidget
{
  const Screen2({super.key});
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            // BRAULogo Background Image.
            Screen2ImageStyling(leftInPositioned : 45, rightInPositioned : 45, topInPositioned : 50, heightInSizedBox : 225, widthInSizedBox : 225, imageURL : "assets/images/BRAULogoBG.png"),
            //BRAULogo
            Screen2ImageStyling(leftInPositioned : 90, rightInPositioned : 90, topInPositioned : 82, heightInSizedBox : 160, widthInSizedBox : 160, imageURL : "assets/images/BRAULogo.png"),
            // NAACB
            Screen2ImageStyling(leftInPositioned : 20, rightInPositioned : 300, topInPositioned : 320, heightInSizedBox : 100, widthInSizedBox : 100, imageURL : "assets/images/NAACB.png"),
            // ISO
            Screen2ImageStyling(leftInPositioned : 40, rightInPositioned : 150, topInPositioned : 346, heightInSizedBox : 46, widthInSizedBox : 45, imageURL : "assets/images/ISO.png"),
            //Sraddavan Labithey jananam
            Screen2ImageStyling(leftInPositioned : 70, rightInPositioned : 25, topInPositioned : 346, heightInSizedBox : 50, widthInSizedBox : 50, imageURL : "assets/images/SraddavanLogo.png"),
            //SwachBharat
            Screen2ImageStyling(leftInPositioned : 280, rightInPositioned : 20, topInPositioned : 330, heightInSizedBox : 75, widthInSizedBox : 75, imageURL : "assets/images/SwachBharat.png"),
            //Dr. B. R. AMBEDKAR UNIVERSITY
            Screen2TextStyling(topInPositioned : 290, leftInPositioned : 30, text : "Dr. B. R. AMBEDKAR UNIVERSITY", fontFamily: "LibreFranklin-Bold" ,fontWeight : FontWeight.w700, fontSize : 20),
            //College of Engineering,
            Screen2TextStyling(topInPositioned : 314, leftInPositioned : 50, text : "College of Engineering, ", fontFamily: "LibreFranklin-SemiBold" , fontWeight : FontWeight.w600, fontSize : 18),
            //Srikakulam
            Screen2TextStyling(topInPositioned : 317, leftInPositioned : 250, text : "Srikakulam", fontFamily: "LibreFranklin-Regular" , fontWeight : FontWeight.w500, fontSize : 15),
            //Welcome!
            Screen2TextStyling(topInPositioned : 415, leftInPositioned : 100, text : "Welcome!", fontFamily: "LibreFranklin-SemiBold" , fontWeight : FontWeight.w600, fontSize : 40),
            //Continue as:
            Screen2TextStyling(topInPositioned : 480, leftInPositioned : 10, text : "Continue as:", fontFamily: "LibreFranklin-Medium" , fontWeight : FontWeight.w500, fontSize : 20),
            //Student Button
            Screen2ButtonStyling(top : 530, text: "Student", onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => StudentLogin()));
            },),  // 590
            //Admin Button
            Screen2ButtonStyling(top : 625, text: "Admin", onPressed: null),     // 690
          ],
        ),
    );
  }
}