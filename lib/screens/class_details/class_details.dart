import 'package:flutter/material.dart';
import 'package:untitled/modal_classes/student_card.dart';
import 'package:untitled/providers/class_details_api.dart';

class ClassDetailsScreen extends StatefulWidget {
  static const String routeName = '/class-details';
  const ClassDetailsScreen({super.key});

  @override
  State<ClassDetailsScreen> createState() => _ClassDetailsScreenState();
}

class _ClassDetailsScreenState extends State<ClassDetailsScreen> {
  ClassDetailsAPI classDetailsAPI = ClassDetailsAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF382E1E),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Class Details',
          style: TextStyle(
            color: Color(0xFF382E1E),
            fontSize: 25,
            fontFamily: 'LibreFranklin-Regular',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: classDetailsAPI.getAllStudents(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    int length = classDetailsAPI.allStudentsList.length;
                    return ListView.builder(
                      itemCount: length,
                      itemBuilder: (ctx, index) {
                        StudentCard studentCard =
                            snapshot.data[index] as StudentCard;
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: const Color(0xFFEFE1D0),
                          margin: const EdgeInsets.only(
                              left: 10, bottom: 5, right: 10),
                          elevation: 2,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 80,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${index + 1}.',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'LibreFranklin-Regular',
                                    fontWeight: FontWeight.w500,
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
                                      Text(
                                        '${studentCard.getStudentName}',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'LibreFranklin-Regular',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 1,
                                      ),
                                      Text(
                                        'Registration no.: ${studentCard.getStudentRegNo}',
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'LibreFranklin-Regular',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 1,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Mobile no.: ${studentCard.getPhoneNo}',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontFamily:
                                                  'LibreFranklin-Regular',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            'Admission no.: ${studentCard.getAdmissionNo}',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontFamily:
                                                  'LibreFranklin-Regular',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const AlertDialog(
                      title: Text('Check once again'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
