import 'package:flutter/material.dart';

class PasswordWidget extends StatefulWidget
{
  String hintText;
  PasswordWidget({required this.hintText,super.key});

  @override
  State<PasswordWidget> createState() => _PasswordWidget();
}

class _PasswordWidget extends State<PasswordWidget>
{
  bool _obescureText = true;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
      Positioned(
            top: 200,
              width: 350,
                left: 20,
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 5,
                  child: PasswordField(),
                  ),
              ),
      ],
    );
  }

  Widget PasswordField()
  {
    return TextField(
      obscureText: _obescureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontFamily: "LibreFranklin-Regular",
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0x4DCF9F69)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width : 1.5, color: Color(0xFFCF9F69)),
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: Color(0x4DCF9F69),
        focusColor: Colors.black,
        filled: true,
        suffixIcon: IconButton(
          color: Color(0xCC382E1E),
          onPressed: (){
            setState(() =>
            _obescureText = !_obescureText
            );
          },
          icon : Icon(_obescureText ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }
}