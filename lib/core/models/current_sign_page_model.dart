import 'package:changes_smol_gu/constants/constants.dart';
import 'package:changes_smol_gu/gui/widgets/auth_screen_widgets/sign_in_screen_widgets/sign_in_page.dart';
import 'package:changes_smol_gu/gui/widgets/auth_screen_widgets/sign_success_widgets/sign_success_page.dart';
import 'package:changes_smol_gu/gui/widgets/auth_screen_widgets/sign_up_screen_widgets/sign_up_page.dart';
import 'package:flutter/cupertino.dart';

class CurrentSignPageModel extends ChangeNotifier {
  int _currentSignPageIndex = Constants.signInPage;


  final _signPagesList = {
    Constants.signInPage : const SignInPage(),
    Constants.signUpPage : const SignUpPage(),
    Constants.signSuccessPage : const SignSuccessPage()
  };


  void changeValue(int index) {
    _currentSignPageIndex = index;
    notifyListeners();
  }


  Widget? getCurrentSignPage() {
    return _signPagesList[_currentSignPageIndex];
  }
}