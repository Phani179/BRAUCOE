import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:braucoe/providers/renew_password_provider.dart';
import 'package:braucoe/screens/login/password_textfield.dart';
import 'package:braucoe/screens/login/student_login.dart';
import 'package:braucoe/utilities/images.dart';
import 'package:braucoe/widgets/shimmer_effect/mail_and_reset_pwd_shimmer_loading.dart';
import '../login/normal_textfield.dart';

class ResetPassword extends StatefulWidget {

  static const String routeName = '/reset-password';
  TextEditingController textEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  @override
  State<ResetPassword> createState() => _ResetPassword();
}

class _ResetPassword extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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

              const SizedBox(
                height: 15,
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
                  )
                ],
              ),

              const SizedBox(
                height: 25,
              ),

              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Reset Password?',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'LibreFranklin-SemiBold',
                        //  fontStyle: FontStyle.normal,
                        color: Color(0XFF382E1E),
                      ),
                    ),

                    const SizedBox(
                      height: 5,
                    ),

                    SizedBox(
                      width: width * 0.85,
                      child: const Text(
                        'Reset password to log in to your account.',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'LibreFranklin-Medium',
                          color: Color(0XFF382E1E),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: width * 0.85,
                      child: const Text(
                        '(password must be at least 8 characters, contains at least one letter, one digit)',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'LibreFranklin-Regular',
                          color: Color(0XFF382E1E),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    // Password Field.
                    PasswordTextField(
                      "New Password",
                      passwordController: widget.passwordEditingController,
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    // TextField
                    NormalTextFields(
                      hintText: "Confirm Password",
                      textController: widget.textEditingController,
                      prefixIcon: Icons.lock_outline,
                      inputType: TextInputType.text,
                    ),

                    const SizedBox(
                      height: 40,
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
                              if (widget.passwordEditingController.text ==
                                  widget.textEditingController.text && widget.passwordEditingController.text.isNotEmpty) {
                                RenewPasswordAPI renewPassword = RenewPasswordAPI();
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return FutureBuilder(
                                      future: renewPassword.renewPassword(
                                          widget.passwordEditingController.text),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<dynamic> snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return MailandResetPwdShimmerLoading();
                                        } else if (snapshot.hasData) {
                                          return AlertDialog(
                                            content: Container(
                                              height: 70,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                      Images.done),
                                                  const Text(
                                                    "Password Changed",
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontFamily:
                                                        "LibreFranklin-SemiBold",
                                                        color: Color(0xFF382E1E),),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            actions: [
                                              Center(
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.popUntil(context, (route) => route.settings.name == StudentLogin.routeName,);
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                    backgroundColor: const Color(
                                                        0xFFCF9F69), // #00512D
                                                    // padding: const EdgeInsets.fromLTRB(76, 18, 76, 17),
                                                  ),
                                                  child: const Text(
                                                    "OK",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily:
                                                        "LibreFranklin-Regular",
                                                        fontWeight: FontWeight.w400,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ], /**/
                                          );
                                        } else {
                                          return const AlertDialog(
                                            title: Text("Failed"),
                                          );
                                        }
                                      },
                                    );
                                  },
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Container(
                                        height: 65,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Stack(
                                                  alignment: AlignmentDirectional.center,
                                                  children: [
                                                    Image.asset(
                                                        Images.redBG),
                                                    Image.asset(
                                                        Images.leftCross),
                                                    Image.asset(
                                                        Images.rightCross),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const Text(
                                              "Check the credentials again.",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily:
                                                  "LibreFranklin-SemiBold",
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
                                                  borderRadius:
                                                  BorderRadius.circular(20)),
                                              backgroundColor:
                                              const Color(0xFFCF9F69), // #00512D
                                              // padding: const EdgeInsets.fromLTRB(76, 18, 76, 17),
                                            ),
                                            child: const Text(
                                              "OK",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "LibreFranklin-Regular",
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ], /**/
                                    );
                                  },
                                );
                              }
                            },
                            child: const Text(
                              'RESET',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0XFFFCFCFC),
                                  fontFamily: 'LibreFranklin-Regular'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
