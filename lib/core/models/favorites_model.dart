import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:changes_smol_gu/data/singletons/favorites.dart';
import 'package:flutter/foundation.dart';

class FavoritesModel extends ChangeNotifier {
  final Favorites _favoritesInstance = Favorites.getInstance();


  void favoritesDistributor(Petition petition) {
    if(isFavoritesContainsPetition(petition.id)) {
      removeFromFavorites(petition);
    } else {
      addToFavorites(petition);
    }
    notifyListeners();
  }


  void addToFavorites(Petition petition) {
    _favoritesInstance.add(petition);
    notifyListeners();
  }


  void removeFromFavorites(Petition petition) {
    _favoritesInstance.remove(petition.id);
    notifyListeners();
  }


  bool isFavoritesContainsPetition(int id) {
    bool isProductContains = false;
    List<Petition> favoritesList = getFavoritesList();
    if(favoritesList.isNotEmpty) {
      for(int i = 0; i < favoritesList.length; i++) {
        if(favoritesList[i].id == id) {
          isProductContains = true;
        }
      }
    }
    return isProductContains;
  }


  List<Petition> getFavoritesList() {
    return _favoritesInstance.getList();
  }
}