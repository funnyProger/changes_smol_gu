import 'package:changes_smol_gu/core/models/favorites_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});


  @override
  Widget build(BuildContext context) {

    if(context.watch<FavoritesModel>().getFavoritesList().isNotEmpty) {
      return Container(
        decoration: const BoxDecoration(
            color: Colors.black12
        ),
        padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
            ),
            child: SingleChildScrollView(
              child: Column(
                children: context.watch<FavoritesModel>()
                    .getFavoritesList(),
              ),
            )
        )
      );
    } else {
      return Container(
        decoration: const BoxDecoration(
            color:Colors.black12
        ),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(bottom: 100),
          child: const Text(
              'Favoarites',
              style: TextStyle(
                  color: Colors.grey,
              )
          ),
        ),
      );
    }
  }



}