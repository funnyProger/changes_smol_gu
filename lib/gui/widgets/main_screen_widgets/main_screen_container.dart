import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/catalog_page_widgets/catalog_widget.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/favorite_page_widgets/favorite_widget.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/search_page_widgets/search_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter/material.dart';
import 'custom_appbar/custom_appbar.dart';


class MainScreenContainer extends StatelessWidget {
  MainScreenContainer({super.key});
  final PersistentTabController _controller = PersistentTabController(initialIndex: 2);


  List<Widget> _screensList() {
    return [
      Container(
        decoration: const BoxDecoration(
            color:Colors.black87
        ),
        child: Container(
          alignment: Alignment.center,
          child: const Text(
              'Create petition',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15
              )
          ),
        ),
      ),
      const SearchPage(),
      const CatalogList(),
      const FavoriteList(),
      Container(
        decoration: const BoxDecoration(
            color:Colors.black87
        ),
        child: Container(
          alignment: Alignment.center,
          child: const Text(
              'Profile',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15
              )
          ),
        ),
      ),
    ];
  }


  List<PersistentBottomNavBarItem> _itemsList() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.create),
        title: ('Create'),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
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
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.account_circle_outlined),
        title: ('Profile'),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black87
      ),
      child: Stack(
        children: [
          PersistentTabView(
            context,
            margin: const EdgeInsets.only(left: 13, bottom: 15, right: 13),
            controller: _controller,
            screens: _screensList(),
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
              colorBehindNavBar: Colors.white12,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style1,
          ),
          Container(
            height: 100,
            alignment: Alignment.center,
            child: const PreferredSize(
              preferredSize: Size.fromHeight(50.0), // here the desired height
              child: CustomAppbar(
                title: 'SmolGU Change.org',
                ending: Icons.search,
              ),
            ),
          )
        ],
      ),
    );
  }

}