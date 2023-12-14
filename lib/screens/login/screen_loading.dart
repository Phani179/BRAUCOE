import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:braucoe/providers/login_provider.dart';
import 'package:braucoe/providers/renew_password_provider.dart';
import 'package:braucoe/screens/home_page/home_page.dart';
import 'package:braucoe/screens/login/student_login.dart';
import 'package:braucoe/utilities/images.dart';
import '../../widgets/shimmer_effect/login_shimmer.dart';

class ScreenLoading extends StatefulWidget {
  const ScreenLoading(
      {required this.textEditingController,
      required this.passwordTextFieldController,
      super.key});

  final TextEditingController textEditingController;
  final TextEditingController passwordTextFieldController;

  @override
  State<ScreenLoading> createState() => _ScreenLoadingState();
}

class _ScreenLoadingState extends State<ScreenLoading> {
  var isSuccess = false;

  @override
  Widget build(BuildContext context) {
    int? studentId;
    if (widget.textEditingController.text.isNotEmpty) {
      studentId = int.parse(widget.textEditingController.text);
      print(studentId);
    }
    var password = widget.passwordTextFieldController.text;
    LoginAPI loginAPI = LoginAPI();
    if (widget.textEditingController.text.isEmpty) {
      return AlertDialog(
        title: const Text('Please enter Registration Number'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ok'),
          )
        ],
      );
    }
    if (widget.textEditingController.text.length < 10) {
      return AlertDialog(
        title: const Text('Check your Registration Number'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ok'),
          )
        ],
      );
    }
    return FutureBuilder(
      future: loginAPI.getStudent(studentId),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        HashPassword hashPassword = HashPassword();
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoginShimmerLoading();
        } else if (snapshot.hasData) {
          print("Data Decoded");
          if (hashPassword.hashPassword(password) == LoginAPI.personalInfo?.password) {
            widget.textEditingController.clear();
            widget.passwordTextFieldController.clear();
            isSuccess = true;
          }
          password = '';
          return isSuccess
              ? AlertDialog(
                  content: Container(
                    height: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1,
                                color: Color(0x4D382E1E),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Welcome!",
                            style: TextStyle(
                                fontSize: 22,
                                fontFamily: "LibreFranklin-Regular",
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF382E1E)),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Image.asset(Images.done),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text(
                          "Login Success",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "LibreFrancklin-Regular",
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF382E1E)),
                        ),
                        const Text(
                          "Congratulations, you can enjoy the services now!",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "LibreFranklin-Regular",
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF382E1E)),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  actions: [
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          Navigator.pop(context);
                          var prefs = await SharedPreferences.getInstance();
                          var loginStatus = isSuccess;
                          print("Login Status $loginStatus");
                          prefs.setBool(StudentLogin.isLoggedIn, loginStatus);
                          prefs.setInt(StudentLogin.studentId, studentId!);
                          Navigator.pushNamed(context, HomePage.routeName);
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: const Color(0xFFCF9F69), // #00512D
                          // padding: const EdgeInsets.fromLTRB(76, 18, 76, 17),
                        ),
                        child: const Text(
                          "OK",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Librefranklin-Regular",
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
              : AlertDialog(
                  content: Container(
                    height: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1,
                                color: Color(0x4D382E1E),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Oops!",
                            style: TextStyle(
                                fontSize: 22,
                                fontFamily: "Librefranklin-Regular",
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF382E1E)),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Image.asset("assets/images/Wrong.png"),
                                Image.asset("assets/images/LeftCross.png"),
                                Image.asset("assets/images/RightCross.png"),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Login Failed",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Librefranklin-Regular",
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF382E1E)),
                        ),
                        const Text(
                          "Please enter valid login credentials",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Librefranklin-Regular",
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF382E1E)),
                        ),
                        const Text(
                          "to enter your account.",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Librefranklin-Regular",
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF382E1E)),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: const Color(0xFFCF9F69), // #00512D
                          // padding: const EdgeInsets.fromLTRB(76, 18, 76, 17),
                        ),
                        child: const Text(
                          "OK",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Librefranklin-Regular",
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ], /**/
                );
        } else {
          return const AlertDialog(
            title: Text("Please, Enter Credentials"),
          );
        }
      },
    );
  }
}
