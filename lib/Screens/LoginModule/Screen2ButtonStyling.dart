import 'package:flutter/material.dart';
import 'package:untitled/Screens/LoginModule/StudentLogin.dart';

class Screen2ButtonStyling extends StatelessWidget
{
  String text;
  double top;
  void Function()? onPressed;
  Screen2ButtonStyling({super.key,
    required this.top,
    required this.text,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: 50,
      right: 50,
      height: 60,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Color(0x33000000),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)),
            backgroundColor: Color(0xFF00512D),
          ),
          onPressed: onPressed,
          child: Text(text , style: const TextStyle(
            fontFamily: "LibreFranklin-Regular",
            fontWeight: FontWeight.w400,
            fontSize: 20,
          )),
        ),
      ),
    );
  }
}