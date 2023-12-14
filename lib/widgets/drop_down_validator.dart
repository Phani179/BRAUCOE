import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:braucoe/widgets/subject_selection_page.dart';

import '../Screens/results/result_page_handler.dart';
import '../screens/login/student_login.dart';

class DropDownValidator extends StatefulWidget {
  DropDownValidator(
      { required this.buttonText, required this.selectedYear,
      required this.firebaseStoragePath, required this.fromResults, required this.prefs,
      super.key});

  String? firebaseStoragePath;
  String? selectedYear;
  String buttonText;
  bool fromResults;
  final SharedPreferences? prefs;

  @override
  State<DropDownValidator> createState() => _DropDownValidatorState();
}

class _DropDownValidatorState extends State<DropDownValidator> {
  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    print(widget.firebaseStoragePath);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            backgroundColor: const Color(0xFF00512D),
            fixedSize: Size(width * 0.7, height * 0.05),
          ),
          onPressed: () {
            if (widget.selectedYear != null) {
              print('${widget.firebaseStoragePath}/${widget.selectedYear}');
              Navigator.push(
                  context,
                  widget.fromResults ?  MaterialPageRoute(
                    builder: (context) => ResultPageHandler(
                      widget.selectedYear,
                      widget.prefs?.getInt(StudentLogin.studentId),
                    ),
                  ) : MaterialPageRoute(
                      builder: (context) => SubjectSelectionScreen(
                        titleText : widget.firebaseStoragePath!,
                        selectedYear: widget.selectedYear!,
                            firebaseStoragePath: '${widget.firebaseStoragePath}/${widget.selectedYear}',
                          ),),);
            } else {
              setState(() {
                isValid = false;
              });
            }
          },
          child: Text(
            widget.buttonText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          height: height * 0.09,
        ),
        if (!isValid)
          const Text(
            "Please select semester!",
            style: TextStyle(
              color: Color(0xFFCF0000),
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
      ],
    );
  }
}
