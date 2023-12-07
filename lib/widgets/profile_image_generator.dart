import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:untitled/utilities/profile_image_notifier.dart';
import 'package:flutter/material.dart';
import 'package:untitled/widgets/profile_image_item.dart';

import '../providers/login_api.dart';

class ProfileImageGenerator extends StatelessWidget {
  ProfileImageGenerator({required this.radius, super.key});
  double radius;
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileImageNotifier>(
        builder: (ctx, profileImageNotifier, child)
            {
              return profileImageNotifier.imageFile != null
                  ? ProfileImageItem(image:  FileImage(profileImageNotifier.imageFile!), radius: radius,profileImageNotifier: profileImageNotifier,)
                  : LoginAPI.personalInfo?.passportSizePhoto != null
                  ? ProfileImageItem(profileImageNotifier: profileImageNotifier, radius: radius,image: MemoryImage(
                  base64Decode(LoginAPI.personalInfo?.passportSizePhoto)))
                  : ProfileImageItem(profileImageNotifier: profileImageNotifier, radius: radius,image: AssetImage("assets/images/ProfileImage.png"));
            }
    );

  }
}
