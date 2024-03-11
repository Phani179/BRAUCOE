import 'package:flutter/material.dart';

class SubjectCheckBox extends StatefulWidget {
  SubjectCheckBox({required this.subject,super.key});

  Map<String, Object> subject;

  @override
  State<SubjectCheckBox> createState() => _SubjectCheckBoxState();
}

class _SubjectCheckBoxState extends State<SubjectCheckBox> {

  _isCheckedSyllabus(value)
  {
    setState(() {
      widget.subject['isChecked'] = value!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 7,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: widget.subject['isChecked'] as bool ? Color(0xFFC5DAD1) : Colors.white,
      ),
      child: CheckboxListTile(
        side: const BorderSide(
          width: 2,
          color: Color(0xFFCF9F69),
        ),
        checkboxShape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Color(0xFFCF9F69),
          ),
          borderRadius: BorderRadius.circular(3),
        ),
        activeColor: Color(0xFF00512D),
        value: widget.subject['isChecked'] as bool,
        onChanged: _isCheckedSyllabus,
      ),
    );
  }
}
