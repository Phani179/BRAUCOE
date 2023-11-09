import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shimmer/shimmer.dart';


class ResultPageLoading extends StatefulWidget {
  const ResultPageLoading({super.key});

  @override
  State<ResultPageLoading> createState() => _ResultPageLoading();
}

class _ResultPageLoading extends State<ResultPageLoading> {
  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body:
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 12,
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
                height: 50,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                          width: 90,
                        ),
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade50,
                        highlightColor: Colors.grey.shade500,
                        child: const Text("Semester Results",
                          style: TextStyle(fontFamily: "LibreFranklin-SemiBold", fontSize: 28),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                 Container(
                      height: screenHeight * 0.04,
                      width: screenWidth * 0.95,
                      decoration: const BoxDecoration(
                        border: Border(top: BorderSide(width: 2,color: Colors.black), left : BorderSide(width : 1.5, color: Colors.black), right: BorderSide(width : 1.5, color: Colors.black), bottom: BorderSide(width : 1.5, color: Colors.black)),
                      ),
                      child:  Shimmer.fromColors(
                        baseColor: Colors.grey.shade50,
                        highlightColor: Colors.grey.shade500,
                        child:  Center(child: Text("Aggregate Details", style: TextStyle(decoration: TextDecoration.underline,fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w600, fontSize: 17))),
                      ),
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
                              TableCell(
                                  child: Padding(
                                        padding: EdgeInsets.all(7.0),
                                        child: Shimmer.fromColors(
                                          baseColor: Colors.grey.shade50,
                                          highlightColor: Colors.grey.shade500,
                                          child: Text("Roll Number",  style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w400, fontSize: 15)),
                                      ),
                                    ),
                              ),
                              TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(7.0),
                                    child : Shimmer.fromColors(
                                      baseColor: Colors.grey.shade50,
                                      highlightColor: Colors.grey.shade400,
                                      child: Container(
                                      height: 20,
                                      color: Colors.white,
                                      ),
                                    ),
                                  )
                              ),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(
                                child:
                                Padding(
                                  padding: EdgeInsets.all(7.0),
                                  child: Shimmer.fromColors(
                                  baseColor: Colors.grey.shade50,
                                  highlightColor: Colors.grey.shade500,
                                  child: Text("Name", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w400, fontSize: 15)),
                                  ),
                                ),
                              ),
                              TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(7.0),
                                    child : Shimmer.fromColors(
                                      baseColor: Colors.grey.shade50,
                                      highlightColor: Colors.grey.shade400,
                                      child: Container(
                                        height: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                              ),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(7.0),
                                  child: Shimmer.fromColors(
                                  baseColor: Colors.grey.shade50,
                                  highlightColor: Colors.grey.shade500,
                                  child: Text("Branch", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w400, fontSize: 15)),
                                  ),
                                ),
                              ),
                              TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(7.0),
                                    child : Shimmer.fromColors(
                                      baseColor: Colors.grey.shade50,
                                      highlightColor: Colors.grey.shade400,
                                      child: Container(
                                        height: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                              ),
                            ],
                        ),
                        TableRow(
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(7.0),
                                  child: Shimmer.fromColors(
                                  baseColor: Colors.grey.shade50,
                                  highlightColor: Colors.grey.shade500,
                                    child: Text("SGPA", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w400, fontSize: 15)),
                                  ),
                                ),
                              ),
                              TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(7.0),
                                    child : Shimmer.fromColors(
                                      baseColor: Colors.grey.shade50,
                                      highlightColor: Colors.grey.shade400,
                                      child: Container(
                                        height: 20,
                                        color: Colors.white,
                                      ),
                                    ),
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
                    ),
                    child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade50,
                        highlightColor: Colors.grey.shade400,
                        child: Center(
                            child: Text("Mark Details", style: TextStyle(decoration: TextDecoration.underline,fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w600, fontSize: 17),))),
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
                        TableRow(
                          decoration: const BoxDecoration(
                            border: Border(bottom: BorderSide(width: 2)),
                          ),
                          children: [
                            TableCell(
                              verticalAlignment : TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.shade50,
                                  highlightColor: Colors.grey.shade400,
                                  child: const Text("Subject Name", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w600, fontSize: 15)),
                              ),
                              ),
                            ),
                            TableCell(
                              verticalAlignment : TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: EdgeInsets.all(7.0),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.shade50,
                                  highlightColor: Colors.grey.shade400,
                                  child: const Text("Grade", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w600, fontSize: 15)),
                              ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(7.0),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.shade50,
                                  highlightColor: Colors.grey.shade400,
                                  child: Text("GPA", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w600, fontSize: 15)),
                              ),
                              ),
                            ),
                          ],
                        ),
                        ...List.generate(5, (index) => TableRow(
                          children: [
                            TableCell(
                              verticalAlignment : TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.shade50,
                                  highlightColor: Colors.grey.shade400,
                                  child: Container(
                                  height: 20,
                                  color: Colors.white,
                                ),//
                                ),// child: Text("$index"),
                              ),
                            ),
                            TableCell(
                              verticalAlignment : TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                // child: Text("$index"),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.shade50,
                                  highlightColor: Colors.grey.shade400,
                                  child: Container(
                                  height: 20,
                                  color: Colors.white,
                                ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                // child: Text("$index"),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.shade50,
                                  highlightColor: Colors.grey.shade400,
                                  child: Container(
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                ),
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
            ],
          ),
        ),
      ),
    );
  }
}
