import 'package:flutter/material.dart';
import 'package:braucoe/widgets/profile_items.dart';
import '../../providers/login_provider.dart';
import '../../utilities/customized_paint.dart';
import '../../widgets/profile_image_generator.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({super.key});

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: CustomPaint(
            painter: CustomizedPaint(),
            child: Container(
              margin: EdgeInsets.only(left: width * 0.02, right: width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.015,
                  ),
                  GestureDetector(
                    child: Icon(Icons.arrow_back, size: 23,),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.1,
                      ),
                      ProfileImageGenerator(radius: 70,),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width * 0.05, right: width * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.01,
                        ),

                        // Name.
                        Text(
                          "${LoginAPI.studentDetails?.student_name}",
                          style: const TextStyle(
                            fontFamily: "LibreFranklin-SemiBold",
                            color: Color(0xFF382E1E),
                            fontSize: 16,
                            decoration: TextDecoration.none,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),

                        // Registration no.
                        Text(
                          "Registration no : ${LoginAPI.studentDetails?.studentId}",
                          style: const TextStyle(
                            fontFamily: "LibreFranklin-Medium",
                            color: Color(0xFF382E1E),
                            fontSize: 15,
                            decoration: TextDecoration.none,
                          ),
                        ),

                        Center(
                          child: SizedBox(
                              width : width * 0.7,
                            child: Divider(thickness: 2,)),
                        ),

                        // Personal Details
                        const Text(
                          "Personal Details",
                          style: TextStyle(
                              fontFamily: "LibreFranklin-SemiBold",
                              fontSize: 20,
                              color: Color(0xFF00512D),
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFF00512D),
                              decorationStyle: TextDecorationStyle.solid
                          ),

                        ),
                        SizedBox(
                          height: height * 0.008,
                        ),

                        Container(
                          margin: EdgeInsets.only(left: width * 0.015, right: width * 0.015),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Father Name.
                              ProfileRecord(title: 'Father Name : ', data: '${LoginAPI.studentDetails?.father_name}'),

                              SizedBox(
                                height: height * 0.003,
                              ),

                              // Date of Birth.
                              ProfileRecord(title: 'Date of Birth(yy/mm/dd) : ', data: '${LoginAPI.personalInfo?.dateOfBirth}'),

                              SizedBox(
                                height: height * 0.003,
                              ),

                              // Category
                              ProfileRecord(title: 'Category : ', data: '${LoginAPI.personalInfo?.category}'),

                              SizedBox(
                                height: height * 0.003,
                              ),

                              // Gender
                              ProfileRecord(title: 'Gender : ', data: '${LoginAPI.studentDetails?.gender}'),

                              SizedBox(
                                height: height * 0.003,
                              ),

                              // Mobile Number
                              ProfileRecord(title: 'Mobile no. : ', data: '${LoginAPI.studentDetails?.mobile_no}'),

                              SizedBox(
                                height: height * 0.003,
                              ),

                              // Email Id
                              ProfileRecord(title: 'E-mail ID : ', data: '${LoginAPI.studentDetails?.emailId}'),

                              SizedBox(
                                height: height * 0.003,
                              ),

                              // Is Physical Handicap.
                              ProfileRecord(title: 'Is Physical Handicap. : ', data: '${LoginAPI.personalInfo?.isPhysicalHandicap}'),

                              SizedBox(
                                height: height * 0.003,
                              ),

                              // Address
                              ProfileRecord(title: 'Address : ', data: '${LoginAPI.personalInfo?.permanentAddress}'),

                              SizedBox(
                                height: height * 0.003,
                              ),

                              Center(
                                child: SizedBox(
                                    width : width * 0.7,
                                    child: Divider(thickness: 2,)),
                              ),

                              // SSC Hall Ticket No.
                              ProfileRecord(title: 'SSC Hall Ticket No. : ', data: '${LoginAPI.studentQualifications?.sscHallTicketNo}'),

                              SizedBox(
                                height: height * 0.003,
                              ),
                              //Intermediate Hall Ticket No.
                              ProfileRecord(title: 'Intermediate Hall Ticket No. : ', data: '${LoginAPI.studentQualifications?.interMediateHallTicketNo}'),

                              Center(
                                child: SizedBox(
                                    width : width * 0.7,
                                    child: Divider(thickness: 2,)),
                              ),
                            ],
                          ),
                        ),

                        const Text(
                          "EAMCET Details",
                          style: TextStyle(
                              fontFamily: "LibreFranklin-SemiBold",
                              fontSize: 20,
                              color: Color(0xFF00512D),
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFF00512D),
                              decorationStyle: TextDecorationStyle.solid
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: width * 0.015, right: width * 0.015),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height * 0.01,
                              ),

                              // EAMCET Hall Ticket  No.
                              ProfileRecord(title: 'EAMCET Hall Ticket  No. : ', data: '${LoginAPI.studentQualifications?.eamcetHallTicketNo}'),

                              SizedBox(
                                height: height * 0.003,
                              ),

                              // EAMCET Rank
                              ProfileRecord(title: 'EAMCET Rank : ', data: '${LoginAPI.studentQualifications?.eamcetRank}'),

                              Center(
                                child: SizedBox(
                                    width : width * 0.7,
                                    child: Divider(thickness: 2,)),
                              ),
                            ],
                          ),
                        ),

                        const Text(
                          "Academic Details",
                          style: TextStyle(
                              fontFamily: "LibreFranklin-SemiBold",
                              fontSize: 20,
                              color: Color(0xFF00512D),
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFF00512D),
                              decorationStyle: TextDecorationStyle.solid
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: width * 0.015, right: width * 0.015),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height * 0.01,
                              ),

                              //Admission No
                              ProfileRecord(title: 'Admission No. : ', data: '${LoginAPI.studentQualifications?.admissionNo}'),

                              SizedBox(
                                height: height * 0.003,
                              ),

                              // Date of Willingness.
                              ProfileRecord(title: 'Date of Willingness(yy/mm/dd) : ', data: '${LoginAPI.studentDetails?.dateOfWillingness}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

