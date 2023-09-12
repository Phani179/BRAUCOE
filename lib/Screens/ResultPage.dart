
import 'package:flutter/material.dart';
import 'package:untitled/Screens/ResultTable.dart';
import '../API/ResultAPI.dart';

class ResultPage extends StatefulWidget {
  String? semester;
  var reg_no;
  ResultPage(this.semester, var this.reg_no, {super.key});
  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
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
            return const AlertDialog(
              title : CircularProgressIndicator(),
            );
          }
          else if(snapshot.hasData)
            {
              return ResultTable();
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
