import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoginShimmerWidget extends StatefulWidget {
  @override
  _LoginShimmerWidget createState() => _LoginShimmerWidget();
}
class _LoginShimmerWidget extends State<LoginShimmerWidget> {
  @override
  Widget build(BuildContext context){
    return AlertDialog(
        content: Container(
          width: 200,
            height: 200,
            child: Stack(
                children: [
                  Positioned(
                    left: 20,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade50,
                      highlightColor:Colors.grey.shade500,
                      child : Container(
                        height: 15,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 25,
                    left: 90,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade50,
                      highlightColor:Colors.grey.shade500,
                      child : Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 35,
                    right: 35,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade100,
                      highlightColor:Colors.grey.shade500,
                      child : Container(
                        height: 15,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 105,
                    left: 10,
                    right: 10,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade100,
                      highlightColor:Colors.grey.shade500,
                      child : Container(
                        height: 15,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 125,
                    left: 30,
                    right: 30,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade100,
                      highlightColor:Colors.grey.shade500,
                      child : Container(
                        height: 15,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 78,
                    right: 78,
                    top: 165,
                    child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade100,
                        highlightColor:Colors.grey.shade500,
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        )
                    ),
                  ),
                ],
            )
        ),
    );
  }
}
