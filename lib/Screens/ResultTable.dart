import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/API/ResultAPI.dart';

class ResultTable extends StatefulWidget {
  const ResultTable({super.key});

  @override
  State<ResultTable> createState() => _ResultTable();
}

class _ResultTable extends State<ResultTable> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body:
      SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  child: const Icon(Icons.arrow_back_sharp),
                  onTap: ()
                  {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              height: screenHeight * 0.04,
              width: screenWidth * 0.95,
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(width: 2,color: Colors.black), left : BorderSide(width : 1.5, color: Colors.black), right: BorderSide(width : 1.5, color: Colors.black), bottom: BorderSide(width : 1.5, color: Colors.black)),
                color: Color(0x4DCF9F69),
              ),
              child: const Center(child: Text("Aggregate Details", style: TextStyle(decoration: TextDecoration.underline,fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w600, fontSize: 17),)),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(screenWidth * 0.025, 0, screenWidth * 0.025, 0),
              child: Table(
                border: const TableBorder(left: BorderSide(width: 1.5, color: Colors.black),
                    right: BorderSide(width: 1.5, color: Colors.black),
                    verticalInside: BorderSide(width: 1.5, color: Colors.black)),
                columnWidths: const {0 : FlexColumnWidth(60),
                  1 : FlexColumnWidth(150),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Text("Roll Number", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w400, fontSize: 15)),
                          )
                      ),
                     TableCell(
                         child: Padding(
                           padding: const EdgeInsets.all(7.0),
                           child: Text("${ResultAPI.student[0].getStudentId()}", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w400, fontSize: 15),),
                         )
                     ),
                    ]
                  ),
                  TableRow(
                      children: [
                        const TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(7.0),
                              child: Text("Name", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w400, fontSize: 15)),
                            ),
                        ),
                        TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text("${ResultAPI.student[0].getStudentName()}", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w400, fontSize: 15)),
                            ),
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        const TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(7.0),
                              child: Text("Branch", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w400, fontSize: 15)),
                            ),
                        ),
                        TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text("${ResultAPI.student[0].getBranch()}", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w400, fontSize: 15)),
                            )
                        ),
                      ]
                  ),
                ],
              ),
            ),

            Container(
             height: screenHeight * 0.04,
             width: screenWidth * 0.95,
             decoration: const BoxDecoration(
               border: Border(top: BorderSide(width: 2,color: Colors.black), left : BorderSide(width : 1.5, color: Colors.black), right: BorderSide(width : 1.5, color: Colors.black), bottom: BorderSide(width : 1.5, color: Colors.black)),
               color: Color(0x4DCF9F69),
             ),
             child: const Center(child: Text("Mark Details", style: TextStyle(decoration: TextDecoration.underline,fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w600, fontSize: 17),)),
           ),
            Padding(
              padding: EdgeInsets.fromLTRB(screenWidth * 0.025, 0, screenWidth * 0.025, 0),
              child: Table(
                border: const TableBorder(left: BorderSide(width: 1.5, color: Colors.black),
                    right: BorderSide(width: 1.5, color: Colors.black),
                    bottom: BorderSide(width: 1.5, color: Colors.black),
                    verticalInside: BorderSide(width: 1.5, color: Colors.black)),
                columnWidths: const {0 : FlexColumnWidth(300),
                               1 : FlexColumnWidth(100),
                  2 : FlexColumnWidth(100)
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  const TableRow(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 2)),
                    ),
                    children: [
                      TableCell(
                        verticalAlignment : TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text("Subject Name", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w600, fontSize: 15)),
                        ),
                      ),
                      TableCell(
                        verticalAlignment : TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text("Subject Code", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w600, fontSize: 15)),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text("GPA", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w600, fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                  ...List.generate(ResultAPI.result.length, (index) => TableRow(
                    children: [
                      TableCell(
                        verticalAlignment : TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text("${ResultAPI.result[index].getPapName()}", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w400, fontSize: 15)),
                          // child: Text("$index"),
                        ),
                      ),
                      TableCell(
                        verticalAlignment : TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(7.0),
                          // child: Text("$index"),
                          child: Text("${ResultAPI.result[index].getPapCode()}", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w400, fontSize: 15)),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(7.0),
                          // child: Text("$index"),
                          child: Text("${ResultAPI.result[index].getPapGPA()}", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w400, fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
