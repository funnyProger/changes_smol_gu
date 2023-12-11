import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:changes_smol_gu/data/singletons/favorites.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/favorite_page_widgets/favorite_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
    List<Petition> favoritesList = _favoritesInstance.getList();
    if(favoritesList.isNotEmpty) {
      for(int i = 0; i < favoritesList.length; i++) {
        if(favoritesList[i].id == id) {
          isProductContains = true;
        }
      }
    }
    return isProductContains;
  }


  List<Widget> getFavoritesList() {
    List<Widget> widgets = [];
    List<Petition> favoritesList = _favoritesInstance.getList();

    for(int i = 0; i < favoritesList.length; i++) {
      widgets.add(FavoriteItemWidget(petition: favoritesList[i]));
      if(i == favoritesList.length - 1) {
        widgets.add(
          const SizedBox(
            height: 70,
          )
        );
      }
    }

    return widgets;
  }
}