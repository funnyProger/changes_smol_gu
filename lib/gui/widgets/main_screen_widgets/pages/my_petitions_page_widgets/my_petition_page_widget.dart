import 'package:changes_smol_gu/core/models/my_petitions_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/models/user_model.dart';


class MyPetitionsPage extends StatefulWidget {


  @override
  State<MyPetitionsPage> createState() => _MyPetitionsPageState();
}


class _MyPetitionsPageState extends State<MyPetitionsPage> {


  @override
  void initState() {
    context.read<UserModel>().updateMyPetitions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if(context.watch<MyPetitionsModel>().getMyPetitionsList().isNotEmpty) {
      return Container(
          decoration: const BoxDecoration(
              color: Colors.black87
          ),
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: context.watch<MyPetitionsModel>()
                      .getMyPetitionsList(),
                ),
              )
          )
      );
    } else {
      return Container(
        decoration: const BoxDecoration(
            color:Colors.black12
        ),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(bottom: 100),
          child: const Text(
              'My Petitions',
              style: TextStyle(
                color: Colors.grey,
              )
          ),
        ),
      );
    }
  }
}