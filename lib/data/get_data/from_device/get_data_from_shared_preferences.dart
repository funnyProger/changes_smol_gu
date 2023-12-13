import 'package:changes_smol_gu/core/controllers/shared_preferences_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetDataFromSharedPreferences extends SharedPreferencesControllerInterface {
  SharedPreferences? _sharedPreferences;


  Future<SharedPreferences> get sharedPreferences async {
    if(_sharedPreferences != null) {
      return _sharedPreferences!;
    } else {
      _sharedPreferences = await SharedPreferences.getInstance();
      return _sharedPreferences!;
    }
  }


  @override
  init() async {
    await setIsUserLoggedIn(false);
  }


  @override
  setIsUserLoggedIn(bool value) async {
    SharedPreferences sherPref = await sharedPreferences;
    await sherPref.setBool('isUserLoggedIn', value);
  }


  @override
  Future getIsUserLoggedIn() async {
    SharedPreferences sherPref = await sharedPreferences;
    return sherPref.getBool('isUserLoggedIn');
  }


  @override
  setUserPhoneNumber(String phoneNumber) async {
    SharedPreferences sherPref = await sharedPreferences;
    await sherPref.setString('userPhoneNumber', phoneNumber);
  }


  @override
  Future getUserPhoneNumber() async {
    SharedPreferences sherPref = await sharedPreferences;
    /*return sherPref.getString('userPhoneNumber');*/
    return "nosferatu";
  }


  @override
  setToken(String token) async {
    SharedPreferences sherPref = await sharedPreferences;
    await sherPref.setString('token', token);
  }


  @override
  Future getToken() async {
    SharedPreferences sherPref = await sharedPreferences;
    return sherPref.getString('token');
  }

}