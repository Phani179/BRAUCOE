import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:braucoe/providers/login_provider.dart';
import 'package:braucoe/widgets/shimmer_effect/home_page_shimmer_loading.dart';
import 'package:braucoe/screens/login/student_login.dart';
import 'logo_screen.dart';

class Handler extends StatefulWidget {
  static const String routeName = '/handler';
  static bool? loginStatus;

  @override
  State<StatefulWidget> createState() => _Handler();
}

class _Handler extends State<Handler> {
  late SharedPreferences prefs;
  bool? isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    print('Handler');
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
                        LogoScreen.isLoggedIn = true;
                        return LogoScreen();
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
                  LogoScreen.isLoggedIn = false;
                  return const LogoScreen();
                }
              } else {
                LogoScreen.isLoggedIn = false;
                return const LogoScreen();
              }
            }
            // SplashScreen
            return const CircularProgressIndicator();
          }),
    );
  }

  Future whereToGo() async {
    print("Step 2");
    prefs = await SharedPreferences.getInstance();
    print("Step 3");
    isLoggedIn = prefs.getBool(StudentLogin.isLoggedIn);
    print("${prefs.getBool(StudentLogin.isLoggedIn)}");
    Handler.loginStatus = isLoggedIn ?? false;
    print("Step 4");
    return true;
  }
}
