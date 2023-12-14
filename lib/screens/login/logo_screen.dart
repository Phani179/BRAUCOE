import 'package:flutter/material.dart';
import 'package:braucoe/screens/home_page/home_page.dart';
import 'package:braucoe/screens/login/screen2.dart';

import '../../utilities/images.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({super.key});
  static bool? isLoggedIn;

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  Widget build(BuildContext context) {
    print('Logo Screen - ${LogoScreen.isLoggedIn}');
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Positioned(
                    child: Image.asset(Images.homePageLogoBG1),
                  ),
                  // Ellipse7
                  Positioned(
                    child: Image.asset(Images.homePageLogoBG2),
                  ),
                  // BRAU LOGO
                  Positioned(
                    child: Image.asset(Images.homePageLogo),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'All you need is',
            style: TextStyle(
              fontFamily: 'LibreFranklin-SemiBold',
              fontSize: 35,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            'at one place',
            style: TextStyle(
              fontFamily: 'LibreFranklin-SemiBold',
              fontSize: 35,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Complete your task like drinking water,',
            style: TextStyle(
              fontFamily: 'LibreFranklin-Light',
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
          const Text(
            'no obstacle just flow into body.',
            style: TextStyle(
              fontFamily: 'LibreFranklin-Light',
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x33000000),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                backgroundColor: const Color(0xFF00512D), // #00512D
                // padding: const EdgeInsets.fromLTRB(76, 18, 76, 17),
              ),
              onPressed: () {
                LogoScreen.isLoggedIn! ? Navigator.pushNamed( context, HomePage.routeName) : Navigator.of(context).pushNamed(Screen2.routeName);
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => const Screen2()));
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.8,
                child: const Center(
                  child: Text(
                    "Get started",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "LibreFranklin-Regular",
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}