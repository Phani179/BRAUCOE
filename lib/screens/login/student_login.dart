import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/screens/login/screen_loading.dart';
import 'package:untitled/screens/login/password_textfield.dart';
import 'package:untitled/screens/forgot_password/forgot_password.dart';
import '../help/help.dart';
import 'normal_textfield.dart';

class StudentLogin extends StatefulWidget
{
  @override
  State<StudentLogin> createState() => _StudentLogin();

  static const String isLoggedIn = "isLoggedIn";
  static const String studentId = "studentId";

}

class _StudentLogin extends State<StudentLogin>
{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NormalTextFields.textController.clear();
    PasswordTextField.passwordController.clear();
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
                    top: 25,
                    left: 0,
                    child : IconButton(
                      onPressed: () {
                        NormalTextFields.textController.clear();
                        PasswordTextField.passwordController.clear();
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
                      top:350,
                      height:44,
                      width: 150,
                      child: Text('LOGIN',style:TextStyle(fontSize:35,
                          fontFamily:'LibreFranklin-SemiBold' ,
                          //  fontStyle: FontStyle.normal,
                          fontWeight:FontWeight.w600,
                          color:Color(0XFF382E1E)))),
                  const Positioned(
                    left:30,
                    top:390,
                    height: 20,
                    width: 200,
                    child: Text('Please sign in to continue',
                      style:TextStyle(fontFamily: 'LibreFranklin-Medium',
                          //  fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color:Color(0xFF382E1E),
                          fontSize: 15),
                    ),
                  ),
                  Positioned(
                      top: 430,
                      left: 20,
                      right: 20,
                      child: NormalTextFields(hintText: "Registration number", prefixIcon: Icons.person_outline, inputType: TextInputType.phone, filteringTextInputFromatter: [FilteringTextInputFormatter.digitsOnly],)
                  ),
                  Positioned(
                    top: 510,
                    left: 20,
                    right: 20,
                    child: PasswordTextField("Current Password",),
                  ),
                  Positioned(
                    top: 585,
                    right: 20,
                    child: GestureDetector(
                      child: Text("Forgot Password?", style: TextStyle(fontFamily: "LibreFranklin-Medium", fontSize: 15, fontWeight: FontWeight.w500, decoration: TextDecoration.underline),),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                      },
                    ),
                  ),
                  Positioned(
                    top:635,
                    right: 20,
                    height: 40,
                    width: 100,
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
                                  showDialog(context: context, builder: (context){
                                    return ScreenLoading();
                                  }
                                  );
                          },
                          child: const Text('LOGIN',
                            style:TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0XFFFCFCFC),
                                fontFamily: 'LibreFranklin-Bold'
                            ),
                          ),
                        )
                    ),
                  ),
                  const Positioned(
                    top: 705,
                    left: 100,
                    child: Text("Having trouble to log in?",
                      style: TextStyle(fontWeight: FontWeight.w400,
                        fontFamily: "LibreFranklin-Regular",
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 730,     // 730
                    left : 172,
                    child: GestureDetector(
                      child: const Text("HELP",
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
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Help()));
                      },
                    ),
                  ),
                ],),
            ),
          ),
        ),
    );
  }
}