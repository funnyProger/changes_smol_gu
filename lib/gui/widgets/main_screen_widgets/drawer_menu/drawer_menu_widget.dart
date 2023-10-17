import 'package:changes_smol_gu/core/models/current_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:provider/provider.dart';


class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});


  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}


class _DrawerMenuState extends State<DrawerMenu> {
  int _selectedMenuItemIndex = 0;


  List<Widget> menuWidgetsList = [];


  void _onItemTapped(int index) {
    setState(() {
      _selectedMenuItemIndex = index;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600,
        margin: const EdgeInsets.only(top: 30, right: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Drawer(
            backgroundColor: Colors.black87,
            width: 170,
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: ShaderMask(
                        blendMode: BlendMode.darken,
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black38, Colors.black87]
                          ).createShader(bounds);
                        },
                        child: Container(
                          height: 170,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: Image.network('https://i.pinimg.com/564x/34/88/4b/34884b9945dc7e973595be907c4d7859.jpg').image,
                                fit: BoxFit.cover
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        left: 13,
                        bottom: 13,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: const Text(
                                'konke',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                '+7 (123) 45-67-891',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11
                                ),
                              ),
                            )
                          ],
                        )
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<CurrentPageModel>().setCurrentPageIndex(0);
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 25,
                              child: Container(
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.home,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 50,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                      'Home',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13
                                      )
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.read<CurrentPageModel>().setCurrentPageIndex(1);
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 25,
                              child: Container(
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.account_circle_outlined,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 50,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                      'Profile',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13
                                      )
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.read<CurrentPageModel>().setCurrentPageIndex(2);
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 25,
                              child: Container(
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.create,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 50,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                      'Create petition',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13
                                      )
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.read<CurrentPageModel>().setCurrentPageIndex(3);
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 25,
                              child: Container(
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.create_new_folder_outlined,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 50,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                      'My petitions',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13
                                      )
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.read<CurrentPageModel>().setCurrentPageIndex(4);
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 25,
                              child: Container(
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 50,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                      'Settings',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13
                                      )
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.only(bottom: 20),
                      child: AnimatedButton(
                        height: 45,
                        width: 130,
                        text: 'Log out',
                        isReverse: true,
                        borderColor: Colors.white,
                        selectedTextColor: Colors.black,
                        transitionType: TransitionType.LEFT_TO_RIGHT,
                        textStyle: const TextStyle(
                          color: Colors.white
                        ),
                        backgroundColor: Colors.black,
                        borderRadius: 50,
                        selectedText: 'Login in',
                        onPress: () {

                        },
                      ),
                    )
                )
              ],
            ),
          ),
        )
    );
  }
}