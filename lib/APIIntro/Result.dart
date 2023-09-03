
class Result
{
  var name;
  var reg_no;
  var branch;
  String subject;
  var GPA;
  getSubject()
  {
    return subject;
  }
  getGPA()
  {
    return GPA;
  }
  getName()
  {
    return name;
  }
  getRegNo()
  {
    return reg_no;
  }
  getBranch()
  {
    return branch;
  }
  void setName(var name)
  {
    this.name = name;
  }
  void setRegNo(var reg_no)
  {
    this.reg_no = reg_no;
  }
  void setBranch(var branch)
  {
    this.branch = branch;
  }
  void setSubject(String subject)
  {
    this.subject = subject;
  }
  void setGPA(var GPA)
  {
    this.GPA = GPA;
  }
  Result(this.name,  this.reg_no, this.branch, this.subject, this.GPA);
}