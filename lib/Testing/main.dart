import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> users = [];
@override
  void initState() {
    // TODO: implement initState
    getUser(2081951044);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: users.length,
            itemBuilder: (context, index)
                {
                  Student student = Student();
                  student.setReg_No(users[index]["reg_no"]);
                  student.setName(users[index]["name"]);
                  student.setPassword(users[index]["password"]);
                  return ListTile(
                    leading: Text("${student.password}"),
                    title: Text("${student.name}"),
                    subtitle: Text("${student.reg_no}"),
                  );
                }
        ),
    );
  }


  Future<void> getUser(var reg_no) async
  {
    final uri = Uri.parse("https://springbootdemo-production-70a9.up.railway.app/student/$reg_no");
    final response = await http.get(uri);
    final body = jsonDecode(response.body);
    users = body;
  }
}
