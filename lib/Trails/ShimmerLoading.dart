import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatefulWidget {
  @override
  _ShimmerLoading createState() => _ShimmerLoading();
}
class _ShimmerLoading extends State<ShimmerLoading> {
  @override
  Widget build(BuildContext context){
    return AlertDialog(
        content: Container(
            width: 200,
            height: 150,
            child: Stack(
              children: [
                Positioned(
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
                  top: 70,
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
                  left: 78,
                  right: 78,
                  top: 115,
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
                      child: Text(" "),
                    )
                  ),
                ),
              ],
            )
        ),
    );
  }
}
