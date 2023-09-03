import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => GetCall();

class GetCall extends StatefulWidget {
  const GetCall({Key? key}) : super(key: key);

  @override
  State<GetCall> createState() => _GetCallState();
}

List? userList = [];
Future<dynamic> getUser() async
{
  final url = "https://jsonplaceholder.typicode.com/posts";
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  final body = response.body;
  final json = jsonDecode(body);
  for(var i in json){
    userList?.add(i);
  }
  return userList;
}

List<dynamic>? users = [];
class _GetCallState extends State<GetCall> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    users = getUser() as List?;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: ListView.builder(
          itemCount: users?.length,
            itemBuilder: (context, index)
            {
              return ListTile(
                leading: Text("${index}"),
              );
            }
        ),
      ),
    );
  }
}

