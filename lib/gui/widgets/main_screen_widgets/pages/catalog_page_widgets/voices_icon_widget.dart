import 'package:flutter/material.dart';

class VoicesIcon extends StatefulWidget {
  const VoicesIcon({super.key});


  @override
  State<VoicesIcon> createState() => VoicesIconState();
}

class VoicesIconState extends State<VoicesIcon> {


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
        child: const Text(
          'Голоса: 108',
          style: TextStyle(
            fontSize: 12,
            color: Colors.white
          )
        )
    );
  }
}