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
    await setIsDialogShow(false);
  }


  @override
  setIsDialogShow(bool value) async {
    SharedPreferences sherPref = await sharedPreferences;
    await sherPref.setBool('isDialogShow', value);
  }


  @override
  Future getIsDialogShow() async {
    SharedPreferences sherPref = await sharedPreferences;
    return sherPref.getBool('isDialogShow');
  }
}