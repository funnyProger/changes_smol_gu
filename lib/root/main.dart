import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/main_screen_container.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreenContainer(),
      debugShowCheckedModeBanner: false
    );
  }
}

