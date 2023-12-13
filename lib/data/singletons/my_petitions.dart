import 'dart:core';
import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:flutter/foundation.dart';

class MyPetitions {
  MyPetitions._();
  static final MyPetitions _instance = MyPetitions._();
  static List<Petition> _myPetitionsList = [];


  static initMyPetitionsList(List<Petition> myPetitionsList) async {
    try {
      _myPetitionsList = myPetitionsList;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  static MyPetitions getInstance() {
    return _instance;
  }


  List<Petition> getList() {
    return [..._myPetitionsList];
  }
}