import 'package:changes_smol_gu/core/models/favorites_model.dart';
import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';


class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({super.key, required this.petition});
  final Petition petition;


  @override
  State<FavoriteIcon> createState() => _FavoriteIconState(petition: petition);
}


class _FavoriteIconState extends State<FavoriteIcon> {
  _FavoriteIconState({required this.petition});
  final Petition petition;

  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    print('отрисовался нужный выджет ${petition.id}');

    return Container(
        height: 38,
        width: 38,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(150),
          border: Border.all(
              color: Colors.black
          ),
        ),
        child: LikeButton(
          isLiked: context.watch<FavoritesModel>().isFavoritesContainsPetition(petition.id),
          circleSize: 30,
          animationDuration: const Duration(milliseconds: 600),
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          bubblesColor: const BubblesColor(
            dotPrimaryColor: Colors.red,
            dotSecondaryColor: Colors.redAccent
          ),
          likeBuilder: (isLiked) {
            final color = isLiked ? Colors.red : Colors.white70;
            return Padding(
              padding: const EdgeInsets.only(left: 3, top: 2),
              child: Icon(
                Icons.favorite,
                size: 27,
                color: color,
              ),
            );
          },
          onTap: (isLiked) async {
            context.read<FavoritesModel>().favoritesDistributor(petition);
            return !isLiked;
          },
        )
    );
  }
}