import 'dart:core';
import 'package:changes_smol_gu/data/entities/petition.dart';

class Favorites {
  Favorites._();
  static final Favorites _instance = Favorites._();
  static final List<Petition> _favoritesList = [];



  static Favorites getInstance() {
    return _instance;
  }


  void add(Petition petition) {
    _favoritesList.add(petition);
    for(int i = 0; i < _favoritesList.length; i++) {
      print('  {');
      print('     ${_favoritesList[i].id}');
      print('     ${_favoritesList[i].title}');
      print('     ${_favoritesList[i].image}');
      print('  }');
    }
  }


  void remove(int id) {
    for(int i = 0; i < _favoritesList.length; i++) {
      if(_favoritesList[i].id == id) {
        _favoritesList.remove(_favoritesList[i]);
      }
    }
    for(int i = 0; i < _favoritesList.length; i++) {
      print('  {');
      print('     ${_favoritesList[i].id}');
      print('     ${_favoritesList[i].title}');
      print('     ${_favoritesList[i].image}');
      print('  }');
    }
  }


  List<Petition> getList() {
    return [..._favoritesList];
  }
}