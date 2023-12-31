import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/buttons/favorite_icon_widget.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/catalog_page_widgets/voices_icon_widget.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key, required this.petition});
  final Petition petition;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 6, right: 6, top: 6),
      decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)
          )
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: AspectRatio(
                  aspectRatio: 16 / 16,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      petition.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 20,
                top: 20,
                child: FavoriteIcon(petition: petition)
              ),
              Positioned(
                left: 20,
                top: 20,
                child: VoicesIcon(petition: petition),
              )
            ]
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 10, top: 15, bottom: 5),
            child: const Text(
              'Назавние: ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15
              ),
              textDirection: TextDirection.ltr,
              softWrap: true,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              petition.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20
              ),
              textDirection: TextDirection.ltr,
              softWrap: true,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 10, top: 10, bottom: 5),
            child: const Text(
              'Описание: ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15
              ),
              textDirection: TextDirection.ltr,
              softWrap: true,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
            child: Text(
              '${petition.description}\n\n\n\n\n',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13
              ),
              textDirection: TextDirection.ltr,
              softWrap: true,
            ),
          )
        ],
      ),
    );
  }
}