// import 'dart:async';
//
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  List notification = [
    "B.Tech 2-1 Semester Revaluation Results Jan 2023 - Released.",
    "B.Tech 1-1 Semester Regular /Supply Results Feb 2023 - Released.",
    "App Update available ( Install new version from Play Store )"
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        for (final item in notification)
          Container(
            height: 110,
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Color(0xFFEFE1D0),
              borderRadius: BorderRadius.circular(30),
            ),
            child: GestureDetector(
              onTap: null, // Link to that Pages.
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset("assets/images/Screen6Notif.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontFamily: "LibreFranklin-Medium",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
      ],
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlay: true,
      ),
    );
  }
}

