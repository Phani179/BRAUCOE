import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/ModelClasses/UserName.dart';
import '../ModelClasses/User.dart';
import '../ModelClasses/User.dart';

class FetchUsers
{
  static Future<List<User>> fetchUsers() async
  {
    const url = "https://randomuser.me/api/?results=10";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final transformed = results.map(
            (e) {
              UserName name = UserName.fromMap(e['name']);
              return User(
            email: e['email'],
            phone: e['phone'],
            gender: e['gender'],
            nat: e['nat'],
            name: name,
            imageURL: e['picture']['thumbnail'],
          );
        }
    ).toList();
    return transformed;
  }
}