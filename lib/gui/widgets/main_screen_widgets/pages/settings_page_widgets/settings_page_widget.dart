import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
              'Settings',
              style: TextStyle(
                color: Colors.grey,
              )
          ),
        ),
      ),
    );
  }
}