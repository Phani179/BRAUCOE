import 'package:flutter/material.dart';
import 'package:untitled/Screens/LoginModule/Screen2.dart';

class LogoPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Ellipse6
        Positioned(
          left : 33,
          top : 60,
          child : Image.asset('assets/images/HomePageLogoBG1.png'),
        ),
        // Ellipse7
        Positioned(
          left : 75,
          top : 100,
          child: Image.asset('assets/images/HomePageLogoBG2.png'),
        ),

        // BRAU LOGO
        Positioned(
          left: 108,  //110
          top: 130,   //130
          child: Center(child: Image.asset('assets/images/HomePageLogo.png')),
        ),
        // Text
        const Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>
            [
              SizedBox(height:230),    // 230
              Center(
                child: Text('All you need is',
                    style:TextStyle(
                      fontFamily:'LibreFranklin-SemiBold',
                      fontSize:35,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              Text('at one place ',
                  style:TextStyle(
                    fontFamily:'LibreFranklin-SemiBold',
                    fontSize:35,
                    fontWeight: FontWeight.w600,)),
              SizedBox(
                height: 45,
              ),
              SelectionContainer.disabled(
                child: Text('Complete your task like drinking water,',
                  style:TextStyle(
                    fontFamily:'LibreFranklin-Light',
                    fontSize:15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Text('no obstacle just flow into body.',
                style:TextStyle(
                  fontFamily:'LibreFranklin-Light',
                  fontSize:15,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 44,
              ),
            ],
          ),
        ),

        // Button
        Positioned(
          top: 620,       // 635
          height: 59,
          left: 20,
          right: 20,
          child:
          SizedBox(
            child: Container(
              decoration:  BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33000000),
                      offset: Offset(4, 6),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ]
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  backgroundColor: const Color(0xFF00512D),   // #00512D
                  // padding: const EdgeInsets.fromLTRB(76, 18, 76, 17),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2()));
                },  // Next Page Navigation
                child : const Text(
                  "Get started",
                  style: TextStyle(
                      fontFamily: "LibreFranklin-Regular",
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}