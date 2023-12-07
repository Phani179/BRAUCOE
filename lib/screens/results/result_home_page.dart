import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/providers/login_api.dart';
import 'package:untitled/Screens/results/result_page.dart';
import 'package:untitled/screens/login/student_login.dart';

class ResultHomePage extends StatefulWidget {
  const ResultHomePage({super.key});

  static String? selectedValue;

  @override
  State<ResultHomePage> createState() => _ResultHomePageState();
}

class _ResultHomePageState extends State<ResultHomePage> {
  late SharedPreferences prefs;

  Future initializeSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  final List<String> items = [
    'Semester - 1',
    'Semester - 2',
    'Semester - 3',
    'Semester - 4',
    'Semester - 5',
    'Semester - 6',
    'Semester - 7',
    'Semester - 8',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: initializeSharedPref(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return SafeArea(
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  child: Image.asset("assets/images/ResultPageImage.png"),
                ),
                Positioned(
                  top: 18,
                  left: 12,
                  child: GestureDetector(
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const Positioned(
                  top: 230,
                  left: 30,
                  child: Text(
                    "Results",
                    style: TextStyle(
                        fontFamily: "LibreFranklin-Regular",
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const Positioned(
                  top: 280,
                  left: 30,
                  right: 30,
                  child: AutoSizeText(
                    "Check your semester wise results by selecting below.",
                    minFontSize: 15,
                    maxLines: 2,
                    style: TextStyle(
                        fontFamily: "LibreFranklin-Regular",
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const Positioned(
                  top: 350,
                  left: 30,
                  child: Text(
                    "Semester",
                    style: TextStyle(
                      fontFamily: "LibreFranklin-Regular",
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
                Positioned(
                  top: 380,
                  left: 30,
                  right: 30,
                  child: DropdownButton2(
                    hint: const Text(
                      'Select Semester',
                      style: TextStyle(
                        fontFamily: "LibreFranklin-Regular",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    items: items
                        .map((String item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                        ),
                      ),
                    ))
                        .toList(),
                    value: ResultHomePage.selectedValue,
                    onChanged: (String? value) {
                      setState(() {
                        ResultHomePage.selectedValue = value;
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: 50,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Color(0xFFEFE1D0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 700,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Color(0xFFEFE1D0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
                  ),
                ),
                Positioned(
                  left: 80,
                  right: 80,
                  top: 550,
                  child: Container(
                    height: 47,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x33000000),
                          offset: Offset(4, 6),
                          blurRadius: 4,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        backgroundColor: Color(0xFF00512D),
                      ),
                      onPressed: () {
                        print(ResultHomePage.selectedValue);
                        print(LoginAPI.studentDetails?.studentId);
                        Navigator.push(
                          context,
                          // LoginAPI.studentDetails?.studentId
                          MaterialPageRoute(
                            builder: (context) => ResultPageHandler(
                              ResultHomePage.selectedValue,
                              prefs.getInt(StudentLogin.studentId),
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        "Get Results",
                        style: TextStyle(
                          fontFamily: "LibreFranklin-Regular",
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
