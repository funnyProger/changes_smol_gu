import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/my_voices_page_widges/my_voices_item.dart';
import 'package:flutter/material.dart';
import '../../data/singletons/my_voices.dart';


class MyVoicesModel extends ChangeNotifier {
  final MyVoices _myVoicesInstance = MyVoices.getInstance();


  bool isMyVoicesContainsPetition(int id) {
    bool isPetitionContains = false;
    List<Petition> myVoicesList = _myVoicesInstance.getList();
    if(myVoicesList.isNotEmpty) {
      for(int i = 0; i < myVoicesList.length; i++) {
        if(myVoicesList[i].id == id) {
          isPetitionContains = true;
        }
      }
    }
    return isPetitionContains;
  }


  List<Widget> getMyVoicesList() {
    List<Widget> widgets = [];
    List<Petition> myVoicesList = _myVoicesInstance.getList();

    for(int i = 0; i < myVoicesList.length; i++) {
      widgets.add(MyVoicesItemWidget(petition: myVoicesList[i]));
      if(i == myVoicesList.length - 1) {
        widgets.add(
            const SizedBox(
              height: 70,
            )
        );
      }
    }

    return widgets;
  }
}