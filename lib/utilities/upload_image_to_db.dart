import 'package:untitled/utilities/profile_image_notifier.dart';

import '../API/ImageAPI.dart';

void uploadImage(ProfileImageNotifier profileImageNotifier) async {
  print("Image Upload : 1");
  await profileImageNotifier.loadImage();
  print("Image Upload : 4");
  ImageAPI imageAPI = ImageAPI();
  imageAPI.uploadAPI(profileImageNotifier.imageFile);
  print("Successfully Uploaded");
}