import 'package:flutter/material.dart';



class XYZ extends StatelessWidget{

  Widget build(BuildContext context){
    return Scaffold(
      body:Stack(
        children:[
          const Positioned(
              left:30,
              top:315,
              height:44,
              width: 150,
              child: Text('LOGIN',style:TextStyle(fontSize:35,
                  fontFamily:'LibreFranklin-SemiBold' ,
                  //  fontStyle: FontStyle.normal,
                  fontWeight:FontWeight.w600,
                  color:Color(0XFF382E1E)))),
          const Positioned(
              left:30,
              top:360,
              height: 20,
              width: 200,
              child: Text('Please sign in to continue',
                  style:TextStyle(fontFamily: 'LibreFranklin-Medium',
                      //  fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color:Color(0xFF382E1E),
                      fontSize: 15)
              )),
          Positioned(
            top:625,
            right: 30,
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
                  onPressed: (){},
                  child:const Text('LOGIN',
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
        ],
      ),
    );
  }
}