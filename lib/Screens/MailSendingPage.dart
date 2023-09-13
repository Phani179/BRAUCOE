import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Trails/ShimmerLoading.dart';

import '../API/LoginAPI.dart';
import '../API/MailAPI.dart';

class MailSendingPage extends StatelessWidget {
  MailSendingPage(this.subject, this.message, {super.key});
  String subject;
  String message;
  MailAPI mailAPI = MailAPI();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mailAPI.sendMail(
          LoginAPI.studentDetails?.studentId,
          subject,
          message
      ),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
      {
        if(snapshot.connectionState == ConnectionState.waiting)
        {
          return ShimmerLoading();
        }
        else if(snapshot.hasData)
        {
          return AlertDialog(
            content : Container(
                height: 80,
                child: Stack(
                  children: [
                    Positioned(
                      left: 95,
                      child: Image.asset("assets/images/Done.png"),
                    ),
                    const Positioned(
                      top: 60,
                      left: 18,
                      child: Text("Successfully submitted",
                        style: TextStyle(
                          fontFamily: "LibreFranklin-Regular",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                )
            ),
            actions: [
              Center(
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
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
            ],
          );
        }
        return AlertDialog(
          content: Text("Failed"),
        );
      },
    );
  }
}
