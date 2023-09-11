import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:untitled/Screens/ResetPasswordPage.dart';
import '../API/LoginAPI.dart';
import '../API/OTPApi.dart';
import 'NormalTextFields.dart';

class OtpPage extends StatefulWidget
{
  int? generatedOtp;
  int? userOtp;
  OtpPage({super.key});
  @override
  State<OtpPage> createState() => _OtpPage();
}

class _OtpPage extends State<OtpPage>
{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoginAPI loginApi = LoginAPI();
    OtpApi otpApi = OtpApi();
    loginApi.getStudent(NormalTextFields.textController.text).then((value) => {
      print(value),
    otpApi.getOTP(LoginAPI.studentDetails?.mobile_no).then((value) {
      print(value);
      widget.generatedOtp = value; })
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                //remain code is the same
                Positioned(
                  top: 0,
                  left: 0,
                  child : IconButton(
                    onPressed: () { Navigator.pop(context); },
                    icon: const Icon(Icons.arrow_back, color: Color(0xFF382E1E),),
                  ),
                ),
                Positioned(
                  top: 55,
                  left: 90,
                  child: Image.asset('assets/images/Screen3ImageBG.png'),
                ),
                Positioned(
                  top: 64,
                  left: 60,
                  child: Image.asset('assets/images/Screen3Image.png'),
                ),
                const Positioned(
                    left:30,
                    top:360,
                    height:44,
                    child: Text('Enter CODE',style:TextStyle(
                        fontSize:25,
                        fontFamily:'LibreFranklin-Regular' ,
                        //  fontStyle: FontStyle.normal,
                        fontWeight:FontWeight.w600,
                        color:Color(0XFF382E1E),
                    ),
                    ),
                ),
                const Positioned(
                  left:30,
                  top:400,
                  height: 20,
                  child: Text(
                    'Enter the 4-digit confirmation code we sent',
                    style:TextStyle(fontFamily: 'LibreFranklin-Regular',
                        //  fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color:Color(0xFF382E1E),
                        fontSize: 17,
                    ),
                  ),
                ),
                const Positioned(
                  left:30,
                  top:420,
                  height: 20,
                  child: Text(
                    'you below.',
                    style:TextStyle(fontFamily: 'LibreFranklin-Regular',
                        //  fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color:Color(0xFF382E1E),
                        fontSize: 17,
                    ),
                  ),
                ),
                Positioned(
                    top: 500,
                    left: 40,
                    right: 40,
                  height: 60,
                  child: OtpTextField(
                    numberOfFields: 4,
                    fieldWidth: 50,
                    showFieldAsBox: true,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    textStyle: const TextStyle(
                      color: Color(0xFF382E1E),
                      fontFamily: "LibreFranklin-Regular",
                      fontWeight: FontWeight.w600,
                      fontSize: 23
                    ),
                    cursorColor: const Color(0xFF382E1E),
                    enabledBorderColor: const Color(0x00CF9F69),
                    focusedBorderColor: const Color(0x4DCF9F69),
                    filled: true,
                    fillColor: const Color(0xCCEFE1D0),
                    borderRadius: BorderRadius.circular(10),
                    onSubmit: (code){
                      widget.userOtp = int.parse(code);
                      print(code);
                    },
                  ),
                  ),
                Positioned(
                  top: 600,
                  left: 50,
                  right: 50,
                  height: 55,
                  child:Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const[
                            BoxShadow(
                              color: Color(0x33000000),
                              offset: Offset(2, 4),
                              blurRadius: 2,
                              spreadRadius: 0,
                            ),
                          ]
                      ),
                      child: ElevatedButton(
                        style:ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                          ),
                          padding:const EdgeInsets.only(
                            left:25,
                            right: 25,
                          ),
                          backgroundColor: const Color(0XFF00512D),
                        ),
                        onPressed: () {
                          print(widget.userOtp.runtimeType);
                          print(widget.generatedOtp.runtimeType);
                          if(widget.userOtp == widget.generatedOtp)
                            {
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword()));
                            }
                          else
                            {
                              final snackBar = SnackBar(
                                  content: Text("Incorrect OTP"),
                                action: SnackBarAction(
                                    label: "Ok",
                                  onPressed: () {
                                  },
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                        },
                        child: const Text('Verify Code',
                          style:TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Color(0XFFFCFCFC),
                              fontFamily: 'LibreFranklin-Regular'
                          ),
                        ),
                      )
                  ),
                ),
                Positioned(
                  top: 680,
                    left: 145,
                    child: GestureDetector(
                      child: const Text(
                          "Resend Code",
                        style: TextStyle(
                          color: Color(0xFF00512D),
                          fontFamily: "LibreFranklin-Regular",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          ),
                        ),
                      onTap: (){

                      },
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