import 'package:braucoe/providers/profile_image_notifier.dart';

import '../data/apis/image_api.dart';

void uploadImage(ProfileImageNotifier profileImageNotifier) async {
  print("Image Upload : 1");
  await profileImageNotifier.loadImage();
  print("Image Upload : 4");
  ImageAPI imageAPI = ImageAPI();
  imageAPI.uploadAPI(profileImageNotifier.imageFile);
  print("Successfully Uploaded");
}