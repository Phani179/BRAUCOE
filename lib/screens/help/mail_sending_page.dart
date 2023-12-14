import 'package:flutter/material.dart';
import 'package:braucoe/screens/help/help.dart';
import 'package:braucoe/screens/login/student_login.dart';
import 'package:braucoe/widgets/shimmer_effect/mail_and_reset_pwd_shimmer_loading.dart';

import '../../providers/login_provider.dart';
import '../../providers/mail_provider.dart';

class MailSendingPage extends StatelessWidget {
  MailSendingPage(this.subject, this.message, {super.key});

  String subject;
  String message;
  MailAPI mailAPI = MailAPI();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mailAPI.sendMail(
          LoginAPI.studentDetails?.studentId, subject, message),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MailandResetPwdShimmerLoading();
        } else if (snapshot.hasData) {
          return AlertDialog(
            content: SizedBox(
              height: 65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/Done.png"),
                  const Text(
                    "Successfully submitted",
                    style: TextStyle(
                      fontFamily: "LibreFranklin-Regular",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: const Color(0xFFCF9F69), // #00512D
                    // padding: const EdgeInsets.fromLTRB(76, 18, 76, 17),
                  ),
                  child: const Text(
                    "OK",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Librefranklin-Regular",
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        }
        return const AlertDialog(
          content: Text("Failed"),
        );
      },
    );
  }
}
