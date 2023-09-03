import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          height: 150,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 300,
                child: MyTextWidget (
                  onChanged: (s1) {
                    print(s1);
                  },
                ),
              ),
              SizedBox(
                width: 300,
                child: MyTextWidget(
                  onChanged: (s2) {
                    print(s2);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextWidget extends StatefulWidget {
  const MyTextWidget({
    super.key,
    this.onChanged,
    this.fillColor = Colors.green,
    this.focusColor = Colors.cyan,
  });
  final ValueChanged<String>? onChanged;
  final Color? fillColor;
  final Color? focusColor;

  @override
  State<MyTextWidget> createState() => _MyTextWidgetState();
}

class _MyTextWidgetState extends State<MyTextWidget> {
  late FocusNode _myFocusNode;
  final ValueNotifier<bool> _myFocusNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();

    _myFocusNode = FocusNode();
    _myFocusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _myFocusNode.removeListener(_onFocusChange);
    _myFocusNode.dispose();
    _myFocusNotifier.dispose();

    super.dispose();
  }

  void _onFocusChange() {
    _myFocusNotifier.value = _myFocusNode.hasFocus;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _myFocusNotifier,
      builder: (_, isFocus, child) {
        return TextField(
          focusNode: _myFocusNode,
          decoration: InputDecoration(
            filled: true,
            fillColor: isFocus ? widget.focusColor : widget.fillColor,
          ),
          onChanged: (value) => widget.onChanged,
        );
      },
    );
  }
}