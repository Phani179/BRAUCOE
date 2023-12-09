import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/widgets/drop_down_validator.dart';
import 'package:untitled/utilities/semester.dart';

class SemSelectionDropDown extends StatefulWidget {
  const SemSelectionDropDown(
      {required this.buttonText, required this.parentPath, required this.fromResults, required this.prefs, super.key});

  final String buttonText;
  final String? parentPath;
  final bool fromResults;
  final SharedPreferences? prefs;

  @override
  State<SemSelectionDropDown> createState() => _SemSelectionDropDownState();
}

class _SemSelectionDropDownState extends State<SemSelectionDropDown> {
  // int year = 0;
  String year = '';
  String? selectedYear;

  get firbaseStoragePath => widget.parentPath;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: width * 0.85,
          margin: const EdgeInsets.only(left: 25, top: 20, right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(2, 4),
              ),
            ],
          ),
          child: DropdownButtonFormField(
            borderRadius: BorderRadius.circular(20),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(left: 10),
              fillColor: Color(0xFFEFE1D0),
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
            dropdownColor: const Color(0xFFEFE1D0),
            hint: const Text(
              'Select Semester',
              style: TextStyle(
                color: Color(0xFF382E1E),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            // value: year == 0 ? null : 'Semester - $year',
            value: year.isEmpty ? null : year,
            onChanged: (value) {
              if (value == null) {
                print("Null Value");
                return;
              }
              selectedYear = value;
              print(firbaseStoragePath);
              print(selectedYear);
            },
            items: [
              ...SemesterSyllabus()
                  .semesters
                  .keys
                  .toList()
                  .map((i) => DropdownMenuItem(
                        value: i,
                        onTap: () {
                          setState(() {
                            year = i;
                          });
                        },
                        child: Text(
                          SemesterSyllabus().formattedSemesterName(i),
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline),
                        ),
                      ))
            ],
          ),
        ),
        SizedBox(
          height: height * 0.1,
        ),
        DropDownValidator(
          buttonText: widget.buttonText,
          selectedYear: selectedYear,
          firebaseStoragePath: firbaseStoragePath,
          fromResults: widget.fromResults,
          prefs: widget.prefs,
        ),
      ],
    );
  }
}
