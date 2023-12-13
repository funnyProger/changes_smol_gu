import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/my_petitions_page_widgets/my_petitions_item.dart';
import 'package:flutter/material.dart';
import '../../data/singletons/my_petitions.dart';


class MyPetitionsModel extends ChangeNotifier {
  final MyPetitions _myPetitionsInstance = MyPetitions.getInstance();


  bool isMyPetitionsContainsPetition(int id) {
    bool isPetitionContains = false;
    List<Petition> myPetitionsList = _myPetitionsInstance.getList();
    if(myPetitionsList.isNotEmpty) {
      for(int i = 0; i < myPetitionsList.length; i++) {
        if(myPetitionsList[i].id == id) {
          isPetitionContains = true;
        }
      }
    }
    return isPetitionContains;
  }


  List<Widget> getMyPetitionsList() {
    List<Widget> widgets = [];
    List<Petition> myPetitionsList = _myPetitionsInstance.getList();

    for(int i = 0; i < myPetitionsList.length; i++) {
      widgets.add(MyPetitionsItemWidget(petition: myPetitionsList[i]));
      if(i == myPetitionsList.length - 1) {
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