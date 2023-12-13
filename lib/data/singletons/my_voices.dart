import 'dart:core';
import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:flutter/foundation.dart';

class MyVoices {
  MyVoices._();
  static final MyVoices _instance = MyVoices._();
  static List<Petition> _myVoicesList = [];


  static initMyVoicesList(List<Petition> myVoicesList) async {
    try {
      _myVoicesList = myVoicesList;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  static MyVoices getInstance() {
    return _instance;
  }


  List<Petition> getList() {
    return [..._myVoicesList];
  }
}