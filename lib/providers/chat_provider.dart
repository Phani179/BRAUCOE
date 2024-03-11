
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier
{
  bool isTextType = false;

  void changeTextTypeState(bool value)
  {
    isTextType = value;
    notifyListeners();
  }
}