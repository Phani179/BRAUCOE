import 'package:flutter/material.dart';

class ProfileRecord extends StatelessWidget {
  const ProfileRecord({required this.title, required this.data,super.key});

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [TextSpan(
        text: title,
        style: const TextStyle(
          fontFamily: "LibreFranklin-SemiBold",
          fontSize: 14,
          color: Color(0xFF382E1E),
          decoration: TextDecoration.none,
        ),
      ),
      TextSpan(
        text: data,
        style: const TextStyle(
          fontFamily: "LibreFranklin-Regular",
          fontSize: 14,
          color: Color(0xFF382E1E),
          decoration: TextDecoration.none,
        ),
      ),
    ]));
  }
}
