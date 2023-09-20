import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../API/LoginAPI.dart';
import '../Screens/LoginModule/NormalTextFields.dart';

class OtpPageRedirect extends StatelessWidget {
  OtpPageRedirect({super.key});
  LoginAPI loginApi = LoginAPI();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loginApi.getStudent(NormalTextFields.textController.text),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
      {
        print("Future Builder");
        if(snapshot.connectionState == ConnectionState.waiting)
        {
          print("Waiting");
          return const AlertDialog(
            title: CircularProgressIndicator(),
          );
        }
        else if(snapshot.hasData)
        {
          print("Data Stored");
          return const AlertDialog(
            title: Text('Completed'),
          );
        }
        else
        {
          print("Connection done");
          return AlertDialog(
            title: Text("Failed"),
          );
        }
      },
    );
  }
}
