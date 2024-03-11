
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

class FileHandling {
  static Future<void> saveFile(
      File localFile, String subjectName) async {
    await FileSaver.instance.saveAs(
      file: localFile,
      name: '${subjectName}_syllabus',
      ext: 'pdf',
      mimeType: MimeType.pdf,
    );
  }
  
  static void saveFileFromChat(String path) async
  {
    final fileRef = FirebaseStorage.instance.ref(path);
    final filePath = (await getApplicationDocumentsDirectory()).path;
    File localFile = File('$filePath/${fileRef.name}');
    await fileRef.writeToFile(localFile);
    await FileSaver.instance.saveAs(
      file: localFile,
      name: fileRef.name,
      ext: fileRef.name.split('.').last,
      mimeType: MimeType.other,
    );
  }

  static Future<List<File>?> pickFile() async
  {
    FilePickerResult? files = await FilePicker.platform.pickFiles(allowMultiple: true);
    List<File> pickedFiles = [];
    if(files == null)
      {
        return null;
      }
    for(PlatformFile platformFile in files.files)
      {
        File file = File(platformFile.path!);
        pickedFiles.add(file);
      }
    return pickedFiles;
  }
}
