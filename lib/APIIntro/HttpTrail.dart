import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  HttpTrail(),
    );
  }
}

class HttpTrail extends StatefulWidget
{
  @override
  State<HttpTrail> createState() => _HttpTrail();
}

class _HttpTrail extends State<HttpTrail>
{
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : ListView.builder(
        itemCount: users.length,
          itemBuilder: (context, index)
              {
                final user = users[index];
                final name = user['name']['first'];
                final email = user['email'];
                final imageUrl = user['picture']['thumbnail'];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(imageUrl),
                  ),
                  title: Text(name),
                  subtitle: Text(email),
                );
              }
      ),
      floatingActionButton : FloatingActionButton(
        onPressed: fetchUsers,
      ),
    );
  }

  void fetchUsers()
  async {
    print("Fetch Users Called");
    const url = "https://randomuser.me/api/?results=2";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json["results"];
    });
    print("Users Fetched Successfully");
  }
}