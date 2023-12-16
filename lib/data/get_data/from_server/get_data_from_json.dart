import 'package:changes_smol_gu/core/controllers/json_controller.dart';
import 'package:changes_smol_gu/core/controllers/shared_preferences_controller.dart';
import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../entities/user.dart';


class GetDataFromJson implements JsonControllerInterface {


  @override
  Future<List<Petition>> getAllPetitions(String catalogMode) async {
    /*String token = await SharedPreferencesController().getToken();
    final response = await http.post(
        Uri.parse(''),
        headers: {
          "token": token
        },
        body: {
          "mode": catalogMode
        }

    );

    if(response.statusCode == 200) {
      final jsonData = json.decode(response.body) as List<dynamic>;
      return jsonData.map((element) => Petition.fromJson(element)).toList();
    } else {
      return [];
    }
   */

    try {
      final fileContent = await rootBundle.loadString('assets/petitions.json');
      final jsonData = json.decode(fileContent) as List<dynamic>;

      return jsonData.map((element) => Petition.fromJson(element)).toList();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }

  }


  @override
  Future<String?> signIn(String phoneNumber, String password) async {
    final response = await http.post(
      Uri.parse(''),
      body: {
        "phoneNumber": phoneNumber,
        "password": password,
      }
    );

    if(response.statusCode == 200) {
      return response.headers["token"];
    } else {
      return null;
    }
  }


  @override
  Future<String?> signUp(String name, String phoneNumber, String password) async {
    final response = await http.post(
        Uri.parse(''),
        body: {
          "name": name,
          "phoneNumber": phoneNumber,
          "password": password,
        }
    );

    if(response.statusCode == 200) {
      return response.headers["token"];
    } else {
      return null;
    }
  }


  @override
  Future<User?> getUserData() async {
    /*String token = await SharedPreferencesController().getToken();
    String phoneNumber = await SharedPreferencesController().getUserPhoneNumber();
    final response = await http.post(
        Uri.parse(''),
        headers: {
          "token": token
        },
        body: {
          "phoneNumber": phoneNumber,
        }
    );

    if(response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      return null;
    }*/

    return User(
      name: "general gaf",
      phoneNumber: "+79529969153",
      password: "fjdksl",
      favorites: [
        Petition(
          id: 1,
          owner: "karl",
          voices: 100,
          image: "https://i.pinimg.com/564x/f9/db/b6/f9dbb6b60467159e320bc3cc8474bcf0.jpg",
          title: "Privet",
          description: "Тут просто какое то описание..."
        ),
        Petition(
            id: 2,
            owner: "karl",
            voices: 131,
            image: "https://i.pinimg.com/564x/f9/db/b6/f9dbb6b60467159e320bc3cc8474bcf0.jpg",
            title: "Privet",
            description: "Тут просто какое то описание..."
        ),
        Petition(
            id: 3,
            owner: "karl",
            voices: 329,
            image: "https://i.pinimg.com/564x/f9/db/b6/f9dbb6b60467159e320bc3cc8474bcf0.jpg",
            title: "Privet",
            description: "Тут просто какое то описание..."
        ),
        Petition(
            id: 4,
            owner: "karl",
            voices: 723,
            image: "https://i.pinimg.com/564x/f9/db/b6/f9dbb6b60467159e320bc3cc8474bcf0.jpg",
            title: "Privet",
            description: "Тут просто какое то описание..."
        ),
      ],
      myPetitions: [
        Petition(
            id: 1,
            owner: "karl",
            voices: 78,
            image: "https://i.pinimg.com/564x/f9/db/b6/f9dbb6b60467159e320bc3cc8474bcf0.jpg",
            title: "Privet",
            description: "Тут просто какое то описание..."
        ),
      ],
      myVoices: [
        Petition(
            id: 1,
            owner: "karl",
            voices: 447,
            image: "https://i.pinimg.com/564x/f9/db/b6/f9dbb6b60467159e320bc3cc8474bcf0.jpg",
            title: "Privet",
            description: "Тут просто какое то описание..."
        ),
        Petition(
            id: 2,
            owner: "karl",
            voices: 200,
            image: "https://i.pinimg.com/564x/f9/db/b6/f9dbb6b60467159e320bc3cc8474bcf0.jpg",
            title: "Privet",
            description: "Тут просто какое то описание..."
        ),
        Petition(
            id: 3,
            owner: "karl",
            voices: 177,
            image: "https://i.pinimg.com/564x/f9/db/b6/f9dbb6b60467159e320bc3cc8474bcf0.jpg",
            title: "Privet",
            description: "Тут просто какое то описание..."
        ),
      ]
    );
  }


  @override
  Future<bool> createPetition(Petition petition) async {
    String token = await SharedPreferencesController().getToken();
    final response = await http.post(
        Uri.parse(''),
        headers: {
          "token": token
        },
        body: {
          "owner": petition.owner,
          "image": petition.image,
          "title": petition.title,
          "description": petition.description
        }
    );

    if(response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }


  @override
  Future<bool> addToFavorites(Petition petition) async {
    print('Добавление в избранные');
    /*String token = await SharedPreferencesController().getToken();
    String phoneNumber = await SharedPreferencesController().getUserPhoneNumber();
    final response = await http.post(
        Uri.parse(''),
        headers: {
          "token": token,
        },
        body: {
          "phoneNumber": phoneNumber,
          "id": petition.id
        }
    );

    if(response.statusCode == 200) {
      return true;
    } else {
      return false;
    }*/
    return true;
  }


  @override
  Future<bool> removeFromFavorites(Petition petition) async {
    print('Удаление из избранных');
    /*String token = await SharedPreferencesController().getToken();
    String phoneNumber = await SharedPreferencesController().getUserPhoneNumber();
    final response = await http.post(
        Uri.parse(''),
        headers: {
          "token": token,
        },
        body: {
          "phoneNumber": phoneNumber,
          "id": petition.id
        }
    );

    if(response.statusCode == 200) {
      return true;
    } else {
      return false;
    }*/
    return true;
  }


  @override
  Future<bool> addToMyVoices(Petition petition) async {
    print('Добавление в мои голоса');
    /*String token = await SharedPreferencesController().getToken();
    String phoneNumber = await SharedPreferencesController().getUserPhoneNumber();
    final response = await http.post(
        Uri.parse(''),
        headers: {
          "token": token,
        },
        body: {
          "phoneNumber": phoneNumber,
          "id": petition.id
        }
    );

    if(response.statusCode == 200) {
      return true;
    } else {
      return false;
    }*/
    return true;
  }


  @override
  Future<bool> removeFromMyVoices(Petition petition) async {
    print('Удаление из моих голосов');
    /*String token = await SharedPreferencesController().getToken();
    String phoneNumber = await SharedPreferencesController().getUserPhoneNumber();
    final response = await http.post(
        Uri.parse(''),
        headers: {
          "token": token,
        },
        body: {
          "phoneNumber": phoneNumber,
          "id": petition.id
        }
    );

    if(response.statusCode == 200) {
      return true;
    } else {
      return false;
    }*/
    return true;
  }


  @override
  Future<bool> removeFromMyPetitions(Petition petition) async {
    print('Удаление из моих петиций');
    /*String token = await SharedPreferencesController().getToken();
    String phoneNumber = await SharedPreferencesController().getUserPhoneNumber();
    final response = await http.post(
        Uri.parse(''),
        headers: {
          "token": token,
        },
        body: {
          "phoneNumber": phoneNumber,
          "id": petition.id
        }
    );

    if(response.statusCode == 200) {
      return true;
    } else {
      return false;
    }*/
    return true;
  }



}