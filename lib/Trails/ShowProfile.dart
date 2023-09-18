import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/API/ImageAPI.dart';
import 'package:untitled/API/LoginAPI.dart';

class ShowProfile extends StatefulWidget {
  const ShowProfile({super.key});

  @override
  State<ShowProfile> createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  LoginAPI loginAPI = LoginAPI();
  @override
  Widget build(BuildContext context) {
    ImageAPI imageAPI = ImageAPI();
    return Row(
      children: [
        FutureBuilder(
            future: loginAPI.getStudent(2081951044),
            builder: (context, snapshot)
            {
              print("Builder called");
              return CircleAvatar(
                backgroundImage: LoginAPI.personalInfo?.passportSizePhoto != null ? MemoryImage(
                    base64Decode(LoginAPI.personalInfo?.passportSizePhoto)
                ) : null,
                backgroundColor: Colors.blue,
              );
            }
        ),
      ],
    );
  }
}
