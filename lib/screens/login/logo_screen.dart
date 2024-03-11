import 'package:flutter/material.dart';

import 'package:braucoe/screens/login/screen2.dart';
import 'package:braucoe/utilities/images.dart';
import 'package:braucoe/screens/bottom_nav_bar.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({super.key});

  static bool? isLoggedIn;

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 3000,
      ),
    );
    controller.forward();
    Future.delayed(
      const Duration(
        milliseconds: 2200,
      ),
      () {
        setState(() {
          body = SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(2, 0),
              end: const Offset( 0, 0),
            ).animate(controller),
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
                      LogoScreen.isLoggedIn!
                          ? Navigator.pushNamed(context, BottomNavBar.routeName)
                          : Navigator.of(context).pushNamed(Screen2.routeName);
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
        });
      },
    );
  }

  Widget body = TweenAnimationBuilder(
    tween: Tween<double>(begin: 0, end: 200),
    duration: const Duration(
      milliseconds: 2000,
    ),
    builder: (ctx, size, child) {
      return Center(
        child: SizedBox(
          height: size * 2,
          width: size * 2,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Positioned(
                child: Image.asset(
                  Images.homePageLogoBG1,
                  width: size * 2,
                  height: size * 2,
                ),
              ),
              // Ellipse7
              Positioned(
                child: Image.asset(
                  Images.homePageLogoBG2,
                  width: size * 2,
                  height: size * 2,
                ),
              ),
              Positioned(
                child: Image.asset(
                  Images.homePageLogo,
                  width: size * 2,
                  height: size * 2,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    print('Logo Screen - ${LogoScreen.isLoggedIn}');
    return Scaffold(
      body: SafeArea(
        child: body,
      ),
    );
  }
}
