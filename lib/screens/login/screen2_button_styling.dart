import 'package:flutter/material.dart';

class Screen2ButtonStyling extends StatelessWidget
{
  String text;
  void Function()? onPressed;
  Screen2ButtonStyling({super.key,
    required this.text,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
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
          fixedSize: Size(MediaQuery.of(context).size.width * 0.7, 60),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)),
          backgroundColor: const Color(0xFF00512D),
        ),
        onPressed: onPressed,
        child: Text(text , style: const TextStyle(
          fontFamily: "LibreFranklin-Regular",
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        )),
      ),
    );
  }
}