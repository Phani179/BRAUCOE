
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:braucoe/utilities/file_handling.dart';

class PdfView extends StatefulWidget {
  PdfView({
    required this.subjectName,
    required this.file,
    super.key,
  });

  final File file;
  final String subjectName;

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  PDFViewController? pdfViewController;

  int currentPage = 1;

  int totalPages = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEFE1D0),
        title: Text(
          widget.subjectName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: 'LibreFranklin-Regular',
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          PDFView(
            filePath: widget.file.path,
            onRender: (total) {
              setState(() {
                totalPages = total!;
              });
            },
            onPageChanged: (current, total) {
              setState(() {
                currentPage = current! + 1;
              });
            },
          ),
          Positioned(
            right: 20,
            top: 20,
            child: Container(
              width: 30,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(
                  3,
                ),
              ),
              child: Text(
                '$currentPage/$totalPages',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'LibreFranklin-Regular',
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'download',
        backgroundColor: const Color(0xFF00512D),
        elevation: 8,
        onPressed: () async {
          await FileHandling.saveFile(widget.file, widget.subjectName);
        },
        child: const Icon(
          Icons.file_download_outlined,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}
