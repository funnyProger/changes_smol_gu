import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/controllers/json_controller.dart';
import '../../../../../core/models/user_model.dart';
import '../../../../../data/entities/petition.dart';
import '../pages_rout/to_info_and_back.dart';


class MyVoicesItemWidget extends StatelessWidget {
  const MyVoicesItemWidget({super.key, required this.petition});
  final Petition petition;


  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(20)
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(routToInfo(petition));
          },
          borderRadius: BorderRadius.circular(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 10,
                child: Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: Image.network(petition.image).image,
                  ),
                ),
              ),
              Expanded(
                  flex: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        child: const Text(
                          'Name:',
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.white
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                        child: Text(
                          petition.title,
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              Expanded(
                  flex: 7,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () async {
                        bool isItemRemovedFromMyVoices = await JsonController().removePetitionFromMyVoices(petition);
                        if(isItemRemovedFromMyVoices) {
                          context.read<UserModel>().updateUserData();
                        }
                      },
                      borderRadius: BorderRadius.circular(30),
                      splashColor: Colors.transparent,
                      child: const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ),
                  )
              )
            ],
          ),
        )
    );
  }


}