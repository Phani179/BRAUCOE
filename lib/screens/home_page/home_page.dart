import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screens/fee_details/fee_details.dart';
import 'package:untitled/screens/previous_papers/previous_papers_page.dart';
import 'package:untitled/screens/syllabus/syllabus_page.dart';
import 'package:untitled/utilities/customized_paint.dart';
import 'package:untitled/utilities/home_page_item.dart';
import 'package:untitled/utilities/profile_image_notifier.dart';
import 'package:untitled/widgets/home_page_drawer.dart';
import '../../providers/login_api.dart';
import '../../utilities/images.dart';
import '../results/result_home_page.dart';
import 'carosuel_sliding.dart';

class HomePage extends StatefulWidget {
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
    return Scaffold(
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
                                            "assets/images/ProfileImage.png"),
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
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.067,
                    ),
                    const Icon(
                      Icons.notification_add,
                      size: 33,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const SizedBox(
              height: 150,
              child: CarouselSliding(),
            ),
            SizedBox(
              height: height * 0.585,
              child: const SingleChildScrollView(
                child: Column(
                  children: [
                    // Results
                    HomePageItem(
                        title: 'Results',
                        image: Images.result,
                        leftPadding: 30.0,
                        nextPage: ResultHomePage()),

                    // Syllabus
                    HomePageItem(
                        title: 'Syllabus',
                        image: Images.syllabus,
                        leftPadding: 42.0,
                        nextPage: SyllabusPage()),

                    // Previous Papers
                    HomePageItem(
                        title: 'Previous Papers',
                        image: Images.previousPapers,
                        leftPadding: 34.0,
                        nextPage: PreviousPapersScreen()),

                    // Fees
                    HomePageItem(
                        title: 'Fee Details',
                        image: Images.fees,
                        leftPadding: 34.0,
                        nextPage: FeeDetailsScreen()),

                    // Library
                    // HomePageItem(
                    //     title: 'Library',
                    //     image: Images.library,
                    //     leftPadding: 30.0,
                    //     nextPage: null),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: Container(
            decoration: const BoxDecoration(),
            child: const SizedBox(
              height: 70,
              child: GNav(
                  backgroundColor: Colors.white,
                  activeColor: Color(0xff00512D),
                  // Colors.green.shade900,
                  tabBackgroundColor: Color(0xFF9DCCB7),
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  gap: 8,
                  padding: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                  tabs: [
                    GButton(
                      icon: Icons.home,
                      iconColor: Color(0xFF382E1E),
                      iconSize: 25,
                      text: 'Home',
                      textStyle: TextStyle(
                          fontFamily: "LibreFranklin-Medium",
                          color: Color(0xFF00512D)),
                      textSize: 25,
                      onPressed: null,
                    ),
                    // GButton(
                    //   icon: Icons.search,
                    //   iconColor: Color(0xFF382E1E),
                    //   iconSize: 25,
                    //   text: 'Search',
                    //   textStyle: TextStyle(
                    //       fontFamily: "LibreFranklin-Medium",
                    //       color: Color(0xFF00512D)),
                    //   textSize: 25,
                    //   onPressed: null,
                    // ),
                    // GButton(
                    //   icon: Icons.settings,
                    //   iconColor: Color(0xFF382E1E),
                    //   iconSize: 25,
                    //   text: 'Settings',
                    //   textStyle: TextStyle(
                    //       fontFamily: "LibreFranklin-Medium",
                    //       color: Color(0xFF00512D)),
                    //   textSize: 25,
                    //   onPressed: null,
                    // ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
