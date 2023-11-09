import 'package:flutter/material.dart';

class DropDownItems extends StatelessWidget {
  DropDownItems(this.item, {super.key});
  String item;

  @override
  Widget build(BuildContext context) {
    return DropdownMenuItem<String>(
      value: item,
      child: Text(
        item,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
