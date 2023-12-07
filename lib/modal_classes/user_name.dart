
class UserName
{
  String firstName;
  String lastName;
  String title;

  UserName({required this.firstName,required this.lastName, required this.title});

  factory UserName.fromMap(Map<String, dynamic> e)
  {
    return UserName(
        firstName : e['first'],
      lastName: e['last'],
      title: e['title']
    );
  }
}