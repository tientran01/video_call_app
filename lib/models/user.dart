class User {
  int age;
  String name;
  String firstName;
  String? lastName;
  String email;
  User({
    required this.age,
    required this.name,
    required this.firstName,
    this.lastName,
    required this.email,
  });
}
