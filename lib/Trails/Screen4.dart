import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Screens/HomePageModule/CarosuelSliding.dart';
import '../Screens/LoginModule/NormalTextFields.dart';

class Screen4 extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 5,
                left: 2,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Color(0xFF382E1E),),
                  onPressed:(){
                    NormalTextFields.textController.clear();
                    Navigator.pop(context);},
                ),
              ),

              Positioned(
                top: 62,
                left: 70,
                child: Image.asset("assets/images/Screen4BGSphere.png"),
              ),

              Positioned(
                top: 237,
                left: 105,
                child: Image.asset("assets/images/Screen4ImageStool.png"),
              ),

              Positioned(
                top: 218,
                left: 115,
                child: Image.asset("assets/images/Screen4ImageMug.png", color: Color(0xFF7A5AC1),),
              ),

              Positioned(
                top: 95,
                left: 90,
                child: Image.asset("assets/images/Screen4Image.png"),
              ),

              const Positioned(
                left:30,
                top:375,
                height:44,
                width: 115,
                child: Text('LOGIN',style:TextStyle(fontFamily: 'LibreFranklin-SemiBold',
                    fontWeight: FontWeight.w600,
                    color:Color(0XFF382E1E),fontSize: 35)),
              ),
              const Positioned(
                  left:30,
                  top:415,
                  height:20,
                  width:200,
                  child:Text('Please sign in to continue',
                      style:TextStyle(fontFamily:'LibreFranklin-Medium',
                          fontWeight: FontWeight.w500,
                          color:Color(0xFF382E1E),
                          fontSize: 15))
              ),

              Positioned(
                top: 460,
                left: 20,
                right: 20,
                child : NormalTextFields(hintText: "Mobile Number", prefixIcon: Icons.phone, inputType: TextInputType.phone, filteringTextInputFromatter: [FilteringTextInputFormatter.digitsOnly],),
                ),

              Positioned(
                top: 550,
                  bottom: 190,
                  right: 20,
                  left: 275,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(4,6),
                          blurRadius: 10,
                          spreadRadius: -5,
                          color: Color(0x40000000),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        backgroundColor: Color(0xFF00512D),
                      ),
                      child: Text("Get OTP", style: TextStyle(fontFamily: "LibreFranklin-Bold", fontSize: 15, fontWeight: FontWeight.w700),),
                      onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=> CarouselSliding())); },
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}