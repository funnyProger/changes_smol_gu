
import 'package:flutter/material.dart';

class InternetConnectionModel extends ChangeNotifier {
  bool _isInternetConnected = true;


  setInternetConnectionStatus(bool isInternetConnected) {
    _isInternetConnected = isInternetConnected;
    notifyListeners();
  }


  bool getInternetConnectionStatus() {
    return _isInternetConnected;
  }


  Widget getInternetErrorWidget() {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.black87,
      ),
      child: const Text(
        'Ошибка подключения \nк интернету  :(',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15,
        )
      ),
    );
  }
}