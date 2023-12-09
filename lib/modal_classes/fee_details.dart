class FeeDetails {
  late int year1FeePaid;
  late int year2FeePaid;
  late int year3FeePaid;
  late int year4FeePaid;

  int get getYear1FeePaid => year1FeePaid;

  int get getYear2FeePaid => year2FeePaid;

  int get getYear3FeePaid => year3FeePaid;

  int get getYear4FeePaid => year4FeePaid;

  set setYear1FeePaid(int year1FeePaid) {
    this.year1FeePaid = year1FeePaid;
  }

  set setYear2FeePaid(int year1FeePaid) {
    this.year1FeePaid = year1FeePaid;
  }

  set setYear3FeePaid(int year1FeePaid) {
    this.year1FeePaid = year1FeePaid;
  }

  set setYear4FeePaid(int year1FeePaid) {
    this.year1FeePaid = year1FeePaid;
  }

  FeeDetails({
    required this.year1FeePaid,
    required this.year2FeePaid,
    required this.year3FeePaid,
    required this.year4FeePaid,
  });

  factory FeeDetails.fromJson(Map<String, dynamic> fromJson) {
    return FeeDetails(
      year1FeePaid: fromJson['year1']! as int,
      year2FeePaid: fromJson['year2']! as int,
      year3FeePaid: fromJson['year3']! as int,
      year4FeePaid: fromJson['year4']! as int,
    );
  }
}
