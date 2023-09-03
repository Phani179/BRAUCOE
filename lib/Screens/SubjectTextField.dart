import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SubjectTextField extends StatefulWidget
{
  final Color fillColor = Color(0x4DCF9F69);
  final Color focusedColor = Colors.white;
  static var textController = TextEditingController();
  String hintText;
  TextInputType inputType;
  int maxLines;
  List<TextInputFormatter>? filteringTextInputFromatter;

  SubjectTextField({required this.hintText, required this.maxLines, required this.inputType, required this.filteringTextInputFromatter});

  @override
  State<SubjectTextField> createState() => _SubjectTextField();
}

class _SubjectTextField extends State<SubjectTextField>
{
  final ValueNotifier<bool> _myFocusNotifier = ValueNotifier(false);
  late FocusNode focusNode;
  var formKey = GlobalKey<FormState>();
  void initState()
  {
    focusNode = FocusNode();
    focusNode.addListener(focusChange);
  }

  void dispose()
  {
    focusNode.removeListener(focusChange);
    focusNode.dispose();
    _myFocusNotifier.dispose();
  }

  void focusChange()
  {
    _myFocusNotifier.value = focusNode.hasFocus;
  }
  @override
  Widget build(BuildContext context)
  {
    return ValueListenableBuilder(
      valueListenable: _myFocusNotifier,
      builder: (_, isFocus, child)
      {
        return TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          controller: SubjectTextField.textController,
          focusNode : focusNode,
          validator: (value){
            if(value == null || value.isEmpty == true)
              {
                return "Field can't be null.";
              }
            else if(value.length < 5)
              {
                return "Enter min 5 char!";
              }
            else
              {
                return null;
              }
          },
          obscureText: false,
          cursorColor: Color(0x382E1E),
          cursorWidth: 1.5,
          cursorHeight: 19,
          maxLines: widget.maxLines,
          inputFormatters: widget.filteringTextInputFromatter,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              fontFamily: "LibreFranklin-Regular",
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color(0xFF382E1E),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0x4DCF9F69)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xFFCF9F69)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Color(0xFFCF9F69)),
            ),
            errorStyle: const TextStyle(
              fontFamily: "LibreFranklin-Regular",
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            fillColor: isFocus ? widget.focusedColor : widget.fillColor,
          ),
          keyboardType: widget.inputType,
        );
      },
    );
  }
}