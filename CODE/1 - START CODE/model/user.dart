enum UserRole { student, teacher }

class User {
  final int id;
  final String name;
  final UserRole role;
  final DateTime expirayionDate;

  User({required this.id, required this.name, required this.role, required this.expirayionDate});

  static User fromJSon(Map<String, dynamic> json) {
    UserRole role = UserRole.values.firstWhere((e) => e.name == json["role"]);
    return User(id: json["id"], name: json["name"], role: role, expirayionDate: DateTime(json["expirationDate"]));
  }

  @override
  String toString() {
    return "user = $name - role = ${role.name}";
  }
}
