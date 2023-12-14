import 'package:flutter/material.dart';
import 'package:braucoe/widgets/syllabus_previous_papers_template.dart';
import '../../utilities/images.dart';

class SyllabusPage extends StatelessWidget {

  const SyllabusPage({super.key});

  @override
  Widget build(BuildContext context) {
    String title = 'Syllabus';
    String subTitle = 'Download the Academic Syllabus from below. It gives the complete information about Subjects and the portions to be covered.';
    String imageData = Images.syllabusPageImage;
    String buttonText = 'Get Syllabus';
    return SyllabusPreviousPapersTemplate(image: imageData, title: title,subTitle: subTitle, buttonText: buttonText,);
  }
}
