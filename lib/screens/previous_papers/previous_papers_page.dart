import 'package:flutter/material.dart';
import 'package:untitled/utilities/images.dart';
import 'package:untitled/widgets/syllabus_previous_papers_template.dart';

class PreviousPapersScreen extends StatelessWidget {
  const PreviousPapersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String image = Images.previousPapersScreenImage;
    String title = 'Previous Papers';
    String subTitle = 'Download semester wise previous papers by selecting below.';
    String buttonText = 'Next';
    return SyllabusPreviousPapersTemplate(
      image: image,
      title: title,
      subTitle: subTitle,
      buttonText: buttonText,
    );
  }
}
