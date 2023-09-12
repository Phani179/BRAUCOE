class Student
{
  var reg_no;
  var name;
  var password;

  void setReg_No(var reg_no)
  {
    this.reg_no = reg_no;
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