class SemesterSyllabus
{
  List<Map<String, Object>> semester_1 = [
    {'subject' : 'Data Mining and Warehousing', 'isChecked' : false},
    {'subject' : 'Principles of Programming Language', 'isChecked' : false},
    {'subject' : 'Mobile Communications and Wireless Networks', 'isChecked' : false},
    {'subject' : 'Principles of Entreprenuership', 'isChecked' : false},
  ];

  List<Map<String, Object>> semester_2 = [
    {'subject' : 'Data Mining and Warehousing', 'isChecked' : false},
    {'subject' : 'Principles of Programming Language', 'isChecked' : false},
    {'subject' : 'Mobile Communications and Wireless Networks', 'isChecked' : false},
    {'subject' : 'Principles of Entreprenuership', 'isChecked' : false},
  ];

  List<Map<String, Object>> semester_3 = [
    {'subject' : 'Data Mining and Warehousing', 'isChecked' : false},
    {'subject' : 'Principles of Programming Language', 'isChecked' : false},
    {'subject' : 'Mobile Communications and Wireless Networks', 'isChecked' : false},
    {'subject' : 'Principles of Entreprenuership', 'isChecked' : false},
  ];

  List<Map<String, Object>> semester_4 = [
    {'subject' : 'Data Mining and Warehousing', 'isChecked' : false},
    {'subject' : 'Principles of Programming Language', 'isChecked' : false},
    {'subject' : 'Mobile Communications and Wireless Networks', 'isChecked' : false},
    {'subject' : 'Principles of Entreprenuership', 'isChecked' : false},
  ];

  List<Map<String, Object>> semester_5 = [
    {'subject' : 'Data Mining and Warehousing', 'isChecked' : false},
    {'subject' : 'Principles of Programming Language', 'isChecked' : false},
    {'subject' : 'Mobile Communications and Wireless Networks', 'isChecked' : false},
    {'subject' : 'Principles of Entreprenuership', 'isChecked' : false},
  ];

  List<Map<String, Object>> semester_6 = [
    {'subject' : 'Data Mining and Warehousing', 'isChecked' : false},
    {'subject' : 'Principles of Programming Language', 'isChecked' : false},
    {'subject' : 'Mobile Communications and Wireless Networks', 'isChecked' : false},
    {'subject' : 'Principles of Entreprenuership', 'isChecked' : false},
  ];

  List<Map<String, Object>> semester_7 = [
    {'subject' : 'Data Mining and Warehousing', 'isChecked' : false},
    {'subject' : 'Principles of Programming Language', 'isChecked' : false},
    {'subject' : 'Mobile Communications and Wireless Networks', 'isChecked' : false},
    {'subject' : 'Principles of Entreprenuership', 'isChecked' : false},
  ];

  List<Map<String, Object>> semester_8 = [
    {'subject' : 'Data Mining and Warehousing', 'isChecked' : false},
    {'subject' : 'Principles of Programming Language', 'isChecked' : false},
    {'subject' : 'Mobile Communications and Wireless Networks', 'isChecked' : false},
    {'subject' : 'Principles of Entreprenuership', 'isChecked' : false},
  ];

  Map<String, List<Map<String, Object>>> get semesters => {
    'semester_1' : semester_1,
    'semester_2' : semester_2,
    'semester_3' : semester_3,
    'semester_4' : semester_4,
    'semester_5' : semester_5,
    'semester_6' : semester_6,
    'semester_7' : semester_7,
    'semester_8' : semester_8,
  };

  String formattedSemesterName(String semesterName)
  {
    String formattedName;
    formattedName = semesterName.replaceFirst('_', ' - ');
    formattedName = formattedName.substring(0,1).toUpperCase() + formattedName.substring(1);
    return formattedName;
  }
}