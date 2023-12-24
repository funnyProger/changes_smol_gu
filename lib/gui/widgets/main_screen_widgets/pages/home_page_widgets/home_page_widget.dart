import 'package:changes_smol_gu/core/models/current_home_page_model.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/catalog_page_widgets/catalog_page_widget.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/create_petition_page_widgets/create_petition_page_widget.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/profile_page_widgets/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../../../../core/models/internet_connection_model.dart';
import '../../../../../core/models/user_model.dart';
import '../../custom_appbar/custom_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  late final _listener;

  List<Widget> _homePagesList() {
    return [
      const CreatePetitionPage(),
      const CatalogPage(),
      const ProfilePage(),
    ];
  }


  final List<SalomonBottomBarItem> _tabs = [
    SalomonBottomBarItem(
        icon: const Icon(Icons.create),
        title: const Text("Create"),
    ),
    SalomonBottomBarItem(
        icon: const Icon(Icons.format_list_bulleted),
        title: const Text("Catalog"),
    ),
    SalomonBottomBarItem(
        icon: const Icon(Icons.account_circle_outlined),
        title: const Text("Profile"),
    ),
  ];


  @override
  void initState() {
    _listener = InternetConnection().onStatusChange.listen((InternetStatus status) {
      switch (status) {
        case InternetStatus.connected:
          context.read<InternetConnectionModel>().setInternetConnectionStatus(true);
          break;
        case InternetStatus.disconnected:
          context.read<InternetConnectionModel>().setInternetConnectionStatus(false);
          break;
      }
    });
    if(context.read<InternetConnectionModel>().getInternetConnectionStatus()) {
      context.read<UserModel>().updateMyPetitions();
      context.read<UserModel>().updateMyVoices();
      context.read<UserModel>().updateFavorites();
      context.read<UserModel>().updateUserData();
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: CustomAppbar(
          leading: Icons.home,
          title: 'SmolGU Change.org',
          ending: Icons.search,
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _homePagesList()[context.watch<CurrentHomePageModel>().getCurrentPageIndex()],
          getBottomNavBar()
        ],
      ),
    );
  }


  Widget getBottomNavBar() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 60, right: 60),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black
      ),
      child: SalomonBottomBar(
        currentIndex: context.watch<CurrentHomePageModel>().getCurrentPageIndex(),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        itemPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        onTap: (selectedIndex) => setState(() =>
        context.read<CurrentHomePageModel>().setCurrentPageIndex(selectedIndex)),
        items: _tabs,
      ),
    );
  }
}