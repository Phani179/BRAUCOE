import 'package:flutter/material.dart';

class FeeInfoScreen extends StatelessWidget {
  const FeeInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
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
                    icon: Icon(Icons.arrow_back)),
                Image.asset('assets/images/fee_details.png'),
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Fee Structure',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'LibreFranklin-Regular'),
                    ),
                    SizedBox(
                        width: width * 0.7,
                        child: const Text(
                          'The probable expenditure to be incurred by the student during the course of B.Tech is below.',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'LibreFranklin-Regular'),
                        )),
                    const SizedBox(
                      height: 50,
                    ),
                    const Center(
                      child: Text(
                        'Fees Particulars',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'LibreFranklin-Regular',
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: SizedBox(
                        width: width * 0.75,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '1. 1st year Tuition Fees',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF382E1E),
                                              fontFamily:
                                                  'LibreFranklin-Regular'),
                                        ),
                                        Text(
                                          '2. 1st year Admission Fees',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF382E1E),
                                              fontFamily:
                                                  'LibreFranklin-Regular'),
                                        ),
                                        Text(
                                          '3. 2nd year Tuition Fees',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF382E1E),
                                              fontFamily:
                                                  'LibreFranklin-Regular'),
                                        ),
                                        Text(
                                          '4. 3rd year Tuition Fees',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF382E1E),
                                              fontFamily:
                                                  'LibreFranklin-Regular'),
                                        ),
                                        Text(
                                          '5. 4th year Tuition Fees',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF382E1E),
                                              fontFamily:
                                                  'LibreFranklin-Regular'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Total Fees',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF382E1E),
                                          fontFamily: 'LibreFranklin-Regular'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                for (int i = 0; i < 6; i++) const Text(':', style: TextStyle(
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF382E1E),
                                    fontFamily: 'LibreFranklin-Regular'),)
                              ],
                            ),
                            Column(
                              children: [
                                for (int i = 0; i < 6; i++)
                                  i == 5
                                      ? const Text(
                                          'Rs.',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF382E1E),
                                        fontFamily: 'LibreFranklin-Regular'),
                                        )
                                      : const Text('Rs.', style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF382E1E),
                                      fontFamily: 'LibreFranklin-Regular'),)
                              ],
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('35,000/-', style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF382E1E),
                                    fontFamily: 'LibreFranklin-Regular'),),
                                Text('3,500/-', style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF382E1E),
                                    fontFamily: 'LibreFranklin-Regular'),),
                                Text('35,000/-', style: TextStyle(
                                    color: Color(0xFF382E1E),
                                    fontSize: 15,
                                    fontFamily: 'LibreFranklin-Regular'),),
                                Text('35,000/-', style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF382E1E),
                                    fontFamily: 'LibreFranklin-Regular'),),
                                Text('35,000/-', style: TextStyle(
                                  fontSize: 15,
                                    color: Color(0xFF382E1E),
                                    fontFamily: 'LibreFranklin-Regular'),),
                                Text(
                                  '1,43,500/-',
                                  style: TextStyle(
                                      color: Color(0xFF382E1E),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'LibreFranklin-Regular'),
                                ),
                              ],
                            ),
                          ],
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
      ),
    );
  }
}
