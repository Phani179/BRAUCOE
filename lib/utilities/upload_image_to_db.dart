import 'package:braucoe/utilities/profile_image_notifier.dart';

import '../providers/image_provider.dart';

void uploadImage(ProfileImageNotifier profileImageNotifier) async {
  print("Image Upload : 1");
  await profileImageNotifier.loadImage();
  print("Image Upload : 4");
  ImageAPI imageAPI = ImageAPI();
  imageAPI.uploadAPI(profileImageNotifier.imageFile);
  print("Successfully Uploaded");
}