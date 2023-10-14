import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/buttons/voice_button_widget.dart';
import 'package:flutter/material.dart';
import 'info_page_widget.dart';


class InfoPageContainer extends StatelessWidget {
  const InfoPageContainer({super.key, required this.petition});
  final Petition petition;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black87,
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: InfoPage(petition: petition)
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