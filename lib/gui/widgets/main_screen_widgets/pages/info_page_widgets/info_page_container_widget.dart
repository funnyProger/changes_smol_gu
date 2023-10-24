import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/buttons/voice_button_widget.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/custom_appbar/custom_appbar.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/drawer_menu/drawer_menu_widget.dart';
import 'package:flutter/material.dart';
import 'info_page_widget.dart';


class InfoPageContainer extends StatelessWidget {
  const InfoPageContainer({super.key, required this.petition});
  final Petition petition;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawerScrimColor: Colors.transparent,
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      appBar:  const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: CustomAppbar(
          title: 'SmolGU Change.org',
        ),
      ),
      endDrawer: const DrawerMenu(),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black87,
        ),
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                ),
                child: SingleChildScrollView(
                    child: InfoPage(petition: petition)
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(bottom: 60),
                alignment: Alignment.bottomCenter,
                child: const VoiceButton(
                  firstTitle: 'Голосовать',
                  secondTitle: 'Удалить голос',
                )
            )
          ],
        )
      ),
    );
  }
}