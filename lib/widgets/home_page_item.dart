
import 'package:flutter/material.dart';

class HomePageItem extends StatelessWidget {
  const HomePageItem(
      {required this.title,
      required this.image,
      required this.leftPadding,
      required this.nextPage,
      super.key});

  final String image;
  final String title;
  final leftPadding;
  final nextPage;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      child: Container(
          height: height * 0.12,
          //width: 340,
          margin: const EdgeInsets.fromLTRB(10, 14, 10, 2),
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
              ]),
          padding: EdgeInsets.only(
            left: leftPadding,
          ),
          child: Row(
            children: [
              SizedBox(

                child: Image.asset(
                  height: height * 0.1,
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontFamily: "LibreFranklin-Regular",
                          fontWeight: FontWeight.w900,
                          fontSize: 25,
                          color: Color(0xFF382E1E))),
                ],
              ),
              const Spacer(),
            ],
          )),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => nextPage));
      },
    );
  }
}
