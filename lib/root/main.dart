import 'package:changes_smol_gu/core/controllers/shared_preferences_controller.dart';
import 'package:changes_smol_gu/core/models/catalog_model.dart';
import 'package:changes_smol_gu/core/models/favorites_model.dart';
import 'package:changes_smol_gu/data/singletons/catalog.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/main_screen_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await initAllData();

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => FavoritesModel()),
          ChangeNotifierProvider(create: (context) => CatalogModel()),
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

initAllData() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Catalog.initCatalogList();
  SharedPreferencesController().initSharedPreferences();
}

