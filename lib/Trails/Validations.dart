import 'package:flutter/material.dart';

class Validations extends StatefulWidget
{
  @override
  State<Validations> createState() => _Validations();
}

class _Validations extends State<Validations>
{
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return TextField(
      controller: passwordController,
      key: ValueKey('email'),
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
      enableSuggestions: false,
      decoration: InputDecoration(
        errorText: passwordValidation(passwordController.text),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  String passwordValidation(String password)
  {
    if(password.isEmpty || password == null)
      {
        return "Password must be filled";
      }
    if (password.length < 8) {
      return "Password must has 8 characters";
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return "Password must has uppercase";
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      return "Password must has digits";
    }
    if (!password.contains(RegExp(r'[a-z]'))) {
      return "Password must has lowercase";
    }
    if (!password.contains(RegExp(r'[#?!@$%^&*-]'))) {
      return "Password must has special characters";
    } else
      return "";
  }
  }
