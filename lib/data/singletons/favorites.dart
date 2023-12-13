import 'dart:core';
import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:flutter/foundation.dart';

class Favorites {
  Favorites._();
  static final Favorites _instance = Favorites._();
  static List<Petition> _favoritesList = [];


  static initFavoritesList(List<Petition> favoriteList) async {
    try {
      _favoritesList = favoriteList;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  static Favorites getInstance() {
    return _instance;
  }


  List<Petition> getList() {
    return [..._favoritesList];
  }
}