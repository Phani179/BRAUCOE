import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/providers/login_api.dart';
import 'package:untitled/screens/shimmer_effect/home_page_shimmer_loading.dart';
import 'package:untitled/screens/login/student_login.dart';
import '../home_page/home_page.dart';
import 'screen2.dart';



class Handler extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Handler();
}

class _Handler extends State<Handler> {

  var prefs;
  bool? isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "University-BRAU",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
              })),
    );
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
    return Stack(
      children: <Widget>[
        // Ellipse6
        Positioned(
          left: 33,
          top: 60,
          child: Image.asset('assets/images/HomePageLogoBG1.png'),
        ),
        // Ellipse7
        Positioned(
          left: 75,
          top: 100,
          child: Image.asset('assets/images/HomePageLogoBG2.png'),
        ),

        // BRAU LOGO
        Positioned(
          left: 108, //110
          top: 130, //130
          child: Center(child: Image.asset('assets/images/HomePageLogo.png')),
        ),
        // Text
        const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 230), // 230
              Center(
                child: Text('All you need is',
                    style: TextStyle(
                      fontFamily: 'LibreFranklin-SemiBold',
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              Text('at one place ',
                  style: TextStyle(
                    fontFamily: 'LibreFranklin-SemiBold',
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(
                height: 45,
              ),
              SelectionContainer.disabled(
                child: Text(
                  'Complete your task like drinking water,',
                  style: TextStyle(
                    fontFamily: 'LibreFranklin-Light',
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Text(
                'no obstacle just flow into body.',
                style: TextStyle(
                  fontFamily: 'LibreFranklin-Light',
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 44,
              ),
            ],
          ),
        ),

        // Button
        Positioned(
          top: 620,
          // 635
          height: 59,
          left: 20,
          right: 20,
          child: SizedBox(
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33000000),
                      offset: Offset(4, 6),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ]),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  backgroundColor: const Color(0xFF00512D), // #00512D
                  // padding: const EdgeInsets.fromLTRB(76, 18, 76, 17),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Screen2()));
                }, // Next Page Navigation.
                child: const Text(
                  "Get started",
                  style: TextStyle(
                      fontFamily: "LibreFranklin-Regular",
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
