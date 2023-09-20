import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NormalTextFields extends StatefulWidget
{
  final Color fillColor = Color(0x4DCF9F69);
  final Color focusedColor = Colors.white;
  static var textController = TextEditingController();
  String hintText;
  IconData? prefixIcon;
  TextInputType inputType;
  List<TextInputFormatter>? filteringTextInputFromatter;

  NormalTextFields({required this.hintText, required this.prefixIcon, required this.inputType, this.filteringTextInputFromatter});

  @override
  State<NormalTextFields> createState() => _TextFields();
}

class _TextFields extends State<NormalTextFields>
{
  final ValueNotifier<bool> _myFocusNotifier = ValueNotifier(false);
  late FocusNode focusNode;

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
           return TextField(
               controller: NormalTextFields.textController,
               focusNode : focusNode,
               obscureText: false,
               cursorColor: Color(0x382E1E),
               cursorWidth: 1.5,
               cursorHeight: 19,
               inputFormatters: widget.filteringTextInputFromatter,
               decoration: InputDecoration(
                 prefixIcon: Icon(
                   widget.prefixIcon,
                   color: Color(0xCC382E1E),
                 ),
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
                 filled: true,
                 fillColor: isFocus ? widget.focusedColor : widget.fillColor,
               ),
               keyboardType: widget.inputType,
           );
        },
    );
  }
}