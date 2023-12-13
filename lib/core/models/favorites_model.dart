import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:changes_smol_gu/data/singletons/favorites.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/favorite_page_widgets/favorite_item.dart';
import 'package:flutter/material.dart';

class FavoritesModel extends ChangeNotifier {
  final Favorites _favoritesInstance = Favorites.getInstance();


  bool isFavoritesContainsPetition(int id) {
    bool isPetitionContains = false;
    List<Petition> favoritesList = _favoritesInstance.getList();
    if(favoritesList.isNotEmpty) {
      for(int i = 0; i < favoritesList.length; i++) {
        if(favoritesList[i].id == id) {
          isPetitionContains = true;
        }
      }
    }
    return isPetitionContains;
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