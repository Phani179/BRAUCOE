import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/API/LoginAPI.dart';
import 'package:untitled/Screens/HomePage.dart';
import 'package:untitled/Screens/LoginShimmer.dart';
import 'package:untitled/Screens/StudentLogin.dart';
import 'NormalTextFields.dart';
import 'PasswordTextField.dart';

class ScreenLoading extends StatefulWidget {
  const ScreenLoading({super.key});

  @override
  State<ScreenLoading> createState() => _ScreenLoadingState();
}

class _ScreenLoadingState extends State<ScreenLoading> {
  @override
  void initState() {
    // TODO: implement initState
  }

  var isSuccess = false;

  @override
  Widget build(BuildContext context)
  {
    var studentId = NormalTextFields.textController.text;
    var password = PasswordTextField.passwordController.text;
    LoginAPI loginAPI = LoginAPI();
    return FutureBuilder(
      future: loginAPI.getStudent(studentId),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
      {
        print(snapshot.connectionState);
        if(snapshot.connectionState == ConnectionState.waiting)
        {
          return LoginShimmerWidget();
        }
        else if(snapshot.hasData)
          {
            print("Data Decoded");
            if(password == LoginAPI.personalInfo?.password)
            {
              isSuccess = true;
            }
            password = '';
            return isSuccess ? AlertDialog(
              content: Container(
                height: 135,
                child: Stack(
                  children: [
                    Positioned(
                      left: 65,
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: Color(0x4D382E1E),
                            ),
                          ),
                        ),
                        child: const Text("Welcome!", style: TextStyle(fontSize: 22, fontFamily: "Librefranklin-Regular", fontWeight: FontWeight.w700
                            , color: Color(0xFF382E1E)),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 100,
                      top : 35,
                      child: Image.asset("assets/images/Done.png"),
                    ),
                    const Positioned(
                      left: 60,
                      top: 80,
                      child: Text("Login Success", style: TextStyle(fontSize: 16, fontFamily: "Librefranklin-Regular", fontWeight: FontWeight.w600
                          , color: Color(0xFF382E1E) ),),
                    ),
                    const Positioned(
                      top: 100,
                      child: Text("Congratulations, you can enjoy", style: TextStyle(fontSize: 16, fontFamily: "Librefranklin-Regular", fontWeight: FontWeight.w400
                          , color: Color(0xFF382E1E) ),),
                    ),
                    const Positioned(
                      left: 50,
                      top: 120,
                      child: Text("the services now!", style: TextStyle(fontSize: 16, fontFamily: "Librefranklin-Regular", fontWeight: FontWeight.w400
                          , color: Color(0xFF382E1E) ),),
                    ),
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
                        prefs.setString(StudentLogin.studentId, studentId);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      backgroundColor: const Color(0xFFCF9F69),   // #00512D
                      // padding: const EdgeInsets.fromLTRB(76, 18, 76, 17),
                    ),
                    child: const Text("OK", style: TextStyle(fontSize: 16, fontFamily: "Librefranklin-Regular", fontWeight: FontWeight.w400
                        , color: Colors.white),
                    ),
                  ),
                ),
              ],/**/
            )
                : AlertDialog(
              content: Container(
                height: 135,
                child: Stack(
                  children: [
                    Positioned(
                      left: 83,
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: Color(0x4D382E1E),
                            ),
                          ),
                        ),
                        child: const Text("Oops!", style: TextStyle(fontSize: 22, fontFamily: "Librefranklin-Regular", fontWeight: FontWeight.w700
                            , color: Color(0xFF382E1E)),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 93,
                      top : 35,
                      child: Image.asset("assets/images/Wrong.png"),
                    ),
                    Positioned(
                      left: 104,
                      top : 46,
                      child: Image.asset("assets/images/LeftCross.png"),
                    ),
                    Positioned(
                      left: 104,
                      top : 46,
                      child: Image.asset("assets/images/RightCross.png"),
                    ),
                    const Positioned(
                      left: 70,
                      top: 80,
                      child: Text("Login Failed", style: TextStyle(fontSize: 16, fontFamily: "Librefranklin-Regular", fontWeight: FontWeight.w600
                          , color: Color(0xFF382E1E) ),),
                    ),
                    const Positioned(
                      top: 100,
                      child: Text("Please enter valid login credentials", style: TextStyle(fontSize: 14, fontFamily: "Librefranklin-Regular", fontWeight: FontWeight.w400
                          , color: Color(0xFF382E1E) ),),
                    ),
                    const Positioned(
                      left: 50,
                      top: 120,
                      child: Text("to enter your account.", style: TextStyle(fontSize: 14, fontFamily: "Librefranklin-Regular", fontWeight: FontWeight.w400
                          , color: Color(0xFF382E1E) ),),
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
                    child: const Text("OK", style: TextStyle(fontSize: 16, fontFamily: "Librefranklin-Regular", fontWeight: FontWeight.w400
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
              title: Text("Please, Enter Credentials"),
            );
          }
      },
    );
  }
}
