import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:braucoe/utilities/images.dart';
import 'package:braucoe/widgets/sem_selection_dropdown.dart';

class ResultHomeScreen extends StatefulWidget {

  static const String routeName = '/result-home-screen';
  const ResultHomeScreen({super.key});

  static String? selectedValue;

  @override
  State<ResultHomeScreen> createState() => _ResultHomeScreenState();
}

class _ResultHomeScreenState extends State<ResultHomeScreen> {
  late SharedPreferences prefs;

  Future initializeSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // TODO: implement initState
    initializeSharedPref();
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
      body: SafeArea(
        child: FutureBuilder(
          future: initializeSharedPref(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(
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
                          size: 30,
                        )),
                    Image.asset(Images.resultsPageImage),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Results",
                        style: TextStyle(
                            fontFamily: "LibreFranklin-Regular",
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Check your semester wise results by selecting below.",
                        maxLines: 2,
                        style: TextStyle(
                            fontFamily: "LibreFranklin-Regular",
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "Semester",
                        style: TextStyle(
                          fontFamily: "LibreFranklin-Regular",
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      SemSelectionDropDown(
                        buttonText: 'Get Results',
                        parentPath: null,
                        fromResults: true,
                        prefs: prefs,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
