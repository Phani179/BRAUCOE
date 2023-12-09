import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/providers/fee_details_api.dart';
import 'package:untitled/screens/fee_details/fee_info.dart';
import 'package:untitled/screens/login/student_login.dart';
import 'package:untitled/widgets/fees_bar.dart';
import 'package:untitled/widgets/shimmer_effect/fee_page_shimmer.dart';

class FeeDetailsScreen extends StatefulWidget {

  const FeeDetailsScreen({super.key});

  @override
  State<FeeDetailsScreen> createState() => _FeeDetailsScreenState();
}

class _FeeDetailsScreenState extends State<FeeDetailsScreen> {
  SharedPreferences? prefs;

  Future initializeSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  int dueAmount = 0;

  @override
  Widget build(BuildContext context) {
    FeeDetailsAPI feeDetailsAPI = FeeDetailsAPI();
    print(prefs?.getInt(StudentLogin.studentId));
    print(prefs?.getInt(StudentLogin.isLoggedIn));
    return Scaffold(
      body: FutureBuilder(
        future: initializeSharedPref(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return FutureBuilder(
              future: feeDetailsAPI
                  .getFeeDetails(prefs?.getInt(StudentLogin.studentId)),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: FeePageShimmerLoading(),
                  );
                } else if (snapshot.hasData) {
                  dueAmount = 140000 -
                      feeDetailsAPI.feeDetails.year1FeePaid -
                      feeDetailsAPI.feeDetails.year2FeePaid -
                      feeDetailsAPI.feeDetails.year3FeePaid -
                      feeDetailsAPI.feeDetails.year4FeePaid;
                  return SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Color(0xFF382E1E),
                              ),
                            ),
                            Image.asset('assets/images/fee_details.png'),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 17,
                              right: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Fee Details',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'LibreFranklin-Regular',
                                    color: Color(0xFF382E1E),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Check your year wise fee details.\n(filled region reflects amount paid)',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'LibreFranklin-Regular',
                                        color: Color(0xFF382E1E),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (ctx) =>
                                                    const FeeInfoScreen()));
                                      },
                                      icon: const Icon(
                                        Icons.info,
                                        color: Color(0xFF382E1E),
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Center(
                                  child: FeeBarItem(
                                      feePaid:
                                          feeDetailsAPI.feeDetails.year1FeePaid,
                                      year: '1st year'),
                                ),
                                Center(
                                  child: FeeBarItem(
                                      feePaid:
                                          feeDetailsAPI.feeDetails.year2FeePaid,
                                      year: '2nd year'),
                                ),
                                Center(
                                  child: FeeBarItem(
                                      feePaid:
                                          feeDetailsAPI.feeDetails.year3FeePaid,
                                      year: '3rd year'),
                                ),
                                Center(
                                  child: FeeBarItem(
                                      feePaid:
                                          feeDetailsAPI.feeDetails.year4FeePaid,
                                      year: '4th year'),
                                ),
                                const Spacer(),
                                Center(
                                  child: Text(
                                    'Total Due : ₹$dueAmount',
                                    style: const TextStyle(
                                      color: Color(0xFFCF0000),
                                      fontSize: 20,
                                      fontFamily: 'LibreFranklin-Regular',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return AlertDialog(
                    title: const Text('Check your internet connection'),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Ok')),
                    ],
                  );
                }
              });
        },
      ),
    );
  }
}
