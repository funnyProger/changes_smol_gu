import 'package:changes_smol_gu/core/models/current_drawer_page_model.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/drawer_menu/drawer_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'custom_appbar/custom_appbar.dart';


class MainScreenContainer extends StatelessWidget {
  const MainScreenContainer({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawerScrimColor: Colors.transparent,
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: CustomAppbar(
          leading: Icons.home,
          title: 'SmolGU Change.org',
        ),
      ),
      endDrawer: const DrawerMenu(),
      body: context.watch<CurrentDrawerPageModel>().getCurrentPage(),
    );
  }
}