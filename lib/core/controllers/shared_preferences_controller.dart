import 'package:changes_smol_gu/data/get_data/from_device/get_data_from_shared_preferences.dart';

abstract class SharedPreferencesControllerInterface {
  setIsDialogShow(bool value);
  getIsDialogShow();
  init();
}


class SharedPreferencesController {
  final SharedPreferencesControllerInterface _controller = GetDataFromSharedPreferences();


  void setIsDialogShow(bool value) {
    _controller.setIsDialogShow(value);
  }


  Future getIsDialogShow() async {
    return _controller.getIsDialogShow();
  }


  void initSharedPreferences() {
    _controller.init();
  }
}