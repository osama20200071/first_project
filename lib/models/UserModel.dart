class User {
  int? id;
  String name;
  String email;
  String studentId;
  String password;
  String gender;
  String level;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.studentId,
    required this.password,
    required this.gender,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'studentId': studentId,
      'password': password,
      'gender': gender,
      'level': level,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email , studentId: $studentId, gender: $gender , level: $level}';
  }
}
