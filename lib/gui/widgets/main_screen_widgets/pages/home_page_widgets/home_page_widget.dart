import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/catalog_page_widgets/catalog_page_widget.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/favorite_page_widgets/favorite_page_widget.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/search_page_widgets/search_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final PersistentTabController _controller = PersistentTabController(initialIndex: 1);


  List<Widget> _homePagesList() {
    return [
      const SearchPage(),
      const CatalogPage(),
      const FavoritePage(),
    ];
  }


  List<PersistentBottomNavBarItem> _itemsList() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: ('Search'),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.format_list_bulleted_rounded),
        title: ('Catalog'),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        title: ('Favorites'),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      )
    ];
  }


  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      margin: const EdgeInsets.only(left: 50, bottom: 15, right: 50),
      controller: _controller,
      screens: _homePagesList(),
      items: _itemsList(),
      confineInSafeArea: true,
      backgroundColor: Colors.black54,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: Colors.black54
        ),
        colorBehindNavBar: Colors.black87,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.fastEaseInToSlowEaseOut,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1,
    );
  }
}