import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:flutter/material.dart';


class VoicesIcon extends StatelessWidget {
  const VoicesIcon({super.key, required this.petition});
  final Petition petition;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        padding: const EdgeInsets.only(right: 5, left: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(150),
          border: Border.all(
              color: Colors.black
          ),
        ),
        child: Text(
          'Голоса: ${petition.voices.toString()}',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white
          )
        )
    );
  }
}