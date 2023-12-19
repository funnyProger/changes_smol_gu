import 'package:changes_smol_gu/core/controllers/json_controller.dart';
import 'package:changes_smol_gu/data/singletons/my_petitions.dart';
import 'package:changes_smol_gu/data/singletons/my_voices.dart';
import 'package:flutter/foundation.dart';
import '../../data/entities/user.dart';
import '../../data/singletons/favorites.dart';


class UserModel extends ChangeNotifier {
  User _currentUserData = const User(
    name: '',
    phoneNumber: '',
    password: '',
  );


  Future updateUserData() async {
    try {
      _currentUserData = (await JsonController().getUserDataFromServer())!;
      print('обновление данных пользователя');
      notifyListeners();
    } catch(e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  Future updateFavorites() async {
    try {
      Favorites.initFavoritesList(await JsonController().getUserFavoritesData());
      print('обновление избранных');
      notifyListeners();
    } catch(e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  Future updateMyPetitions() async {
    try {
      MyPetitions.initMyPetitionsList(await JsonController().getUserPetitionData());
      notifyListeners();
      print('обновление мои петиций');
      notifyListeners();
    } catch(e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  Future updateMyVoices() async {
    try {
      MyVoices.initMyVoicesList(await JsonController().getUserVoicesData());
      notifyListeners();
      print('обновление мои голоса');
      notifyListeners();
    } catch(e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  User getCurrentUserData() {
    return _currentUserData;
  }
}