import 'dart:convert';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/API/ImageAPI.dart';
import 'package:untitled/Screens/Help.dart';
import 'package:untitled/Screens/ResultTable.dart';
import '../API/LoginAPI.dart';
import '../API/ResultAPI.dart';
import 'CarosuelSliding.dart';
import 'StudentLogin.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Home(),
//     );
//   }
// }
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  GlobalKey<ScaffoldState>? scaffoldState = GlobalKey();
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldState,
      backgroundColor: const Color(0xFFEFE1D0),

        // Drawer

        drawer: Drawer(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 13,
                    ),
                    GestureDetector
                      (
                        child: const Icon(Icons.arrow_back_outlined),
                      onTap: (){
                          scaffoldState?.currentState?.closeDrawer();
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
            imageFile != null ?
            GestureDetector(
                child: SizedBox(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: FileImage(imageFile!),
                  ),
                ),
                onTap: () async {
                  print("Image Upload : 1");
                  await getImage();
                  print("Image Upload : 4");
                  ImageAPI imageAPI = ImageAPI();
                  imageAPI.uploadAPI(imageFile);
                  print("Successfully Uploaded");
                }
            )
            : LoginAPI.personalInfo?.passportSizePhoto != null ?
            GestureDetector(
                child: SizedBox(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: MemoryImage(base64Decode(LoginAPI.personalInfo?.passportSizePhoto)),
                  ),
                ),
                onTap: () async {
                  print("Image Upload : 1");
                  await getImage();
                  print("Image Upload : 4");
                  ImageAPI imageAPI = ImageAPI();
                  imageAPI.uploadAPI(imageFile);
                  print("Successfully Uploaded");
                }
            )
                :
            GestureDetector(
                child: const SizedBox(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/images/ProfileImage.png"),
                  ),
                ),
                onTap: () async {
                  print("Image Upload : 1");
                  await getImage();
                  print("Image Upload : 4");
                  ImageAPI imageAPI = ImageAPI();
                  imageAPI.uploadAPI(imageFile);
                  print("Successfully Uploaded");
                }
            )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                        child: AutoSizeText(
                          "${LoginAPI.studentDetails?.student_name}",
                          style: const TextStyle(fontFamily: "LibreFranklin-SemiBold", color: Color(0xFF382E1E)),
                          minFontSize: 20,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    AutoSizeText(
                      "${LoginAPI.studentDetails?.studentId}",
                      style: const TextStyle(fontFamily: "LibreFranklin-Medium", fontSize: 20, color: Color(0xFF382E1E)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      child: const Text("View Profile",
                        style: TextStyle(color: Color(0x99382E1E),
                            fontFamily: "LibreFranklin-SemiBold",
                        fontSize: 18,
                        ),
                      ),
                      onTap: ()
                      {

                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.3,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 20,
                      width: 295,
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Color(0x33000000), width : 1)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(Icons.help, color:  Color(0xFF382E1E),),
                    const SizedBox(
                      width: 7,
                    ),
                    GestureDetector(
                      child: const Text("Help", style: TextStyle(
                        fontFamily: "LibreFranklin-Medium",
                        fontSize: 18,
                      ),),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Help()));
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(Icons.star, color:  Color(0xFF382E1E),),
                    const SizedBox(
                      width: 7,
                    ),
                    GestureDetector(
                      child: const Text("Rate", style: TextStyle(
                        fontFamily: "LibreFranklin-Medium",
                        fontSize: 18,
                      ),),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(Icons.feedback, color:  Color(0xFF382E1E),),
                    const SizedBox(
                      width: 7,
                    ),
                    GestureDetector(
                      child: const Text("Feedback", style: TextStyle(
                        fontFamily: "LibreFranklin-Medium",
                        fontSize: 18,
                      ),),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 100,
                    ),
                    Container(
                      height: 45,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x29000000),
                            offset: Offset(4, 6),
                            blurRadius: 4,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          backgroundColor: const Color(0xFF00512D),
                          disabledBackgroundColor: const Color(0xFF00512D),
                        ),
                          onPressed: () async {
                          var prefs = await SharedPreferences.getInstance();
                          prefs.setBool(StudentLogin.isLoggedIn, false);
                          print("Logout : ${prefs.getBool(StudentLogin.isLoggedIn)}");
                          Navigator.push(context, MaterialPageRoute(builder: (context) => StudentLogin()));
                          // Navigator.popUntil(context, (route) => false)
                          },
                          child: const Text("LOGOUT", style: TextStyle(
                            color: Color(0xFFFCFCFC),
                            fontFamily: "LibreFranklin-Bold",
                            fontSize: 15,
                          ),),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),

        // Drawer code Ended.

        // resizeToAvoidBottomInset: true,
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Color(0xFFEFE1D0),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Row(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.14,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.04,
                      ),
                      GestureDetector(
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
                            ),
                            imageFile != null ?
                            SizedBox(
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundImage: FileImage(imageFile!),
                                  ),
                                )
                                : LoginAPI.personalInfo?.passportSizePhoto != null ?
                            SizedBox(
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundImage: MemoryImage(base64Decode(LoginAPI.personalInfo?.passportSizePhoto)),
                                  ),
                                )
                                :
                           const SizedBox(
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundImage: AssetImage("assets/images/ProfileImage.png"),
                                  ),
                                )
                              ],
                        ),
                        onTap: (){
                          scaffoldState?.currentState?.openDrawer();
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
                                width : MediaQuery.of(context).size.width * 0.7,
                                child: AutoSizeText(
                                  "${LoginAPI.studentDetails?.student_name}",
                                  minFontSize: 10,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 16, fontFamily: "LibreFranklin-Medium"),
                                ),
                              ),
                              // Text(, style: TextStyle(fontSize: 18, fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w500),),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text("${LoginAPI.studentDetails?.studentId}", style: const TextStyle(fontSize: 16, fontFamily: "LibreFranklin-Medium")),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.067,
                          ),
                          const Icon(Icons.notification_add, size: 33,),
                        ],
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height : 150,
                          child : CarouselSliding(),
                        ),
                        Container(
                          height: 110,
                          // width: 340,
                          padding: const EdgeInsets.fromLTRB(10, 4, 10, 2),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFFEFE1D0),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0x33000000).withOpacity(0.3),
                                      offset: const Offset(4, 6),
                                      blurRadius: 4.0,
                                      spreadRadius: 0,
                                    )
                                  ]
                              ),
                              padding: const EdgeInsets.only(
                                left: 30,
                                top: 15,
                              ),
                              child: Row(
                                children: [
                                  Image.asset('assets/images/library.png'),
                                  const SizedBox(
                                    width: 21,
                                  ),
                                  const Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text('Library',
                                          style: TextStyle(
                                              fontFamily: "LibreFranklin-Bold",
                                              fontSize: 25,
                                              color: Color(0xFF382E1E))),
                                    ],
                                  ),
                                ],
                              ),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            height: 120,
                            //width: 340,
                            padding: const EdgeInsets.fromLTRB(10, 14, 10, 2),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xFFEFE1D0),
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0x33000000).withOpacity(0.3),
                                        offset: const Offset(4, 6),
                                        blurRadius: 4.0,
                                        spreadRadius: 0,
                                      )
                                    ]
                                ),
                                padding: const EdgeInsets.only(
                                  left: 30,
                                  top: 15,
                                ),
                                child: Row(
                                  children: [
                                    Image.asset('assets/images/result.png'),
                                    const SizedBox(
                                      width: 22,
                                    ),
                                    const Column(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text('Results',
                                            style: TextStyle(
                                                fontFamily: "LibreFranklin-Bold",
                                                fontSize: 25,
                                                color: Color(0xFF382E1E))),
                                      ],
                                    ),
                                  ],
                                )
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              ResultAPI resultsAPI = ResultAPI();
                              resultsAPI.getResult("Semester- 1",LoginAPI.studentDetails?.studentId);
                            });
                            Future.delayed(const Duration(seconds: 3), () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const ResultTable()));
                            });
                          },
                        ),
                        Container(
                          height: 120,
                          //width: 340,
                          padding: const EdgeInsets.fromLTRB(10, 14, 10, 2),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFFEFE1D0),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0x33000000).withOpacity(0.3),
                                      offset: const Offset(4, 6),
                                      blurRadius: 4.0,
                                      spreadRadius: 0,
                                    )
                                  ]
                              ),
                              padding: const EdgeInsets.only(
                                left: 42,
                                top: 15,
                              ),
                              child: Row(
                                children: [
                                  Image.asset('assets/images/syllabus.png'),
                                  const SizedBox(
                                    width: 21,
                                  ),
                                  const Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text('Syllabus',
                                          style: TextStyle(
                                              fontFamily: "LibreFranklin-Bold",
                                              fontSize: 25,
                                              color: Color(0xFF382E1E))),
                                    ],
                                  ),
                                ],
                              )
                          ),
                        ),
                        Container(
                          height: 120,
                          // width: 340,
                          padding: const EdgeInsets.fromLTRB(10, 14, 10, 2),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFFEFE1D0),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0x33000000).withOpacity(0.3),
                                      offset: const Offset(4, 6),
                                      blurRadius: 4.0,
                                      spreadRadius: 0,
                                    )
                                  ]
                              ),
                              padding: const EdgeInsets.only(
                                left: 34,
                                top: 10,
                              ),
                              child: Row(
                                children: [
                                  Image.asset('assets/images/fees.png'),
                                  const SizedBox(
                                    width: 17,
                                  ),
                                  const Column(
                                    children: [
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Text('Fee Details',
                                          style: TextStyle(
                                              fontFamily: "LibreFranklin-Bold",
                                              fontSize: 25,
                                              color: Color(0xFF382E1E))),
                                    ],
                                  ),
                                ],
                              )
                          ),
                        ),
                        Container(
                          height: 120,
                          // width: 340,
                          padding: const EdgeInsets.fromLTRB(10, 14, 10, 2),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFFEFE1D0),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0x33000000).withOpacity(0.3),
                                      offset: const Offset(4, 6),
                                      blurRadius: 4.0,
                                      spreadRadius: 0,
                                    )
                                  ]
                              ),
                              padding: const EdgeInsets.only(
                                left: 34,
                                top: 10,
                              ),
                              child: Row(
                                children: [
                                  Image.asset('assets/images/fees.png'),
                                  const SizedBox(
                                    width: 17,
                                  ),
                                  const Column(
                                    children: [
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Text('Fee Details',
                                          style: TextStyle(
                                              fontFamily: "LibreFranklin-Bold",
                                              fontSize: 25,
                                              color: Color(0xFF382E1E))),
                                    ],
                                  ),
                                ],
                              )
                          ),
                        ),
                      ]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.black)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                child: Container(
                  decoration: const BoxDecoration(
                  ),
                  child: SizedBox(
                    height: 70,
                    child: GNav(
                        backgroundColor: Colors.white,
                        activeColor: const Color(0xff00512D), // Colors.green.shade900,
                        tabBackgroundColor: Colors.green.shade100,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        gap: 8,
                        padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 8),
                        tabs: const [
                          GButton(
                            icon: Icons.home,
                            iconSize: 25,
                            text: 'Home',
                            textStyle: TextStyle(fontFamily: "LibreFranklin-Medium"),
                            textSize: 25,
                          ),
                          GButton(
                            icon: Icons.search,
                            iconSize: 25,
                            text: 'Search',
                            textStyle: TextStyle(fontFamily: "LibreFranklin-Medium"),
                            textSize: 25,
                            onPressed: null,
                          ),
                          GButton(
                            icon: Icons.settings,
                            iconSize: 25,
                            text: 'Settings',
                            textStyle: TextStyle(fontFamily: "LibreFranklin-Medium"),
                            textSize: 25,
                            onPressed: null,
                          ),
                        ]
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Future getImage() async
  {
    print("Image Upload : 2");
    final returnedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    print(returnedImage?.path);
    if(returnedImage == null) {
      print("Image Null");
      return;
    }
        setState(() {
          print("Set State");
          imageFile = File(returnedImage.path);
        });
        print("Image Upload : 3");
  }
}
