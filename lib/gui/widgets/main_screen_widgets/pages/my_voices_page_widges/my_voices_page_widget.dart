import 'package:changes_smol_gu/core/models/my_voices_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/models/user_model.dart';


class MyVoicesPage extends StatefulWidget {
  const MyVoicesPage({super.key});


  @override
  State<MyVoicesPage> createState() => _MyVoicesPageState();
}


class _MyVoicesPageState extends State<MyVoicesPage> {

  @override
  void initState() {
    context.read<UserModel>().updateMyVoices();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    if(context.watch<MyVoicesModel>().getMyVoicesList().isNotEmpty) {
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
                  children: context.watch<MyVoicesModel>()
                      .getMyVoicesList(),
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
              'My Voices',
              style: TextStyle(
                color: Colors.grey,
              )
          ),
        ),
      );
    }
  }
}