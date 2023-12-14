import 'package:changes_smol_gu/data/get_data/from_device/get_data_from_shared_preferences.dart';

abstract class SharedPreferencesControllerInterface {
  setIsUserLoggedIn(bool value);
  getIsUserLoggedIn();
  setUserPhoneNumber(String phoneNumber);
  getUserPhoneNumber();
  setToken(String token);
  getToken();
}


class SharedPreferencesController {
  final SharedPreferencesControllerInterface _controller = GetDataFromSharedPreferences();


  void setIsUserLoggedIn(bool value) {
    _controller.setIsUserLoggedIn(value);
  }


  Future getIsUserLoggedIn() async {
    return _controller.getIsUserLoggedIn();
  }


  void setUserPhoneNumber(String phoneNumber) {
    _controller.setUserPhoneNumber(phoneNumber);
  }


  Future getUserPhoneNumber() async {
    return _controller.getUserPhoneNumber();
  }


  void setToken(String token) {
    _controller.setToken(token);
  }


  Future getToken() async {
    return _controller.getToken();
  }
}