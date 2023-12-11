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
  Future<List<Petition>> getAllPetitions() async {
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
  Future<User?> getUserData(String phoneNumber) async {
    String token = await SharedPreferencesController().getToken();
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
    }
  }

}