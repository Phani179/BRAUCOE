import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/API/ImageAPI.dart';

class ImageLoading extends StatefulWidget {
  static File? imageFile;
  @override
  State<ImageLoading> createState() => _ImageLoadingState();
}

class _ImageLoadingState extends State<ImageLoading> {

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            ElevatedButton(
                onPressed: (){
                  try{
                    ImageAPI imageAPI = ImageAPI();
                    getImage().then((value) => imageAPI.uploadAPI(ImageLoading.imageFile));
                  } catch(e)
                  {
                    print(e);
                  }
                    },
                child: const Text("Upload")
            ),
            ImageLoading.imageFile != null ? SizedBox(
              height: 100,
              width: 100,
              child: CircleAvatar(
                backgroundImage: FileImage(ImageLoading.imageFile!),
              ),
            ) : const Text("Please Upload the image"),
          ],
    );
  }

  Future getImage() async
  {
    print(1);
    final returnedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
    );
    print(returnedImage?.path);
    if(returnedImage == null) return;
    setState(() {
      print(2);
      ImageLoading.imageFile = File(returnedImage.path);
    });
    return returnedImage;
  }
}
