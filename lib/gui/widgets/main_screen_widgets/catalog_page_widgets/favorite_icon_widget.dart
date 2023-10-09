import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';


class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({super.key});


  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: 40,
      isLiked: _isLiked,
      likeBuilder: (isLiked) {
        final color = isLiked ? Colors.black : Colors.grey;
        return Icon(
          Icons.favorite,
          size: 40,
          color: color,
        );
      },
      onTap: (isLiked) async {
        _isLiked = !_isLiked;
        return _isLiked;
      },
    );
  }
}