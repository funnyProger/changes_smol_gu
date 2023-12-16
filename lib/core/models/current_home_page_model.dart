import 'package:flutter/foundation.dart';

class CurrentHomePageModel extends ChangeNotifier {
  int _currentPageIndex = 1;


  void setCurrentPageIndex(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }


  int getCurrentPageIndex() {
    return _currentPageIndex;
  }
}