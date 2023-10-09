import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/info_page_widgets/info_page_widget.dart';
import 'package:flutter/material.dart';

class InfoPageContainer extends StatelessWidget {
  const InfoPageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const InfoPage(),
    );
  }

}