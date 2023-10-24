import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/catalog_page_widgets/catalog_page_widget.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/favorite_page_widgets/favorite_page_widget.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/search_page_widgets/search_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;


  List<Widget> _homePagesList() {
    return [
      const SearchPage(),
      const CatalogPage(),
      const FavoritePage(),
    ];
  }


  final List<SalomonBottomBarItem> _tabs = [
    SalomonBottomBarItem(
        icon: const Icon(Icons.search),
        title: const Text("Search"),
    ),
    SalomonBottomBarItem(
        icon: const Icon(Icons.format_list_bulleted),
        title: const Text("Catalog"),
    ),
    SalomonBottomBarItem(
        icon: const Icon(Icons.favorite),
        title: const Text("Favorites"),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _homePagesList()[_currentIndex],
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
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        itemPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        onTap: (selectedIndex) => setState(() => _currentIndex = selectedIndex),
        items: _tabs,
      ),
    );
  }
}