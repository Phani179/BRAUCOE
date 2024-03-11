import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ProfileImageNotifier extends ChangeNotifier
{
  var imageFile;

  void setImage(String image) async
  {
    File file = File('${(await getApplicationDocumentsDirectory()).path}/profile.png');
    file.writeAsBytesSync(base64Decode(image));
    imageFile = file;
    notifyListeners();
  }

  Future<void> loadImage() async
  {
    print('Notifier Called');
    final selectedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    print(selectedImage?.path);
    if(selectedImage == null) {
      print("Image Null");
      return;
    }
    imageFile = File(selectedImage.path);
    print("File Uploaded");
    notifyListeners();
  }
}