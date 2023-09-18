import 'package:flutter/material.dart';

class Screen2ImageStyling extends StatelessWidget
{
  double leftInPositioned;
  double rightInPositioned;
  double topInPositioned;
  double heightInSizedBox;
  double widthInSizedBox;
  String imageURL;
  Screen2ImageStyling(
  { required this.leftInPositioned,
    required this.rightInPositioned,
    required this.topInPositioned,
    required this.heightInSizedBox,
    required this.widthInSizedBox,
    required this.imageURL,
    super.key }
      );

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: leftInPositioned,
      right: rightInPositioned,
      top: topInPositioned,
      child: SizedBox(
        height: heightInSizedBox,
        width: widthInSizedBox,
        child : Image.asset(imageURL),
      ),
    );
  }

}