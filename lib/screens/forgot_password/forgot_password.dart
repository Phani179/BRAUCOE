import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/screens/forgot_password/otp_page.dart';
import '../login/normal_textfield.dart';

class ForgotPassword extends StatefulWidget
{
  @override
  State<ForgotPassword> createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword>
{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NormalTextFields.textController.clear();
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
                    onPressed: () {
                      NormalTextFields.textController.clear();
                      Navigator.pop(context);
                      },
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
                    child: Text('Forgot Password?',style:TextStyle(
                        fontSize:25,
                        fontFamily:'LibreFranklin-Regular' ,
                        //  fontStyle: FontStyle.normal,
                        fontWeight:FontWeight.w600,
                        color:Color(0XFF382E1E)))),
                const Positioned(
                  left:30,
                  top:400,
                  height: 20,
                  child: Text('Enter your Registration number below.',
                    style:TextStyle(fontFamily: 'LibreFranklin-Regular',
                        //  fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color:Color(0xFF382E1E),
                        fontSize: 17
                    ),
                  ),
                ),
                Positioned(
                    top: 500,
                    left: 20,
                    right: 20,
                    child: NormalTextFields(hintText: "Registration number", prefixIcon: Icons.person_outline, inputType: TextInputType.text, filteringTextInputFromatter: [FilteringTextInputFormatter.digitsOnly],)
                ),

                Positioned(
                  top: 650,
                  left: 50,
                  right: 50,
                  height: 50,
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
                          backgroundColor: Color(0XFF00512D),
                        ),
                        onPressed: () {
                          // showDialog(
                          //     context: context,
                          //   builder: (BuildContext context) {
                          //     return OtpPageRedirect();
                          //   },
                          // );
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpPage()));
                        },
                        child: const Text('Next',
                          style:TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: Color(0XFFFCFCFC),
                              fontFamily: 'LibreFranklin-Regular'
                          ),
                        ),
                      )
                  ),
                ),
                const Positioned(
                  left: 50,
                  right: 30,
                  top: 760,
                  child: Text('A 4-digit confirmation code will be sent',
                    style:TextStyle(fontFamily: 'LibreFranklin-Regular',
                        //  fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color:Color(0xFF382E1E),
                        fontSize: 17
                    ),
                  ),
                ),
                const Positioned(
                  left: 79,
                  top: 777,
                  child: Text('to the registered mobile number.',
                    // to the registered mobile number.
                    style:TextStyle(fontFamily: 'LibreFranklin-Regular',
                        //  fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color:Color(0xFF382E1E),
                        fontSize: 17
                    ),
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