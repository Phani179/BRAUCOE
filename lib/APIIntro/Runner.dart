// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:untitled/APIIntro/DataTableCreation.dart';
// import 'package:untitled/API/ResultAPI.dart';
//
// import '../API/TableCreation.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Flutter Demo',
//       home: Button(),
//     );
//   }
// }
//
// class Button extends StatefulWidget {
//   const Button({super.key});
//
//   @override
//   State<Button> createState() => _ButtonState();
// }
//
// class _ButtonState extends State<Button> {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: ElevatedButton(
//           onPressed: (){
//             setState(() {
//               ResultAPI resultsAPI = ResultAPI();
//               resultsAPI.getResult(2081951044);
//             });
//             Future.delayed(Duration(seconds: 3), () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => TableCreation()));
//             });
//           },
//           child: Text("Get Results"),
//       ),
//     );
//   }
// }
