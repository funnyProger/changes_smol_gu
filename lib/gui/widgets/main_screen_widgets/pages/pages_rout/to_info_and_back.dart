import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/info_page_widgets/info_page_container_widget.dart';
import 'package:flutter/material.dart';

Route routToInfo(Petition petition) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => InfoPageContainer(petition: petition),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      }
  );
}