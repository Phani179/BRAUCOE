import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget
{
  final Color? fillColor = const Color(0x4DCF9F69);
  final Color? focusedColor = Colors.white;
  static var passwordController = TextEditingController();
  static String? hintText;

  PasswordTextField(String hintText, {super.key})
  {
    PasswordTextField.hintText = hintText;
  }

  @override
  State<PasswordTextField> createState() => _PasswordTextField();
}

class _PasswordTextField extends State<PasswordTextField>
{
  final ValueNotifier<bool> _myFocusNotifier = ValueNotifier(false);
  late FocusNode focusNode;
  bool _isObscure = true;
  @override
  void initState()
  {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(_focusChange);
  }

  void _focusChange()
  {
    _myFocusNotifier.value = focusNode.hasFocus;
  }

  @override
  void dispose()
  {
    super.dispose();
    focusNode.removeListener(_focusChange);
    focusNode.dispose();
    _myFocusNotifier.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
      return ValueListenableBuilder(
          valueListenable: _myFocusNotifier,
          builder: (_, isFocus, child) {
            return TextField(
                  controller: PasswordTextField.passwordController,
                  focusNode: focusNode,
                  obscureText: _isObscure,
                  cursorColor: Color(0xFF382E1E),
                  cursorHeight: 20,
                  cursorWidth: 1.25,
                  decoration: InputDecoration(
                    prefixIcon:
                      // const ImageIcon(
                      // //   AssetImage("assets/icons/icon.png"),
                      // color: Color(0xCC382E1E),
                      const Icon(
                        Icons.lock_outline,
                        color: Color(0xCC382E1E),
                    ),
                    hintText: PasswordTextField.hintText,
                    hintStyle: const TextStyle(
                      fontFamily: "LibreFranklin-Regular",
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF382E1E),
                    ),
                    filled: true,
                    fillColor: isFocus ? widget.focusedColor : widget.fillColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide : BorderSide(color: Color(0x4DCF9F69)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xFFCF9F69)),
                    ),
                    suffixIcon: IconButton(
                      icon : Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                        color: Color(0xCC382E1E),
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        }
                        );
                        },
                    ),
                  ),
            );
          }
          );
  }
}