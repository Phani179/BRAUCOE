import 'package:flutter/material.dart';

import '../utilities/profile_image_notifier.dart';
import '../utilities/upload_image_to_db.dart';

class ProfileImageItem extends StatelessWidget {
  ProfileImageItem({ required this.profileImageNotifier, required this.radius,required this.image, super.key});
  final ImageProvider<Object>? image;
  final double radius;
  ProfileImageNotifier profileImageNotifier;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: SizedBox(
          child: CircleAvatar(
            radius: radius,
            backgroundColor: Colors.white,
            backgroundImage: image,
          ),
        ),
        onTap: () async {
          uploadImage(profileImageNotifier);
        });
  }
}
