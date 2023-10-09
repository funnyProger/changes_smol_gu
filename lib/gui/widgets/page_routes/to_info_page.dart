import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/info_page_widgets/info_page_container_widget.dart';
import 'package:flutter/material.dart';

class ToInfoPage {
  Route createAndGetRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const InfoPageContainer(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }
}