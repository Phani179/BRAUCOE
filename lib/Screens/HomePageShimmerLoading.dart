import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shimmer/shimmer.dart';

class HomePageShimmerLoading extends StatefulWidget {
  const HomePageShimmerLoading({super.key});

  @override
  State<HomePageShimmerLoading> createState() => _HomePageShimmerLoadingState();
}

class _HomePageShimmerLoadingState extends State<HomePageShimmerLoading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                 Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.035,
                        ),
                        Shimmer.fromColors(
                            baseColor: Colors.grey.shade200,
                            highlightColor: Colors.grey.shade300,
                            child: const SizedBox(
                              child: CircleAvatar(
                                radius: 27,
                              ),
                            ),
                        )
                      ],
                    ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Row(
                        children: [
                          Shimmer.fromColors(
                              child: Container(
                                height: 20,
                                width: MediaQuery.of(context).size.width * 0.7,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black,
                                ),
                              ),
                              baseColor: Colors.grey.shade200,
                              highlightColor: Colors.grey.shade300
                          ),
                          // Text(, style: TextStyle(fontSize: 18, fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w500),),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade200,
                          highlightColor: Colors.grey.shade300,
                          child: Container(
                            height: 20,
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                            ),
                          )
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.045,
                      ),
                      Shimmer.fromColors(
                          child: Icon(Icons.notification_add, size: 33,),
                          baseColor: Colors.grey.shade200,
                          highlightColor: Colors.grey.shade300
                      ),
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
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade200,
                          highlightColor: Colors.grey.shade300,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.11,
                            width: MediaQuery.of(context).size.width * 0.95,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.black,
                            ),
                          )
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade200,
                          highlightColor: Colors.grey.shade300,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.11,
                            width: MediaQuery.of(context).size.width * 0.95,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.black,
                            ),
                          )
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade200,
                          highlightColor: Colors.grey.shade300,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.11,
                            width: MediaQuery.of(context).size.width * 0.95,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.black,
                            ),
                          )
                      ),

                      const SizedBox(
                        height: 15,
                      ),
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade200,
                          highlightColor: Colors.grey.shade300,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.11,
                            width: MediaQuery.of(context).size.width * 0.95,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.black,
                            ),
                          )
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade200,
                          highlightColor: Colors.grey.shade300,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.11,
                            width: MediaQuery.of(context).size.width * 0.95,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.black,
                            ),
                          )
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade200,
                          highlightColor: Colors.grey.shade300,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.11,
                            width: MediaQuery.of(context).size.width * 0.95,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.black,
                            ),
                          )
                      ),
                    ]
                ),
              ),
            ),
          ],
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
              child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade200,
                  highlightColor: Colors.grey.shade300,
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
                  )
              ),
            ),
          ),
        ),
      ),
    );
  }
}
