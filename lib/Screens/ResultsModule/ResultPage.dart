
import 'package:flutter/material.dart';
import 'package:untitled/Screens/ResultsModule/ResultTable.dart';
import 'package:untitled/Screens/ShimmerEffectModule/ResultPageLoding.dart';
import '../../API/ResultAPI.dart';

class ResultPageHandler extends StatefulWidget {
  String? semester;
  var reg_no;
  ResultPageHandler(this.semester, var this.reg_no, {super.key});
  @override
  State<ResultPageHandler> createState() => _ResultPageHandler();
}

class _ResultPageHandler extends State<ResultPageHandler> {
ResultAPI resultsAPI = ResultAPI();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder(
        future: resultsAPI.getResult(widget.semester, widget.reg_no),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
        {
          if(snapshot.connectionState == ConnectionState.waiting)
          {
            return ResultPageLoading();
          }
          else if(snapshot.hasData)
          {
            return const ResultTable();
          }
          else
            {
              return AlertDialog(
                title : Text("${snapshot.connectionState}"),
              );
            }
        },
      ),
    );
  }
}
