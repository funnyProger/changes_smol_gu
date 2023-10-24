import 'package:changes_smol_gu/core/controllers/shared_preferences_controller.dart';
import 'package:changes_smol_gu/core/models/catalog_model.dart';
import 'package:changes_smol_gu/core/models/current_drawer_page_model.dart';
import 'package:changes_smol_gu/core/models/current_sign_page_model.dart';
import 'package:changes_smol_gu/core/models/favorites_model.dart';
import 'package:changes_smol_gu/data/singletons/catalog.dart';
import 'package:changes_smol_gu/gui/widgets/auth_screen_widgets/sign_page_container.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/main_screen_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await initAllAppData();

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => FavoritesModel()),
          ChangeNotifierProvider(create: (context) => CatalogModel()),
          ChangeNotifierProvider(create: (context) => CurrentDrawerPageModel()),
          ChangeNotifierProvider(create: (context) => CurrentSignPageModel()),
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
      home: const SignInPageContainer(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder> {
        'mainScreenContainer': (BuildContext context) => const MainScreenContainer()
      },
      theme: ThemeData(
        fontFamily: 'Poppins-Light'
      ),
    );
  }
}


initAllAppData() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Catalog.initCatalogList();
  SharedPreferencesController().initSharedPreferences();
}

