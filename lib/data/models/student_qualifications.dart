
class StudentQualifications
{
  dynamic _admissionNo;
  dynamic _sscHallTicketNo;
  dynamic _interMediateHallTicketNo;
  dynamic _eamcetHallTicketNo;
  dynamic _eamcetRank;

  get admissionNo => _admissionNo;
  get sscHallTicketNo => _sscHallTicketNo;
  get interMediateHallTicketNo => _interMediateHallTicketNo;
  get eamcetHallTicketNo => _eamcetHallTicketNo;
  get eamcetRank => _eamcetRank;

  set admissionNo(var value)
  {
    _admissionNo = value;
  }
  set sscHallTicketNo(var value)
  {
    _sscHallTicketNo = value;
  }
  set interMediateHallTicketNo(var value)
  {
    _interMediateHallTicketNo = value;
  }
  set eamcetHallTicketNo(var value)
  {
    _eamcetHallTicketNo = value;
  }
  set eamcetRank(var value)
  {
    _eamcetRank = value;
  }

  StudentQualifications(
      this._admissionNo,
      this._sscHallTicketNo,
      this._interMediateHallTicketNo,
      this._eamcetHallTicketNo,
      this._eamcetRank
      );

  factory StudentQualifications.fromMap(Map<String, dynamic> json)
  {
    return StudentQualifications(
        json["admissionNo"],
        json["sscHallTicketNo"],
        json["interHallTicketNo"],
        json["eamcetHallTicketNo"],
        json["eamcetRank"],
    );
  }
}