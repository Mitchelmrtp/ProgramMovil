import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String user;
  String password;

  User({
    required this.user,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        user: json["user"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "password": password,
      };

  @override
  String toString() {
    return 'User -> user: ${this.user}, password: ${this.password}';
  }
}
