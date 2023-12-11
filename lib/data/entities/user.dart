import 'package:changes_smol_gu/data/entities/petition.dart';

class User {
  final String name;
  final String phoneNumber;
  final String password;
  final List<Petition> favorites;
  final List<Petition> myPetitions;


  const User({
    required this.name,
    required this.phoneNumber,
    required this.password,
    required this.favorites,
    required this.myPetitions,
  });


  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json["name"],
      phoneNumber: json["phoneNumber"],
      password: json["password"],
      favorites: List<Petition>.from(json["favorites"].map((jsonFavorites) =>
          Petition.fromJson(jsonFavorites))),
      myPetitions: List<Petition>.from(json["myPetitions"].map((jsonMyPetitions) =>
          Petition.fromJson(jsonMyPetitions))),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phoneNumber": phoneNumber,
      "password": password,
      "favorites": List<dynamic>.from(favorites.map((favorite) => favorite.toJson())),
      "myPetitions": List<dynamic>.from(myPetitions.map((myPetition) => myPetition.toJson())),
    };
  }
}