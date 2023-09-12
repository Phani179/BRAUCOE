import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/API/RenewPassword.dart';
import 'package:untitled/Screens/PasswordTextField.dart';
import 'package:untitled/Screens/OtpPage.dart';
import 'NormalTextFields.dart';

class ResetPassword extends StatefulWidget
{
  @override
  State<ResetPassword> createState() => _ResetPassword();
}

class _ResetPassword extends State<ResetPassword>
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
    NormalTextFields.textController.clear();
    PasswordTextField.passwordController.clear();
  }
  @override
  Widget build(BuildContext context)
  {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
                    top:360,
                    height:44,
                    child: Text(
                        'Reset Password?',
                        style:TextStyle(
                        fontSize:25,
                        fontFamily:'LibreFranklin-SemiBold' ,
                        //  fontStyle: FontStyle.normal,
                        color:Color(0XFF382E1E),
                        ),
                    ),
                ),
                Positioned(
                  left:30,
                  top:390,
                  height:44,
                  child: SizedBox(
                    width: width*0.85,
                    child: const AutoSizeText(
                      'Reset password to log in to your account.',
                      minFontSize: 15,
                      style:TextStyle(
                        fontFamily:'LibreFranklin-Medium' ,
                        color:Color(0XFF382E1E),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left:30,
                  top:406,
                  child:SizedBox(
                    width: width * 0.85,
                    child: const AutoSizeText(
                            '( password must be at least 8 characters, contains at least one letter, one digit )',
                            minFontSize: 15,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style:TextStyle(
                              fontFamily:'LibreFranklin-Regular' ,
                              color:Color(0XFF382E1E),
                            ),
                          ),
                  ),
                ),
                // Password Field.
                Positioned(
                    top: 470,
                    left: 20,
                    right: 20,
                    child: PasswordTextField("New Password"),
                ),
                // TextField
                Positioned(
                    top: 550,
                    left: 20,
                    right: 20,
                    child: NormalTextFields(hintText: "Confirm Password", prefixIcon: Icons.lock_outline, inputType: TextInputType.text),
                ),
                Positioned(
                  top: 650,
                  width: width * 0.35,
                  right: 20,
                  height: height * 0.06,
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
                          if(PasswordTextField.passwordController.text == NormalTextFields.textController.text)
                          {
                            RenewPassword renewPassword = RenewPassword();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return FutureBuilder(
                                    future: renewPassword.renewPassword(PasswordTextField.passwordController.text),
                                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
                                  {
                                    if(snapshot.connectionState == ConnectionState.waiting)
                                      {
                                        return CircularProgressIndicator();
                                      }
                                    else if(snapshot.hasData)
                                      {
                                        return AlertDialog(
                                          content: Container(
                                            height:80,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 95,
                                                  child: Image.asset("assets/images/Done.png"),
                                                ),
                                                const Positioned(
                                                  left : 32,
                                                  top: 60,
                                                  child: AutoSizeText(
                                                    "Password Changed",
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    minFontSize: 18,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontFamily: "LibreFranklin-SemiBold",
                                                        color: Color(0xFF382E1E)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            Center(
                                              child: ElevatedButton(
                                                onPressed: (){
                                                  NormalTextFields.textController.clear();
                                                  PasswordTextField.passwordController.clear();
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                  backgroundColor: const Color(0xFFCF9F69),   // #00512D
                                                  // padding: const EdgeInsets.fromLTRB(76, 18, 76, 17),
                                                ),
                                                child: const Text("OK", style: TextStyle(fontSize: 16, fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w400
                                                    , color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],/**/
                                        );
                                      }
                                    else
                                      {
                                        return AlertDialog(
                                          title: Text("Failed"),
                                        );
                                      }
                                  },
                                );
                              },
                            );
                          }
                          else
                            {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Container(
                                      height:70,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 93,
                                            child: Image.asset("assets/images/Wrong.png"),
                                          ),
                                          Positioned(
                                            left: 104,
                                            top: 11,
                                            child: Image.asset("assets/images/LeftCross.png"),
                                          ),
                                          Positioned(
                                            left: 104,
                                            top: 11,
                                            child: Image.asset("assets/images/RightCross.png"),
                                          ),
                                          const Positioned(
                                            left : 10,
                                            top: 50,
                                            child: AutoSizeText(
                                              "Both fields must be same.",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              minFontSize: 18,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: "LibreFranklin-SemiBold",
                                                  color: Color(0xFF382E1E)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      Center(
                                        child: ElevatedButton(
                                          onPressed: (){
                                            Navigator.pop(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                            backgroundColor: const Color(0xFFCF9F69),   // #00512D
                                            // padding: const EdgeInsets.fromLTRB(76, 18, 76, 17),
                                          ),
                                          child: const Text("OK", style: TextStyle(fontSize: 16, fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w400
                                              , color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],/**/
                                  );
                                },
                              );
                            }
                        },
                        child: const Text('RESET',
                          style:TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Color(0XFFFCFCFC),
                              fontFamily: 'LibreFranklin-Regular'
                          ),
                        ),
                      )
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