import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageLoading extends StatefulWidget {
  const ImageLoading({super.key});

  @override
  State<ImageLoading> createState() => _ImageLoadingState();
}

class _ImageLoadingState extends State<ImageLoading> {

  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            ElevatedButton(
                onPressed: (){
                  getImage();
                },
                child: const Text("Upload")
            ),
            imageFile != null ? SizedBox(
              height: 100,
              width: 100,
              child: CircleAvatar(
                backgroundImage: FileImage(imageFile!),
              ),
            ) : const Text("Please Upload the image"),
          ],
        ),
      ),
    );
  }

  Future getImage() async
  {
    final returnedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
    );
    print(returnedImage?.path);
    if(returnedImage == null) return;
    setState(() {
      imageFile = File(returnedImage.path);
    });
  }
}
