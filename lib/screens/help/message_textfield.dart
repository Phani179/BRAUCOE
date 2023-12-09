import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessageTextField extends StatefulWidget
{
  final Color fillColor = Color(0x4DCF9F69);
  final Color focusedColor = Colors.white;
  TextEditingController textController;
  String hintText;
  TextInputType inputType;
  int maxLines;
  List<TextInputFormatter>? filteringTextInputFromatter;

  MessageTextField({super.key,  required this.textController, required this.hintText, required this.maxLines, required this.inputType, required this.filteringTextInputFromatter});

  @override
  State<MessageTextField> createState() => _MessageTextField();
}

class _MessageTextField extends State<MessageTextField>
{
  final ValueNotifier<bool> _myFocusNotifier = ValueNotifier(false);
  late FocusNode focusNode;
  var formKey = GlobalKey<FormState>();

  @override
  void initState()
  {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(focusChange);
  }

  void dispose()
  {
    focusNode.removeListener(focusChange);
    focusNode.dispose();
    _myFocusNotifier.dispose();
    super.dispose();
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
          key: formKey,
          controller: widget.textController,
          validator: (value){
            if(value == null || value.isEmpty)
              {
                return "Field can't be null";
              }
            else if(value.length < 10)
              {
                return "Enter min 10 char!";
              }
            else
              {
                return null;
              }
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          focusNode : focusNode,
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