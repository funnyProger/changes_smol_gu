import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/custom_appbar.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter/material.dart';
import 'catalog_page_widgets/catalog_widget.dart';


class MainScreenContainer extends StatelessWidget {
  MainScreenContainer({super.key});

  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _screensList() {
    return [
      const CatalogList(),
      Container(
        decoration: const BoxDecoration(
            color:Colors.black87
        ),
        child: Container(
          alignment: Alignment.center,
          child: const Text(
            'Favoarites',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15
            )
          ),
        ),
      ),
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
        icon: const Icon(Icons.create),
        title: ('Create'),
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppbar(
        title: 'SmolGU Change.org',
      ),
      body: PersistentTabView(
        context,
        margin: const EdgeInsets.only(left: 15, bottom: 15, right: 15),
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
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style1,
      ),
    );
  }
}