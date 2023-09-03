import 'package:flutter/material.dart';

class TextFieldColorChange extends StatefulWidget
{
  Color filledColor = Color(0xFFCF9F69);
  Color focusedColor = Colors.white;

  @override
  State<TextFieldColorChange> createState() => _TextFieldColorChange();
}

class _TextFieldColorChange extends State<TextFieldColorChange>
{
  late FocusNode focusNode;
  final ValueNotifier<bool> _myFocusNotifier = ValueNotifier(false);
  void initState()
  {
    focusNode = FocusNode();
    focusNode.addListener(_onFocusChange);
  }

  void dispose()
  {
    focusNode.removeListener(_onFocusChange);
    focusNode.dispose();
    _myFocusNotifier.dispose();
  }

  void _onFocusChange()
  {
    _myFocusNotifier.value = focusNode.hasFocus;
  }

  @override
  Widget build(BuildContext context)
  {
    return ValueListenableBuilder(
        valueListenable: _myFocusNotifier,  // false
        builder: (_, isFocus, child) {
          return TextField(
            focusNode: focusNode,
            decoration: InputDecoration(
              filled: true,
              fillColor: isFocus? widget.focusedColor : widget.filledColor,
            ),
          );
        },
    );
  }
}