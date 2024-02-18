import 'dart:async';

import 'package:flutter/material.dart';

class CarouselSliding extends StatefulWidget {
  const CarouselSliding({Key? key}) : super(key: key);

  @override
  State<CarouselSliding> createState() => _CarouselSlidingState();
}

class _CarouselSlidingState extends State<CarouselSliding>
{
  late Timer timer;
  PageController pageController = PageController();
  
  List notification = ["B.Tech 2-1 Semester Revaluation Results Jan 2023 - Released.",
    "B.Tech 1-1 Semester Regular /Supply Results Feb 2023 - Released.",
    "App Update available ( Install new version from Play Store )"];
  
  late int currentPage = 0;
  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 2),
          (timer) {
      if(currentPage < 2)
      {
        currentPage++;
      }
      else
      {
        currentPage = 0;
      }
      if (pageController.hasClients) {
        pageController.animateToPage( currentPage,
            duration: Duration(milliseconds: 400),
            curve: Curves.easeInOut
        );
        }
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Container(
              height: 110,
              decoration: BoxDecoration(
                color: Color(0xFFEFE1D0),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Stack(
                children: [
                  PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index % notification.length;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                          onTap: null,    // Link to that Pages.
                            child: Stack(
                              children : [
                                Positioned(
                                  top : 30,
                                    left: 28,
                                    child: Image.asset("assets/images/Screen6Notif.png"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(61, 30, 30, 0),
                                  child: Text(
                                    notification[index % notification.length],
                                    style: TextStyle(fontFamily: "LibreFranklin-Medium", fontSize: 15, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                    );
                  },
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for(int i = 0; i < notification.length; i++)
                        indicator(currentPage == i),
                    ],
                  ),
              ],
              ),
            ),
          ),
        ],
      );
  }

  Widget indicator(bool matched)
  {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 90),
      child: Container(
        height: matched ? 8 : 6,
        width: matched ? 8 : 6,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: matched ? Color(0xFF382E1E) : Color(0x80382E1E),
        ),
      ),
    );
  }
}
