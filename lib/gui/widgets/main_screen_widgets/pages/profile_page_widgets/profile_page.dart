import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
              'Profile',
              style: TextStyle(
                color: Colors.grey,
              )
          ),
        ),
      ),
    );
  }
}