import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/screens/login/screen_loading.dart';
import 'package:untitled/screens/login/password_textfield.dart';
import 'package:untitled/screens/forgot_password/forgot_password.dart';
import '../help/help.dart';
import 'normal_textfield.dart';

class StudentLogin extends StatefulWidget {
  static const String routeName = '/student-login';

  @override
  State<StudentLogin> createState() => _StudentLogin();

  static const String isLoggedIn = "isLoggedIn";
  static const String studentId = "studentId";
}

class _StudentLogin extends State<StudentLogin> {
  late TextEditingController textEditingController;
  late TextEditingController passwordEditingController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController();
    passwordEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF382E1E),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset('assets/images/Screen3ImageBG.png'),
                      Image.asset('assets/images/Screen3Image.png'),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('LOGIN',
                        style: TextStyle(
                            fontSize: 35,
                            fontFamily: 'LibreFranklin-SemiBold',
                            //  fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            color: Color(0XFF382E1E))),
                    const Text(
                      'Please sign in to continue',
                      style: TextStyle(
                          fontFamily: 'LibreFranklin-Medium',
                          //  fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF382E1E),
                          fontSize: 15),
                    ),
                    const SizedBox(
                      height: 33,
                    ),
                    NormalTextFields(
                      hintText: "Registration number",
                      prefixIcon: Icons.person_outline,
                      inputType: TextInputType.phone,
                      filteringTextInputFromatter: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      textController: textEditingController,
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    PasswordTextField(
                      "Current Password",
                      passwordController: passwordEditingController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                                fontFamily: "LibreFranklin-Medium",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, ForgotPassword.routeName);
                            },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            height: 45,
                            width: 120,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x33000000),
                                    offset: Offset(2, 4),
                                    blurRadius: 2,
                                    spreadRadius: 0,
                                  ),
                                ]),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                padding: const EdgeInsets.only(
                                  left: 25,
                                  right: 25,
                                ),
                                backgroundColor: const Color(0XFF00512D),
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return ScreenLoading(
                                        textEditingController:
                                            textEditingController,
                                        passwordTextFieldController:
                                            passwordEditingController,
                                      );
                                    });
                              },
                              child: const Text(
                                'LOGIN',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0XFFFCFCFC),
                                    fontFamily: 'LibreFranklin-Bold'),
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              const Center(
                child: Text(
                  "Having trouble to log in?",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: "LibreFranklin-Regular",
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: GestureDetector(
                  child: const Text(
                    "HELP",
                    style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1, 2),
                          blurRadius: 2,
                          color: Color(0x33000000),
                        ),
                      ],
                      fontFamily: "LibreFranklin-Bold",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Color(0xFFCF9F69),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, HelpScreen.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
