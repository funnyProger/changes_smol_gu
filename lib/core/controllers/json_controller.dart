import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:changes_smol_gu/data/get_data/from_server/get_data_from_json.dart';

import '../../data/entities/user.dart';

abstract class JsonControllerInterface {
  getAllPetitions();
  signIn(String phoneNumber, String password);
  signUp(String name, String phoneNumber, String password);
  getUserData(String phoneNumber);
}


class JsonController {
  final JsonControllerInterface _jsonControllerInterface = GetDataFromJson();


  Future<List<Petition>> getCatalogData() async {
    return _jsonControllerInterface.getAllPetitions();
  }

  Future<String?> userSignIn(String phoneNumber, String password) async {
    return _jsonControllerInterface.signIn(phoneNumber, password);
  }

  Future<String?> userSignUp(String name, String phoneNumber, String password) async {
    return _jsonControllerInterface.signUp(name, phoneNumber, password);
  }

  Future<User?> getUserDataFromServer(String phoneNumber) async {
    return _jsonControllerInterface.getUserData(phoneNumber);
  }


}