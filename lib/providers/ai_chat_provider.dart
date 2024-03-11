
import 'package:braucoe/data/apis/login_api.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gemini/flutter_gemini.dart';

class AIChatProvider extends ChangeNotifier
{
  List<Content> chat = [
    Content(
      parts: [
        Parts(text: 'Hi, I am ${LoginAPI.studentDetails!.student_name}'),
      ],
      role: 'user',
    ),
  ];

  void initializeChat()
  {
    chat = [
      Content(
        parts: [
          Parts(text: 'Hi, I am ${LoginAPI.studentDetails!.student_name}'),
        ],
        role: 'user',
      ),
    ];
    // notifyListeners();
  }

  void addMessage(Content content)
  {
    chat.add(content);
    notifyListeners();
  }

}