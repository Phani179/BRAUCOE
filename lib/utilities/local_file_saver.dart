import 'dart:io';
import 'package:file_saver/file_saver.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/services/firebase_storage_services.dart';

class LocalFileSaver {
  static Future<void> saveFile(
      Reference firebaseSyllabusRef, String subjectName) async {
    final filePath = (await getApplicationDocumentsDirectory()).path;
    File localFile = File('$filePath/${subjectName}_syllabus.pdf');
    await firebaseSyllabusRef.writeToFile(localFile);
    String? userLocatedFilePath = await FileSaver.instance.saveAs(
      file: localFile,
      name: '${subjectName}_syllabus',
      ext: 'pdf',
      mimeType: MimeType.pdf,
    );
  }
}
