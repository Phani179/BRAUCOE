import 'package:flutter/material.dart';
import 'package:untitled/screens/results/result_table.dart';
import 'package:untitled/widgets/shimmer_effect/result_page_loding.dart';
import '../../providers/result_api.dart';

class ResultPageHandler extends StatefulWidget {
  String? semester;
  int? reg_no;
  static const String routeName = '/result-page-handler';
  
  ResultPageHandler(this.semester, var this.reg_no, {super.key});

  @override
  State<ResultPageHandler> createState() => _ResultPageHandler();
}

class _ResultPageHandler extends State<ResultPageHandler> {
  Map<String, String> years = {
    'semester_1': 'Semester - 1',
    'semester_2': 'Semester - 2',
    'semester_3': 'Semester - 3',
    'semester_4': 'Semester - 4',
    'semester_5': 'Semester - 5',
    'semester_6': 'Semester - 6',
    'semester_7': 'Semester - 7',
    'semester_8': 'Semester - 8',
  };

  ResultAPI resultsAPI = ResultAPI();

  @override
  Widget build(BuildContext context) {
    print('ID : ${widget.reg_no}');
    return Material(
      child: FutureBuilder(
        future: resultsAPI.getResult(widget.semester, widget.reg_no),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          print(years[widget.semester]!);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ResultPageLoading();
          }
          else if(snapshot.hasData) {
            return ResultTable(year: years[widget.semester]!,);
          }
          else {
            return AlertDialog(
              title: const Text(
                "Results not yet uploaded.", style: TextStyle(),),
              actions: [
                ElevatedButton(onPressed: () {
                  Navigator.pop(context);
                }, child: const Text('Ok')),
              ],
            );
          }
        },
      ),
    );
  }
}
