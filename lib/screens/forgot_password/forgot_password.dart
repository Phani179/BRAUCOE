import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:braucoe/screens/forgot_password/otp_page.dart';
import '../login/normal_textfield.dart';

class ForgotPassword extends StatefulWidget {
  static const String routeName = '/forgot-password';
  final Color fillColor = const Color(0x4DCF9F69);
  final Color focusedColor = Colors.white;
  TextEditingController textEditingController = TextEditingController();

  @override
  State<ForgotPassword> createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
  bool isDataEmpty = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
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
                  height: 20,
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
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Forgot Password?',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'LibreFranklin-Regular',
                              //  fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              color: Color(0XFF382E1E))),
                      const Text(
                        'Enter your Registration number below.',
                        style: TextStyle(
                            fontFamily: 'LibreFranklin-Regular',
                            //  fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF382E1E),
                            fontSize: 17),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      NormalTextFields(
                        hintText: "Registration number",
                        textController: widget.textEditingController,
                        prefixIcon: Icons.person_outline,
                        inputType: TextInputType.text,
                        filteringTextInputFromatter: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.7,
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
                              backgroundColor: Color(0XFF00512D),
                            ),
                            onPressed: () {
                              print(widget.textEditingController.text);
                              print(widget.textEditingController.text.length);
                              if (widget.textEditingController.text.isEmpty || widget.textEditingController.text.length != 10) {
                                print('WRONG');
                                setState(() {
                                  isDataEmpty = true;
                                });
                              } else {
                                print('ENTERED');
                                Navigator.pushNamed(context, OtpPage.routeName, arguments: int.parse(widget.textEditingController.text),);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => OtpPage(
                                //               reg_no:
                                //                   int.parse(widget.textEditingController.text),
                                //             )));
                              }
                            },
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0XFFFCFCFC),
                                  fontFamily: 'LibreFranklin-Regular'),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Center(
                        child: Text(
                          'A 4-digit confirmation code will be sent',
                          style: TextStyle(
                              fontFamily: 'LibreFranklin-Regular',
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF382E1E),
                              fontSize: 17),
                        ),
                      ),
                      const Center(
                        child: Text(
                          'to the registered mobile number.',
                          // to the registered mobile number.
                          style: TextStyle(
                            fontFamily: 'LibreFranklin-Regular',
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF382E1E),
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (isDataEmpty)
                        const Center(
                          child: Text(
                            'Please correct Registration No.',
                            style: TextStyle(
                              fontFamily: 'LibreFranklin-Regular',
                              fontWeight: FontWeight.w500,
                              color: Colors.red,
                              fontSize: 17,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
