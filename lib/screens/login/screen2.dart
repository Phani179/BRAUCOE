import 'package:flutter/material.dart';
import 'package:untitled/utilities/images.dart';

import 'screen2_button_styling.dart';
import 'student_login.dart';

class Screen2 extends StatelessWidget {
  static const String routeName = '/second-screen';

  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset(
                        Images.bRAULogoBG,
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset(Images.bRAULogo),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  const Text(
                    'Dr. B. R. AMBEDKAR UNIVERSITY',
                    style: TextStyle(
                      fontFamily: 'LibreFranklin-Bold',
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: Color(0xFF382E1E),
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'College of Engineering, ',
                        style: TextStyle(
                          fontFamily: 'LibreFranklin-SemiBold',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Color(0xFF382E1E),
                        ),
                      ),
                      Text(
                        'Srikakulam',
                        style: TextStyle(
                          fontFamily: 'LibreFranklin-Regular',
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Color(0xFF382E1E),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: 70,
                            width: 70,
                            child: Image.asset(Images.nAACB)),
                        SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(Images.iSO)),
                        SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(Images.sraddavanLogo)),
                        SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.asset(Images.swachBharat)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Welcome!',
                    style: TextStyle(
                      fontFamily: 'LibreFranklin-SemiBold',
                      fontWeight: FontWeight.w600,
                      fontSize: 40,
                      color: Color(0xFF382E1E),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Continue as:',
                        style: TextStyle(
                          fontFamily: 'LibreFranklin-Medium',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color(0xFF382E1E),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Screen2ButtonStyling(
                    text: "Student",
                    onPressed: () {
                      Navigator.pushNamed(context, StudentLogin.routeName);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => StudentLogin(),
                      //   ),
                      // );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
