import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          const Positioned(
            top: 60,
            left: 30,
            child: SizedBox(
              child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage("assets/images/ProfileImage.png"),
                ),
            ),
            ),
        ],
      ),
    );
  }
}
