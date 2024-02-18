
class StudentPersonalInfo
{
  late String _dateOfBirth;
  late String _category;
  late String _feeReimbursementStatus;
  late String _isPhysicalHandicap;
  late String _permanentAddress;
  late dynamic _passportSizePhoto;
  late String? _password;

  StudentPersonalInfo();
  String get permanentAddress => _permanentAddress;

  set permanentAddress(String value) {
    _permanentAddress = value;
  }

  String get dateOfBirth => _dateOfBirth;

  String? get password => _password;

  String get isPhysicalHandicap => _isPhysicalHandicap;

  String get category => _category;

  dynamic get passportSizePhoto => _passportSizePhoto;

  String get feeReimbursementStatus => _feeReimbursementStatus;

  set feeReimbursementStatus(String value) {
    _feeReimbursementStatus = value;
  }

  set passportSizePhoto(dynamic value) {
    _passportSizePhoto = value;
  }

  set category(String value) {
    _category = value;
  }

  set isPhysicalHandicap(String value) {
    _isPhysicalHandicap = value;
  }

  set password(String? value) {
    _password = value;
  }

  set dateOfBirth(String value) {
    _dateOfBirth = value;
  }

  StudentPersonalInfo.properties(
      this._dateOfBirth,
      this._category,
      this._feeReimbursementStatus,
      this._isPhysicalHandicap,
      this._permanentAddress,
      this._passportSizePhoto,
      this._password
      );

  factory StudentPersonalInfo.fromMap(Map<String, dynamic> json)
  {
    return StudentPersonalInfo.properties(
        json["dateOfBirth"],
        json["category"],
        json["feeReimbursementStatus"],
        json["isPhysicalHandicap"],
        json["permanentAddress"],
        json["passportSizePhoto"],
        json["password"]
    );
  }

}