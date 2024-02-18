class ResultInfo
{
  String _papName = "NA";
  String _papGR = "NA";
  double _papGRP = 0.0;

  String get getPapName => _papName;
  String get getPapGR => _papGR;
  double get getPapGRP => _papGRP;


  set setPapName(String papName)
  {
    _papName = papName;
  }
  set setPapGR(String papGR)
  {
    _papGR = papGR;
  }
  set setPapGRP(double papGRP)
  {
    _papGRP = papGRP;
  }
}