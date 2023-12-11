import 'package:flutter/material.dart';

class MyPetitionPage extends StatelessWidget {
  const MyPetitionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black12
      ),
      child: Container(
        padding: const EdgeInsets.only(bottom: 100),
        alignment: Alignment.center,
        child: const Text(
            'My petitions',
            style: TextStyle(
              color: Colors.grey,
            )
        ),
      ),
    );
  }
}