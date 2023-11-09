import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Screens/ProfileModule/profile_page.dart';
import 'package:untitled/widgets/profile_image_generator.dart';
import '../API/LoginAPI.dart';
import '../Screens/HelpModule/Help.dart';
import '../Screens/LoginModule/StudentLogin.dart';

class HomePageDrawer extends StatelessWidget {
  HomePageDrawer({required this.scaffoldState, super.key});

  GlobalKey<ScaffoldState> scaffoldState;

  void _goToLoginPage(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => StudentLogin()));
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
                  child: const Icon(Icons.arrow_back_outlined),
                  onTap: scaffoldState.currentState?.closeDrawer,
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Help()));
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
