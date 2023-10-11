import 'package:changes_smol_gu/core/models/favorites_model.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/main_screen_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => FavoritesModel())
        ],
        child: const Application(),
      )
  );
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

