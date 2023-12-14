import 'package:flutter/material.dart';
import 'package:braucoe/screens/help/mail_sending_page.dart';
import 'message_textfield.dart';
import 'subject_textfield.dart';

class HelpScreen extends StatefulWidget {
  static const String routeName = '/help-screen';
  @override
  _HelpScreen createState() => _HelpScreen();
}

class _HelpScreen extends State<HelpScreen> {
  TextEditingController subjectTextEditingController = TextEditingController();
  TextEditingController messageTextEditingController = TextEditingController();
  bool isDataEmpty = false;
  @override
  Widget build(BuildContext context) {
    print(isDataEmpty);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF382E1E),
                      ),
                    ),
                    Image.asset("assets/images/HelpPageImage.png"),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "How can",
                        style: TextStyle(
                            fontFamily: "LibreFranklin-Regular",
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF382E1E)),
                      ),
                      const Text(
                        "we help you?",
                        style: TextStyle(
                            fontFamily: "LibreFranklin-Regular",
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF382E1E)),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        "Write your query. We will come up with a solution",
                        style: TextStyle(
                            fontFamily: "LibreFranklin-Regular",
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF382E1E)),
                      ),
                      const Text(
                        "to you as soon as possible.",
                        style: TextStyle(
                            fontFamily: "LibreFranklin-Regular",
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF382E1E)),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Row(
                        children: [
                          Text(
                            "Subject",
                            style: TextStyle(
                                fontFamily: "LibreFranklin-Regular",
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "( Min 5 char & max 100 char)",
                            style: TextStyle(
                                fontFamily: "LibreFranklin-Regular",
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      SubjectTextField(
                        textController: subjectTextEditingController,
                        hintText: 'Enter subject',
                        maxLines: 1,
                        inputType: TextInputType.text,
                        filteringTextInputFromatter: null,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Row(
                        children: [
                          Text(
                            "Message",
                            style: TextStyle(
                                fontFamily: "LibreFranklin-Regular",
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "( Min 10 char & max 1000 char)",
                            style: TextStyle(
                                fontFamily: "LibreFranklin-Regular",
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      MessageTextField(
                        textController: messageTextEditingController,
                        hintText: 'Enter Message',
                        maxLines: 5,
                        inputType: TextInputType.text,
                        filteringTextInputFromatter: null,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
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
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                backgroundColor: const Color(0xFF00512D),
                              ),
                              child: const Text("Submit"),
                              onPressed: () {
                                String subject =
                                    subjectTextEditingController.text;
                                String message =
                                    messageTextEditingController.text;
                                if(subject.isEmpty || message.isEmpty)
                                  {
                                    setState(() {
                                      isDataEmpty = true;
                                    });
                                  }
                                else
                                  {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return MailSendingPage(
                                            subject, message);
                                      },
                                    );
                                  }
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      if(isDataEmpty)
                        const Center(child: Text('Please enter query details.', style: TextStyle(
                          fontFamily: 'LibreFranklin-Regular',
                          //  fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                          fontSize: 17,
                        ),)),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
