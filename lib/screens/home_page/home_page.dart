
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';
import 'package:braucoe/screens/class_details/class_details.dart';
import 'package:braucoe/screens/fee_details/fee_details.dart';
import 'package:braucoe/screens/syllabus/syllabus_page.dart';
import 'package:braucoe/utilities/customized_paint.dart';
import 'package:braucoe/widgets/home_page_item.dart';
import 'package:braucoe/providers/profile_image_notifier.dart';
import 'package:braucoe/widgets/home_page_drawer.dart';
import 'package:braucoe/data/apis/login_api.dart';
import 'package:braucoe/utilities/images.dart';
import 'package:braucoe/screens/previous_papers/previous_papers_page.dart';
import 'package:braucoe/screens/results/result_home_screen.dart';
import 'package:braucoe/screens/login/logo_screen.dart';
import 'carosuel_sliding.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home-page';

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return PopScope(
      onPopInvoked: (willPop){
        LogoScreen.isLoggedIn = true;
      },
      child: Scaffold(
        key: scaffoldState,
        // Drawer
        drawer: HomePageDrawer(
          scaffoldState: scaffoldState,
        ),
        // resizeToAvoidBottomInset: true,
        body: CustomPaint(
          painter: CustomizedPaint(),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  Consumer<ProfileImageNotifier>(
                    builder: (BuildContext context,
                        ProfileImageNotifier profileImageNotifier,
                        Widget? child) {
                      return GestureDetector(
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
                            ),
                            profileImageNotifier.imageFile != null
                                ? SizedBox(
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage: FileImage(
                                    profileImageNotifier.imageFile!),
                              ),
                            )
                                : LoginAPI.personalInfo?.passportSizePhoto != null
                                ? SizedBox(
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage: MemoryImage(
                                    base64Decode(LoginAPI.personalInfo
                                        ?.passportSizePhoto)),
                              ),
                            )
                                : const SizedBox(
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage(
                                    Images.profileImage),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          scaffoldState.currentState?.openDrawer();
                        },
                      );
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.065,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: AutoSizeText(
                              "${LoginAPI.studentDetails?.student_name}",
                              minFontSize: 10,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: "LibreFranklin-Medium"),
                            ),
                          ),
                          // Text(, style: TextStyle(fontSize: 18, fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w500),),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text("${LoginAPI.studentDetails?.studentId}",
                          style: const TextStyle(
                              fontSize: 16, fontFamily: "LibreFranklin-Medium")),
                    ],
                  ),
                  // Column(
                  //   children: [
                  //     SizedBox(
                  //       height: MediaQuery.of(context).size.height * 0.067,
                  //     ),
                  //     const Icon(
                  //       Icons.notification_add,
                  //       size: 33,
                  //     ),
                  //   ],
                  // ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child:  SizedBox(
                  height: 110,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: const CarouselSliderWidget(),
                ),
              ),
              const Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Class Details
                      HomePageItem(
                        title: 'Class Details',
                        image: Images.classDetails,
                        leftPadding: 10.0,
                        nextPage: ClassDetailsScreen(),
                      ),

                      // Results
                      HomePageItem(
                        title: 'Results',
                        image: Images.result,
                        leftPadding: 30.0,
                        nextPage: ResultHomeScreen(),
                      ),

                      // Syllabus
                      HomePageItem(
                        title: 'Syllabus',
                        image: Images.syllabus,
                        leftPadding: 42.0,
                        nextPage: SyllabusPage(),
                      ),

                      // Previous Papers
                      HomePageItem(
                        title: 'Previous Papers',
                        image: Images.previousPapers,
                        leftPadding: 34.0,
                        nextPage: PreviousPapersScreen(),
                      ),

                      // Fees
                      HomePageItem(
                        title: 'Fee Details',
                        image: Images.fees,
                        leftPadding: 34.0,
                        nextPage: FeeDetailsScreen(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}