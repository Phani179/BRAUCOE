import 'package:auto_size_text/auto_size_text.dart';
import'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:untitled/API/LoginAPI.dart';
import 'package:untitled/API/TableCreation.dart';

import '../API/ResultAPI.dart';
import 'CarosuelSliding.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {

  GlobalKey<ScaffoldState>? scaffoldState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      backgroundColor: Color(0xFFEFE1D0),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.greenAccent[30],
                ),
                child: const Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('help'),
                leading: const Icon(Icons.help),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('rate'),
                leading: const Icon(Icons.star_rate),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('feedback'),
                leading: const Icon(Icons.feedback),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Positioned(
                top: 680,
                left:75,
                right: 50,
                height:40,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const[
                      BoxShadow(
                        color: Color(0x33000000),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(4, 6),
                      )
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      backgroundColor: const Color(0xFF00512D),
                    ),
                    onPressed: () {},
                    child: const Text("LOGOUT", style: TextStyle(
                      fontFamily: "LibreFranklin-Regular",
                      fontWeight: FontWeight.w400,
                    )
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // resizeToAvoidBottomInset: true,
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Color(0xFFEFE1D0),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
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
                               const Icon(Icons.person, size: 50,),
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
                                  "${LoginTrailAPI.student[0]["name"]}",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 18, fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w500),
                                ),
                              ),
                              // Text(, style: TextStyle(fontSize: 18, fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w500),),
                            ],
                          ),
                          Text("${LoginTrailAPI.student[0]["reg_no"]}", style: const TextStyle(fontSize: 18, fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w500)),
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
                                  Column(
                                    children: const [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text('Library',
                                          style: TextStyle(
                                              fontFamily: "LibreFranklin-Regular",
                                              fontSize: 27,
                                              fontWeight: FontWeight.w900,
                                              color: Color(0xFF382E1E))),
                                    ],
                                  ),
                                ],
                              )
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
                                    Column(
                                      children: const [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text('Results',
                                            style: TextStyle(
                                                fontFamily: "LibreFranklin-Regular",
                                                fontSize: 27,
                                                fontWeight: FontWeight.w900,
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
                              resultsAPI.getResult(LoginTrailAPI.student[0]["reg_no"]);
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
                                  Column(
                                    children: const
                                    [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text('Syllabus',
                                          style: TextStyle(
                                              fontFamily: "LibreFranklin-Regular",
                                              fontSize: 27,
                                              fontWeight: FontWeight.w900,
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
                                  Column(
                                    children: const [
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Text('Fee Details',
                                          style: TextStyle(
                                              fontFamily: "LibreFranklin-Regular",
                                              fontSize: 27,
                                              fontWeight: FontWeight.w900,
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
                                  Column(
                                    children: const [
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Text('Fee Details',
                                          style: TextStyle(
                                              fontFamily: "LibreFranklin-Regular",
                                              fontSize: 27,
                                              fontWeight: FontWeight.w900,
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
                        activeColor: Colors.green.shade900,
                        tabBackgroundColor: Colors.green.shade200,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        gap: 8,
                        tabs: const [
                          GButton(
                            icon: Icons.home,
                            text: 'Home',
                            textStyle: TextStyle(fontFamily: "LibreFranklin-Regular", fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          GButton(
                            icon: Icons.search,
                            text: 'Search',
                            textStyle: TextStyle(fontFamily: "LibreFranklin-Regular", fontSize: 20, fontWeight: FontWeight.w600),
                            onPressed: null,
                          ),
                          GButton(
                            icon: Icons.settings,
                            text: 'Settings',
                            textStyle: TextStyle(fontFamily: "LibreFranklin-Regular", fontSize: 20, fontWeight: FontWeight.w600),
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
}
