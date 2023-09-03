import 'package:flutter/material.dart';
import 'package:untitled/APIIntro/FetchingUsers.dart';
import '../ModelClasses/User.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HttpCodeRefractored(),
    );
  }
}

class HttpCodeRefractored extends StatefulWidget
{
  @override
  State<HttpCodeRefractored> createState() => _HttpCodeRefractored();
}

class _HttpCodeRefractored extends State<HttpCodeRefractored>
{
  @override
  void initState()
  {
    super.initState();
    fetchUsers();
  }

  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body : ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index)
          {
            User user = users[index];
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(user.imageURL),
              ),
              title: Text(user.name.firstName),
              subtitle: Text(user.phone),
            );
          },
        ),

    );
  }

  Future<void> fetchUsers() async
  {
    final response = await FetchUsers.fetchUsers();
    setState(() {
      users = response;
    });
  }
}