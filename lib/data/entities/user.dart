import 'package:changes_smol_gu/data/entities/petition.dart';

class User {
  final String name;
  final String phoneNumber;
  final String password;

  const User({
    required this.name,
    required this.phoneNumber,
    required this.password,
  });


  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json["name"],
      phoneNumber: json["phoneNumber"],
      password: json["password"],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phoneNumber": phoneNumber,
      "password": password,
    };
  }
}