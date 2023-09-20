import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/Screens/HelpModule/MailSendingPage.dart';
import 'MessageTextField.dart';
import 'SubjectTextField.dart';

class Help extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => _Help();
}

class _Help extends State<StatefulWidget>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    child: Image.asset("assets/images/HelpPageImage.png"),
                  ),
                  const Positioned(
                    left: 20,
                    top: 190,
                      child: Text("How can", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontSize: 30, fontWeight: FontWeight.w600, color: Color(0xFF382E1E)
                      ),)
                  ),
                  const Positioned(
                      left: 20,
                      top: 230,
                      child: Text("we help you?", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontSize: 30, fontWeight: FontWeight.w600, color: Color(0xFF382E1E)
                      ),)
                  ),
                  const Positioned(
                      left: 20,
                      right: 20,
                      top: 270,
                      child: Text("Write your query. We will come up with a solution", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontSize: 15, fontWeight: FontWeight.w500, color: Color(0xFF382E1E)
                      ),)
                  ),
                  const Positioned(
                      left: 20,
                      top: 290,
                      child: Text("to you as soon as possible.", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontSize: 15, fontWeight: FontWeight.w500, color: Color(0xFF382E1E)
                      ),),
                  ),
                  const Positioned(
                    left: 20,
                      top: 330,
                      child: Text("Subject", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontSize: 16, fontWeight: FontWeight.w600),),
                  ),
                  const Positioned(
                    left: 80,
                    top: 330,
                    child: Text("( Min 5 char & max 100 char)", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontSize: 14, fontWeight: FontWeight.w400),),
                  ),
                  Positioned(
                    top: 355,
                      left: 20,
                      right: 20,
                      child: SubjectTextField(hintText: 'Enter subject', maxLines: 1,inputType: TextInputType.text, filteringTextInputFromatter: null,),
                  ),
                  const Positioned(
                    left: 20,
                    top: 450,
                    child: Text("Message", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontSize: 16, fontWeight: FontWeight.w600),),
                  ),
                  const Positioned(
                    left: 90,
                    top: 450,
                    child: Text("( Min 10 char & max 1000 char)", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontSize: 14, fontWeight: FontWeight.w400),),
                  ),
                  Positioned(
                    top: 475,
                    left: 20,
                    right: 20,
                    child: MessageTextField(hintText: 'Enter Message', maxLines: 5,inputType: TextInputType.text, filteringTextInputFromatter: null,),
                  ),
                  Positioned(
                    top: 650,
                    right: 20,
                    child: Container(
                      height: 43,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x33000000),
                            offset: Offset(2, 4),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
                          backgroundColor: const Color(0xFF00512D),
                        ),
                        child: Text("Submit"),
                        onPressed: () {
                          String subject = SubjectTextField.textController.text;
                          String message = MessageTextField.textController.text;
                          SubjectTextField.textController.clear();
                          MessageTextField.textController.clear();
                          showDialog(
                              context: context,
                              builder: (context) {
                                return MailSendingPage(subject, message);
                              },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
          ),
        ),
      )
    );
  }
}