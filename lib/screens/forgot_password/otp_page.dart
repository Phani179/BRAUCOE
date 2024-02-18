import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:braucoe/screens/forgot_password/reset_password_page.dart';
import '../../data/apis/login_api.dart';
import '../../data/apis/otp_api.dart';

class OtpPage extends StatefulWidget {

  static const String routeName = '/otp-page';

  int reg_no;
  int? generatedOtp = 0000;
  int? userOtp;

  OtpPage({required this.reg_no, super.key});

  @override
  State<OtpPage> createState() => _OtpPage();
}

class _OtpPage extends State<OtpPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.reg_no);
    LoginAPI loginApi = LoginAPI();
    OtpAPI otpAPI = OtpAPI();
    loginApi.getStudent(widget.reg_no).then((value) => {
          print(value),
          otpAPI.getOTP(LoginAPI.studentDetails?.mobile_no).then((value) {
            print(value);
            widget.generatedOtp = value;
          }),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
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
                      'Enter Code',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'LibreFranklin-Regular',
                        //  fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        color: Color(0XFF382E1E),
                      ),
                    ),

                    const SizedBox(
                      height: 5,
                    ),

                    const Text(
                      'Enter the 4-digit confirmation code we sent',
                      style: TextStyle(
                        fontFamily: 'LibreFranklin-Regular',
                        //  fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF382E1E),
                        fontSize: 17,
                      ),
                    ),

                    const Text(
                      'you below.',
                      style: TextStyle(
                        fontFamily: 'LibreFranklin-Regular',
                        //  fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF382E1E),
                        fontSize: 17,
                      ),
                    ),

                    const SizedBox(
                      height: 40,
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 70,
                            child: OtpTextField(
                              numberOfFields: 4,
                              fieldWidth: 65,
                              showFieldAsBox: true,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              textStyle: const TextStyle(
                                  color: Color(0xFF382E1E),
                                  fontFamily: "LibreFranklin-Regular",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 23),
                              cursorColor: const Color(0xFF382E1E),
                              enabledBorderColor: const Color(0x00CF9F69),
                              focusedBorderColor: const Color(0x4DCF9F69),
                              filled: true,
                              fillColor: const Color(0xCCEFE1D0),
                              borderRadius: BorderRadius.circular(10),
                              onSubmit: (code) {
                                widget.userOtp = int.parse(code);
                                print(code);
                              },
                            ),
                          ),

                          const SizedBox(
                            height: 50,
                          ),

                          Container(
                            height: 55,
                            width: double.infinity,
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
                                print(widget.userOtp.runtimeType);
                                print(widget.generatedOtp.runtimeType);
                                if (widget.userOtp == widget.generatedOtp &&
                                    widget.userOtp != null) {
                                  Navigator.pushReplacementNamed(context, ResetPassword.routeName);
                                } else {
                                  final snackBar = SnackBar(
                                    content: Text("Incorrect OTP"),
                                    action: SnackBarAction(
                                      label: "Ok",
                                      onPressed: () {},
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                              child: const Text(
                                'Verify Code',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0XFFFCFCFC),
                                    fontFamily: 'LibreFranklin-Regular'),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          InkWell(
                            child: const Text(
                              "Resend Code",
                              style: TextStyle(
                                color: Color(0xFF00512D),
                                fontFamily: "LibreFranklin-Regular",
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onTap: () {
                              LoginAPI loginApi = LoginAPI();
                              OtpAPI otpAPI = OtpAPI();
                              loginApi
                                  .getStudent(widget.reg_no)
                                  .then((value) => {
                                print(value),
                                otpAPI
                                    .getOTP(
                                    LoginAPI.studentDetails?.mobile_no)
                                    .then((value) {
                                  print(value);
                                  widget.generatedOtp = value;
                                }),
                              });
                            },
                          ),
                        ],
                      ),
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
