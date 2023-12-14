import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:braucoe/widgets/subject_check_box.dart';
import 'package:braucoe/services/firebase_storage_services.dart';
import 'package:braucoe/utilities/images.dart';
import 'package:braucoe/utilities/local_file_saver.dart';
import 'package:braucoe/utilities/semester.dart';

class SubjectSelectionScreen extends StatefulWidget {
  SubjectSelectionScreen(
      {
        required this.titleText,
        required this.selectedYear,
      required this.firebaseStoragePath,
      super.key});

  String titleText;
  String selectedYear;
  String firebaseStoragePath;

  @override
  State<SubjectSelectionScreen> createState() => _SubjectSelectionScreenState();
}

class _SubjectSelectionScreenState extends State<SubjectSelectionScreen> {
  final SemesterSyllabus semesterSyllabus = SemesterSyllabus();

  bool isValid = true;

  void _showSnackBar() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('File(s) downloaded'),
        action: SnackBarAction(label: 'OK', onPressed: (){
          ScaffoldMessenger.of(context).clearSnackBars();
        }),
        duration: Duration(milliseconds: 2000),
      ),
    );
  }

  void _downloadFiles() async
  {
    var updatedList = semesterSyllabus.semesters[widget.selectedYear]
        ?.where((subject) {
      return subject['isChecked'] as bool == true;
    }).toList();
    if(updatedList!.isEmpty)
    {
      setState(() {
        isValid = false;
      });
      return;
    }
    for (var subject in updatedList!) {
      String tempPath =
          '${widget.firebaseStoragePath}/${subject['subject']}.pdf';
      await LocalFileSaver.saveFile(
          FirebaseStorageServices(firebaseStoragePath: tempPath)
              .getFirebaseSyllabusRef,
          subject['subject'].toString());
    }
    _showSnackBar();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_sharp),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: Text(
                'Select the subjects below to download ${widget.titleText.replaceAll('_', ' ')}',
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SizedBox(
              height: height * 0.58,
              child: SingleChildScrollView(
                child: Column(
                  children:
                      semesterSyllabus.semesters['${widget.selectedYear}']!
                          .map(
                            (subject) => SubjectCheckBox(subject: subject),
                          )
                          .toList(),
                ),
              ),
            ),
            if (!isValid)
              const Center(
                child: Text(
                  "Please select subject!",
                  style: TextStyle(
                    color: Color(0xFFCF0000),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'download',
          backgroundColor: const Color(0xFF00512D),
          elevation: 8,
          onPressed: _downloadFiles,
          child: const Icon(
            Icons.file_download_outlined,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
    );
  }
}
