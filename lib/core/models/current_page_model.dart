import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/create_petition_page_widgets/create_petition_page_widget.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/home_page_widgets/home_page_widget.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/my_petitions_page_widgets/my_petition_page_widget.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/profile_page_widgets/profile_page.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/settings_page_widgets/settings_page_widget.dart';
import 'package:flutter/cupertino.dart';

class CurrentPageModel extends ChangeNotifier {
  int _currentMenuPageIndex = 0;

  final List<Widget> _menuPagesList = [
    HomePage(),
    const ProfilePage(),
    const CreatePetitionPage(),
    const MyPetitionPage(),
    const SettingsPage(),
  ];


  Widget getCurrentPage() {
    return _menuPagesList[_currentMenuPageIndex];
  }


  void setCurrentPageIndex(int index) {
    if(_currentMenuPageIndex != index) {
      _currentMenuPageIndex = index;
      notifyListeners();
    }
  }
}