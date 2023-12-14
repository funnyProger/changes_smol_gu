import 'package:changes_smol_gu/core/controllers/json_controller.dart';
import 'package:changes_smol_gu/data/singletons/my_petitions.dart';
import 'package:changes_smol_gu/data/singletons/my_voices.dart';
import 'package:flutter/foundation.dart';

import '../../data/entities/user.dart';
import '../../data/singletons/favorites.dart';

class UserModel extends ChangeNotifier {
  User _currentUserData = User(
    name: '',
    phoneNumber: '',
    password: '',
    favorites: [],
    myPetitions: [],
    myVoices: [],
  );


  Future updateUserData() async {
    try {
      _currentUserData = (await JsonController().getUserDataFromServer())!;
      Favorites.initFavoritesList(_currentUserData.favorites);
      MyVoices.initMyVoicesList(_currentUserData.myVoices);
      MyPetitions.initMyPetitionsList(_currentUserData.myPetitions);
      print('обновление данных пользователя');
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