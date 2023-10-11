import 'package:changes_smol_gu/core/models/favorites_model.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/catalog_page_widgets/catalog_item/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key});


  @override
  Widget build(BuildContext context) {

    if(context.watch<FavoritesModel>().getFavoritesList().isNotEmpty) {
      return Container(
        decoration: const BoxDecoration(
            color: Colors.black87
        ),
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: ListView.builder(
            itemCount: context.watch<FavoritesModel>().getFavoritesList().length,
            itemBuilder: (context, index) {
              if(index == context.watch<FavoritesModel>().getFavoritesList().length) {
                return const SizedBox(height: 40);
              } else {
                return Item(petition: context.watch<FavoritesModel>().getFavoritesList()[index]);
              }
            }
        ),
      );
    } else {
      return Container(
        decoration: const BoxDecoration(
            color:Colors.black87
        ),
        child: Container(
          alignment: Alignment.center,
          child: const Text(
              'Favoarites',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15
              )
          ),
        ),
      );
    }
  }
}