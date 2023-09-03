import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/API/LoginAPI.dart';
import 'package:untitled/Screens/PasswordTextField.dart';
import 'Help.dart';
import 'HomePage.dart';
import 'NormalTextFields.dart';

class Screen3 extends StatefulWidget
{
  bool isLoaded = false;
  final Reg_no = "2081951044";
  final Password = "Phani@7989";
  var loaded;
  @override
  State<Screen3> createState() => _Screen3();
}

class _Screen3 extends State<Screen3>
{
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  getStudent(var reg_no) async{
    widget.loaded = await LoginTrailAPI().getUser(reg_no);
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
                      onTap: null,
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
                            // login(NormalTextFields.textController.text);
                            var isSuccess = false;
                            LoginTrailAPI loginApi = LoginTrailAPI();
                            var reg_no = NormalTextFields.textController.text;
                            loginApi.getUser(reg_no);
                                Future.delayed(Duration(milliseconds: 3000), (){
                                  var password = PasswordTextField.passwordController.text;
                                  print(LoginTrailAPI.student[0]["password"]);
                                  setState(()  {
                                    if(password == LoginTrailAPI.student[0]["password"])
                                    {
                                      isSuccess = true;
                                    }
                                    password = '';
                                  });
                                  print(isSuccess);
                                  showDialog(context: context, builder: (context){
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
                                            onPressed: (){
                                              Navigator.pop(context);
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
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
                                  });
                                });
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