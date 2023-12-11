import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/favorite_page_widgets/favorite_page_widget.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/my_petitions_page_widgets/my_petition_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _selectedIndex = 0;

  List<Widget> _getTabItemList(BuildContext context) {
    return [
      const FavoritePage(),
      const MyPetitionPage(),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black87
      ),
      child: Column(
        children: [
          Expanded(
            flex: 10,
            child: userInfo(),
          ),
          Expanded(
            flex: 8,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 16),
              child: FlutterToggleTab(
                width: 90, // width in percent
                borderRadius: 30,
                height: 47,
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
                  'My Petitions'
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
                isScroll:false,
              )
            ),
          ),
          Expanded(
            flex: 80,
            child: PageView(
              controller: _pageController,
              onPageChanged: (newIndex) {
                setState(() {
                  _selectedIndex = newIndex;
                });
              },
              children: _getTabItemList(context),
            ),
          ),
        ],
      )
    );
  }

  Widget userInfo() {
    return Container(
      height: 80,
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: Container(
              alignment: Alignment.center,
              child: const CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 25,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                        'n',
                        style: TextStyle(
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
                      child: const Text(
                        'Name: nosferatu',
                        style: TextStyle(
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
                      child: const Text(
                        'Email: funbogdan2003@gmail.com',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12
                        ),
                      ),

                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}