import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/providers/login_api.dart';
import 'package:untitled/utilities/images.dart';
import 'package:untitled/widgets/shimmer_effect/home_page_shimmer_loading.dart';
import 'package:untitled/screens/login/student_login.dart';
import '../home_page/home_page.dart';
import 'screen2.dart';

class Handler extends StatefulWidget {
  static const String routeName = '/';

  @override
  State<StatefulWidget> createState() => _Handler();
}

class _Handler extends State<Handler> {
  var prefs;
  bool? isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // body: HomePage()
        body: FutureBuilder(
            future: whereToGo(),
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              if (snapshot.hasData) {
                if (isLoggedIn != null) {
                  if (isLoggedIn == true) {
                    var studentId = prefs.getInt(StudentLogin.studentId);
                    LoginAPI loginAPI = LoginAPI();
                    return FutureBuilder(
                      future: loginAPI.getStudent(studentId),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          return HomePage();
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // Home Page Rendering.
                          return const HomePageShimmerLoading();
                        } else {
                          return const HomePageShimmerLoading();
                        }
                      },
                    );
                  } else {
                    return LogoPage();
                  }
                } else {
                  return LogoPage();
                }
              }
              // SplashScreen
              return const CircularProgressIndicator();
            }));
  }

  Future whereToGo() async {
    print("Step 2");
    prefs = await SharedPreferences.getInstance();
    print("Step 3");
    isLoggedIn = prefs.getBool(StudentLogin.isLoggedIn);
    print("${isLoggedIn}");
    print("Step 4");
    return true;
  }
}

class LogoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                Navigator.of(context).pushNamed(Screen2.routeName);
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
