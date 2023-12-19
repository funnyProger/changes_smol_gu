import 'package:changes_smol_gu/core/models/user_model.dart';
import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/buttons/voice_button_widget.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/custom_appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'info_page_widget.dart';

class InfoPageContainer extends StatefulWidget {
  const InfoPageContainer({super.key, required this.petition});
  final Petition petition;


  @override
  State<InfoPageContainer> createState() => _InfoPageContainerState(petition: petition);
}


class _InfoPageContainerState extends State<InfoPageContainer> {
  _InfoPageContainerState({required this.petition});
  final Petition petition;

  @override
  void initState() {
    context.read<UserModel>().updateUserData();
    print("МОИ ГОЛОСА");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawerScrimColor: Colors.transparent,
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      appBar:  const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: CustomAppbar(
          title: 'Information',
        ),
      ),
      body: Container(
          decoration: const BoxDecoration(
            color: Colors.black87,
          ),
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                margin: const EdgeInsets.only(left: 6, right: 6, top: 6),
                decoration: const BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)
                    )
                ),
              ),
              SingleChildScrollView(
                  child: InfoPage(petition: petition)
              ),
              Container(
                  padding: const EdgeInsets.only(bottom: 40),
                  alignment: Alignment.bottomCenter,
                  child: VoiceButton(
                    firstTitle: 'Голосовать',
                    secondTitle: 'Удалить голос',
                    petition: petition,
                  )
              )
            ],
          )
      )
    );
  }
}