import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ClassDetailsShimmerLoading extends StatelessWidget {
  const ClassDetailsShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (ctx, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // color: const Color(0xFFEFE1D0),
                    margin: const EdgeInsets.only(
                        left: 10, bottom: 5, right: 10),
                    elevation: 2,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 100,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade200,
                            highlightColor: Colors.grey.shade300,
                            child: Text(
                              '${index + 1}.',
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'LibreFranklin-Regular',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Shimmer.fromColors(
                                    baseColor: Colors.grey.shade200,
                                    highlightColor: Colors.grey.shade300,
                                    child: Container(
                                      height: 20,
                                      width: MediaQuery.of(context).size.width * 0.65,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.black,
                                      ),
                                    )
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Shimmer.fromColors(
                                    baseColor: Colors.grey.shade200,
                                    highlightColor: Colors.grey.shade300,
                                    child: Container(
                                      height: 20,
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.black,
                                      ),
                                    )
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Shimmer.fromColors(
                                        baseColor: Colors.grey.shade200,
                                        highlightColor: Colors.grey.shade300,
                                        child: Container(
                                          height: 20,
                                          width: MediaQuery.of(context).size.width * 0.3,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.black,
                                          ),
                                        )
                                    ),
                                    Shimmer.fromColors(
                                        baseColor: Colors.grey.shade200,
                                        highlightColor: Colors.grey.shade300,
                                        child: Container(
                                          height: 20,
                                          width: MediaQuery.of(context).size.width * 0.3,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.black,
                                          ),
                                        )
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
