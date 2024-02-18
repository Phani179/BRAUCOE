import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ProfileImageNotifier extends ChangeNotifier
{
  var imageFile;

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