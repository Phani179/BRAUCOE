class StudentCard {
  int? studentRegNo;

  String? studentName;

  String? phoneNo;

  int? admissionNo;

  get getStudentRegNo => studentRegNo;

  get getStudentName => studentName;

  get getPhoneNo => phoneNo;

  get getAdmissionNo => admissionNo;

  set setStudentName(String studentName) {
    this.studentName = studentName;
  }

  set setStudentRegNo(int studentRegNo) {
    this.studentRegNo = studentRegNo;
  }

  set setPhoneNo(String phoneNo) {
    this.phoneNo = phoneNo;
  }

  set setAdmissionNo(int admissionNo) {
    this.admissionNo = admissionNo;
  }

  StudentCard({
    required this.studentRegNo,
    required this.studentName,
    required this.phoneNo,
    required this.admissionNo,
  });

  factory StudentCard.fromJson(Map<String, Object> data) {
    return StudentCard(
      studentRegNo: data['studentRegNo'] as int,
      studentName: data['studentName'] as String,
      phoneNo: data['mobileNo'] as String,
      admissionNo: data['admissionNo'] as int,
    );
  }
}
