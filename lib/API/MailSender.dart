import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:untitled/Screens/MessageTextField.dart';
import 'package:untitled/Screens/SubjectTextField.dart';

class MailSender
{
  final Email email = Email(
    subject: "${SubjectTextField.textController.text}",
    body: "${2081951044} \n ${MessageTextField.textController.text}",
    recipients: ["phanireddi7989@gmail.com"]
  );

  Future sendMail() async
  {
    await FlutterEmailSender.send(email);
    print("Sent");
  }
}