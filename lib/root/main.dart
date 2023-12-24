import 'package:changes_smol_gu/core/controllers/shared_preferences_controller.dart';
import 'package:changes_smol_gu/core/models/current_home_page_model.dart';
import 'package:changes_smol_gu/core/models/current_sign_page_model.dart';
import 'package:changes_smol_gu/core/models/favorites_model.dart';
import 'package:changes_smol_gu/core/models/internet_connection_model.dart';
import 'package:changes_smol_gu/core/models/my_voices_model.dart';
import 'package:changes_smol_gu/core/models/user_model.dart';
import 'package:changes_smol_gu/gui/widgets/auth_screen_widgets/sign_page_container.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/home_page_widgets/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/models/my_petitions_model.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isUserLoggedIn = await SharedPreferencesController().getIsUserLoggedIn();

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => FavoritesModel()),
          ChangeNotifierProvider(create: (context) => CurrentSignPageModel()),
          ChangeNotifierProvider(create: (context) => UserModel()),
          ChangeNotifierProvider(create: (context) => MyVoicesModel()),
          ChangeNotifierProvider(create: (context) => MyPetitionsModel()),
          ChangeNotifierProvider(create: (context) => CurrentHomePageModel()),
          ChangeNotifierProvider(create: (context) => InternetConnectionModel()),
        ],
        child: Application(isUserLoggedIn: isUserLoggedIn),
      )
  );
}

class Application extends StatelessWidget {
  const Application({super.key, required this.isUserLoggedIn});
  final bool isUserLoggedIn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isUserLoggedIn ? const HomePage() : const SignPageContainer(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins-Light'
      ),
    );
  }
}

