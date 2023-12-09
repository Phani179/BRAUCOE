class SemesterSyllabus
{
  List<Map<String, Object>> semester_1 = [
    {'subject' : 'Engineering Chemistry', 'isChecked' : false},
    {'subject' : 'Engineering Graphics', 'isChecked' : false},
  ];

  List<Map<String, Object>> semester_2 = [
    {'subject' : 'Basic Electrical Engineering', 'isChecked' : false},
    {'subject' : 'Engineering Mathematics-2', 'isChecked' : false},
    {'subject' : 'Engineering Physics', 'isChecked' : false},
    {'subject' : 'Programming for Problem Solving', 'isChecked' : false},
  ];

  // Syllabus not avaialable.
  List<Map<String, Object>> semester_3 = [
    // {'subject' : 'Basic Electronic Engineering', 'isChecked' : false},
    {'subject' : 'Computer Organisation and Architecture', 'isChecked' : false},
    {'subject' : 'Data Structures and Algorithms', 'isChecked' : false},
    {'subject' : 'Discrete Mathematic Structures', 'isChecked' : false},
    {'subject' : 'Life Science for Engineering', 'isChecked' : false},
    {'subject' : 'Probability and Statistics', 'isChecked' : false},
  ];

  List<Map<String, Object>> semester_4 = [
    {'subject' : 'Database Management System', 'isChecked' : false},
    {'subject' : 'Objective Oriented Programming', 'isChecked' : false},
    {'subject' : 'Operating Systems', 'isChecked' : false},
    {'subject' : 'Software Engineering', 'isChecked' : false},
  ];

  List<Map<String, Object>> semester_5 = [
    {'subject' : 'Computer Graphics', 'isChecked' : false},
    {'subject' : 'Computer Networks', 'isChecked' : false},
    {'subject' : 'Design and Analysis of Algorithms', 'isChecked' : false},
    {'subject' : 'Formal Language and Autometa Theory', 'isChecked' : false},
    {'subject' : 'Machine Learning', 'isChecked' : false},
    {'subject' : 'Web Technologies', 'isChecked' : false},
  ];

  List<Map<String, Object>> semester_6 = [
    {'subject' : 'Artificial Intelligence', 'isChecked' : false},
    {'subject' : 'Compiler Design', 'isChecked' : false},
    {'subject' : 'Cryptography and Network Security', 'isChecked' : false},
    {'subject' : 'Data Analytics', 'isChecked' : false},
    {'subject' : 'Introduction to Python', 'isChecked' : false},
  ];

  List<Map<String, Object>> semester_7 = [
    {'subject' : 'Data Mining and Data Warehouse', 'isChecked' : false},
    {'subject' : 'Mobile Communication and Wireless Networks', 'isChecked' : false},
    {'subject' : 'Principles of Programming Languages', 'isChecked' : false},
    {'subject' : 'Principles of Entreprenuership', 'isChecked' : false},
  ];

  List<Map<String, Object>> semester_8 = [
    {'subject' : 'Application Development Using Java', 'isChecked' : false},
    {'subject' : 'Image Processing', 'isChecked' : false},
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