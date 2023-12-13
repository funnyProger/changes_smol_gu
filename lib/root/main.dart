import 'package:changes_smol_gu/core/controllers/shared_preferences_controller.dart';
import 'package:changes_smol_gu/core/models/current_sign_page_model.dart';
import 'package:changes_smol_gu/core/models/favorites_model.dart';
import 'package:changes_smol_gu/core/models/my_voices_model.dart';
import 'package:changes_smol_gu/core/models/user_model.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/home_page_widgets/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/models/my_petitions_model.dart';

void main() async {
  await initAllAppData();

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => FavoritesModel()),
          ChangeNotifierProvider(create: (context) => CurrentSignPageModel()),
          ChangeNotifierProvider(create: (context) => UserModel()),
          ChangeNotifierProvider(create: (context) => MyVoicesModel()),
          ChangeNotifierProvider(create: (context) => MyPetitionsModel()),
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
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins-Light'
      ),
    );
  }
}


initAllAppData() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesController().initSharedPreferences();
}

