class Student
{
  var reg_no;
  var name;
  var password;

  void setReg_No(var regNo)
  {
    this.reg_no = regNo;
  }

  void setName(var name)
  {
    this.name = name;
  }

  void setPassword(var password)
  {
    this.password = password;
  }

  dynamic getReg_No()
  {
    return reg_no;
  }

  dynamic getName()
  {
    return name;
  }

  dynamic getPassword()
  {
    return password;
  }
}