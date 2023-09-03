import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordValidation extends StatefulWidget
{
  String hintText = "Password";
  PasswordValidation({super.key, required this.hintText});
  @override
  State<PasswordValidation> createState() {
   return _PasswordValidation();
  }
}

class _PasswordValidation extends State<PasswordValidation> {
  var formKey = GlobalKey<FormState>();
  ValueNotifier valueNotifier = ValueNotifier(false);
  late FocusNode focusNode;
  bool isObscure = true;
  dynamic? passwordController = TextEditingController();
  String? password;
  
  @override
  void initState() {
    focusNode = FocusNode();
    focusNode.addListener(() {valueNotifier.value = focusNode.hasFocus;});
  }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (_, isFocus, child)
        {
          return Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
                child : Column(
                  children : [
                    const SizedBox(
                      height: 200,
                    ),
                  TextFormField(
                    cursorColor: Color(0x382E1E),
                    cursorWidth: 1.5,
                    cursorHeight: 19,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: passwordController,
                      validator: (value){
                      if(value == null || value.isEmpty)
                      {
                        return "Password can't be Null";
                      }
                      else if(value.length < 6)
                      {
                        return "Password contains atleast 6 characters";
                      }
                      else if(RegExp(r'\s').hasMatch(value))
                      {
                        return "Spaces are not allowed";
                      }
                      else if(!RegExp(r'[a-z]+').hasMatch(value))
                      {
                        return "Password must contain one small character";
                      }
                      else if(!RegExp(r'[A-Z]+').hasMatch(value))
                      {
                          return "Password must contain one Capital Character";
                      }
                      else if(!RegExp(r'[0-9]+').hasMatch(value))
                      {
                        return "Password must contain one Number";
                      }
                      else if(!RegExp(r'[_@&$#%^*()]+').hasMatch(value))
                      {
                        return "Password must contain one Special Character";
                      }
                      else
                      {
                        return null;
                      }
                    },
                    obscureText: isObscure,
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Color(0xFFCF9F69)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Color(0xFFCF9F69)),
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
                      hintText: widget.hintText,
                      prefixIcon: const Icon(Icons.lock_outline, color: Colors.black,),
                      suffixIcon: IconButton(
                        icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility, color: Colors.black),
                        onPressed: (){
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: isFocus ? Colors.white : Color(0x4DCF9F69),
                    ),
                      onSaved: (value){ password = value;},
                  ),
                ],
            ),
          );
        }
    );
  }
}
