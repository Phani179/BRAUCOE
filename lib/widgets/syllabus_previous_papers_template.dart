import 'package:flutter/material.dart';
import 'package:untitled/widgets/sem_selection_dropdown.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SyllabusPreviousPapersTemplate extends StatelessWidget {
  const SyllabusPreviousPapersTemplate({required this.image, required this.title,required this.subTitle, required this.buttonText, super.key});

  final String image;
  final String title;
  final String subTitle;
  final String buttonText;
  get parentPath => title == 'Syllabus' ? 'syllabus' : 'previous_papers';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_sharp,
                  ),
                ),
                SvgPicture.asset(image),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top : 30 ,left: 20),
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: "LibreFranklin-Regular",
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Text(
                subTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 25, right: 20, top: 50,),
              child: const Text(
                'Semester',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            SemSelectionDropDown(buttonText: buttonText,parentPath : parentPath),
          ],
        ),
      ),
    );
  }
}
