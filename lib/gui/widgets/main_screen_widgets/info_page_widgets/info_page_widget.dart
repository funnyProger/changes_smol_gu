import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key, required this.petition});
  final Petition petition;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
        )
      ),
      child: Column(
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
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
            child: Text(
              petition.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30
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
                  fontSize: 17
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