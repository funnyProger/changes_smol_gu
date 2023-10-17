import 'package:flutter/material.dart';

class MyPetitionPage extends StatelessWidget {
  const MyPetitionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.black87
        ),
        child: Container(
          alignment: Alignment.center,
          child: const Text(
              'My petitions',
              style: TextStyle(
                color: Colors.grey,
              )
          ),
        ),
      ),
    );
  }
}