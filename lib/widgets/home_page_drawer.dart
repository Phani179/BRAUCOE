import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:braucoe/main.dart';
import 'package:braucoe/screens/login/handler.dart';
import 'package:braucoe/screens/login/logo_screen.dart';
import 'package:braucoe/screens/profie/profile_page.dart';
import 'package:braucoe/widgets/profile_image_generator.dart';
import '../providers/login_provider.dart';
import '../screens/help/help.dart';
import '../screens/login/student_login.dart';

class HomePageDrawer extends StatelessWidget {
  HomePageDrawer({required this.scaffoldState, super.key});

  GlobalKey<ScaffoldState> scaffoldState;

  void _goToLoginPage(context) {
    print(' LOGIN STATUS DATA :- ${Handler.loginStatus}');
    Handler.loginStatus! ? Navigator.pushReplacementNamed(context, StudentLogin.routeName) : Navigator.popUntil(context, (route) => route.settings.name == StudentLogin.routeName);
  }

  void _setSharedPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(StudentLogin.isLoggedIn, false);
    print("Logout : ${prefs.getBool(StudentLogin.isLoggedIn)}");
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: height * 0.95,
            margin: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                GestureDetector(
                  onTap: scaffoldState.currentState?.closeDrawer,
                  child: const Icon(Icons.arrow_back_outlined),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                ProfileImageGenerator(
                  radius: 60,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  "${LoginAPI.studentDetails?.student_name}",
                  style: const TextStyle(
                      fontSize: 20,
                      fontFamily: "LibreFranklin-SemiBold",
                      color: Color(0xFF382E1E)),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  "${LoginAPI.studentDetails?.studentId}",
                  style: const TextStyle(
                      fontFamily: "LibreFranklin-Medium",
                      fontSize: 20,
                      color: Color(0xFF382E1E)),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                GestureDetector(
                  child: const Text(
                    "View Profile",
                    style: TextStyle(
                      color: Color(0x99382E1E),
                      fontFamily: "LibreFranklin-SemiBold",
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePageScreen()));
                  },
                ),
                const Spacer(),
                const Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.help,
                      color: Color(0xFF382E1E),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    GestureDetector(
                      child: const Text(
                        "Help",
                        style: TextStyle(
                          fontFamily: "LibreFranklin-Medium",
                          fontSize: 18,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, HelpScreen.routeName);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.013,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Color(0xFF382E1E),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    GestureDetector(
                      child: const Text(
                        "Rate",
                        style: TextStyle(
                          fontFamily: "LibreFranklin-Medium",
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.013,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.feedback,
                      color: Color(0xFF382E1E),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    GestureDetector(
                      child: const Text(
                        "Feedback",
                        style: TextStyle(
                          fontFamily: "LibreFranklin-Medium",
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width * 0.15, height * 0.05),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      backgroundColor: const Color(0xFF00512D),
                      disabledBackgroundColor: const Color(0xFF00512D),
                    ),
                    onPressed: () {
                      LogoScreen.isLoggedIn = false;
                      _setSharedPrefs();
                      _goToLoginPage(context);
                      // Navigator.popUntil(context, (route) => false)
                    },
                    child: const Text(
                      "LOGOUT",
                      style: TextStyle(
                        color: Color(0xFFFCFCFC),
                        fontFamily: "LibreFranklin-Bold",
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
