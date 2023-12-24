import 'package:changes_smol_gu/core/controllers/shared_preferences_controller.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/favorite_page_widgets/favorite_page_widget.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/my_petitions_page_widgets/my_petition_page_widget.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/my_voices_page_widges/my_voices_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:provider/provider.dart';
import '../../../../../core/models/internet_connection_model.dart';
import '../../../../../core/models/user_model.dart';
import '../../../../../data/entities/user.dart';
import '../../../auth_screen_widgets/sign_page_container.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageWidgetState();
}


class _ProfilePageWidgetState extends State<ProfilePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);


  List<Widget> _getTabItemList(BuildContext context) {
    return [
      const FavoritePage(),
      MyPetitionsPage(),
      const MyVoicesPage(),
    ];
  }


  @override
  void initState() {
    context.read<UserModel>().updateUserData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: userInfo(context.watch<UserModel>().getCurrentUserData()),
        ),
        context.watch<InternetConnectionModel>().getInternetConnectionStatus()
        ? Expanded(
          flex: 88,
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.black87,
                  ),
                  padding: const EdgeInsets.only(),
                  child: FlutterToggleTab(
                    width: 90, // width in percent
                    borderRadius: 30,
                    height: 40,
                    selectedIndex: _selectedIndex,
                    selectedBackgroundColors: const [Colors.white],
                    unSelectedBackgroundColors: const [Colors.white12],
                    selectedTextStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    unSelectedTextStyle: const TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                    labels: const [
                      'Favorites',
                      'My Petitions',
                      'My Voices',
                    ],
                    selectedLabelIndex: (index) {
                      setState(() {
                        _selectedIndex = index;
                        _pageController.animateToPage(
                            index,
                            duration: const Duration(microseconds: 400),
                            curve: Curves.linear
                        );
                      });
                    },
                  )
              ),
            ),
              Expanded(
                  flex: 80,
                  child: getProfilePages(context)
              ),
            ],
          ),
        ) :
            Expanded(
              flex: 88,
              child: context.read<InternetConnectionModel>().getInternetErrorWidget(),
            )
      ],
    );
  }


  Widget getProfilePages(BuildContext context) {
    if(context.watch<UserModel>().getCurrentUserData().phoneNumber != '') {
      return PageView(
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            _selectedIndex = newIndex;
          });
        },
        children: _getTabItemList(context),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      );
    }
  }


  Widget userInfo(User currentUserData) {
    return Container(
      height: 80,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Colors.black87
      ),
      child: Row(
        children: [
          Expanded(
            flex: 13,
            child: Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 25,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                        currentUserData.name[0],
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 20
                        )
                    )
                ),
              ),
            ),
          ),
          Expanded(
            flex: 40,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Name: ${currentUserData.name}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        'Phone number: ${currentUserData.phoneNumber}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () async {
                  SharedPreferencesController().setIsUserLoggedIn(false);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const SignPageContainer())
                  );
                },
                borderRadius: BorderRadius.circular(100),
                splashColor: Colors.white,
                child: const Icon(
                  Icons.exit_to_app,
                  size: 30,
                  color: Colors.white,
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}