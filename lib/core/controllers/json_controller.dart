import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:changes_smol_gu/data/get_data/from_server/get_data_from_json.dart';
import '../../data/entities/user.dart';


abstract class JsonControllerInterface {
  getAllPetitions();
  signIn(String phoneNumber, String password);
  signUp(String name, String phoneNumber, String password);
  getUserData();
  createPetition(Petition petition);
  addToFavorites(Petition petition);
  removeFromFavorites(Petition petition);
  addToMyVoices(Petition petition);
  removeFromMyVoices(Petition petition);
  removeFromMyPetitions(Petition petition);
}


class JsonController {
  final JsonControllerInterface _jsonControllerInterface = GetDataFromJson();


  Future<List<Petition>> getCatalogData() async {
    return _jsonControllerInterface.getAllPetitions();
  }


  Future<String?> userSignIn(String phoneNumber, String password) async {
    return _jsonControllerInterface.signIn(phoneNumber, password);
  }


  Future<String?> userSignUp(String name, String phoneNumber,
      String password) async {
    return _jsonControllerInterface.signUp(name, phoneNumber, password);
  }


  Future<User?> getUserDataFromServer() async {
    return _jsonControllerInterface.getUserData();
  }


  Future<bool> createPetition(Petition petition) async {
    return _jsonControllerInterface.createPetition(petition);
  }


  Future<bool> addPetitionToFavorites(Petition petition) async {
    return _jsonControllerInterface.addToFavorites(petition);
  }


  Future<bool> removePetitionFromFavorites(Petition petition) async {
    return _jsonControllerInterface.removeFromFavorites(petition);
  }


  Future <bool> addPetitionToMyVoices(Petition petition) async {
    return _jsonControllerInterface.addToMyVoices(petition);
  }


  Future<bool> removePetitionFromMyVoices(Petition petition) async {
    return _jsonControllerInterface.removeFromMyVoices(petition);
  }


  Future<bool> removePetitionFromMyPetitions(Petition petition) async {
    return _jsonControllerInterface.removeFromMyPetitions(petition);
  }
}