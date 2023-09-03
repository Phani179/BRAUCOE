import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/API/ResultAPI.dart';

import 'Result.dart';

class DataTableCreation extends StatefulWidget {
  const DataTableCreation({super.key});

  @override
  State<DataTableCreation> createState() => _DataTableCreationState();
}

class _DataTableCreationState extends State<DataTableCreation> {

  ResultAPI resultAPI = ResultAPI();

  @override
  Widget build(BuildContext context) {
    return Material(
      child:
        DataTable(
           decoration: BoxDecoration(
             border: Border.all(color: Colors.black),
             color: Colors.amberAccent,
           ),
          columns: const [
            DataColumn(
              label: Padding(
                padding: EdgeInsets.all(10),
                child: Text("Subject"),
              ),
            ),
            DataColumn(
                label: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("GPA"),
                ),
            ),
          ],
        rows :
        ResultAPI.result.map(
              (element) => DataRow(
              cells: [
                DataCell(
                  Text("${element.getSubject()}"),
                ),
                DataCell(
                  Text("${element.getGPA()}"),
                ),
              ]
          ),
        ).toList(),
          // const [
            // DataRow(
            //   color: MaterialStatePropertyAll(Colors.cyan),
            //     cells: [
            //       DataCell(
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text(),
            //         ),
            //       ),
            //       DataCell(
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text(""),
            //         ),
            //       ),
            //     ]
            // ),
        // ],
      ),
    );
  }
}
