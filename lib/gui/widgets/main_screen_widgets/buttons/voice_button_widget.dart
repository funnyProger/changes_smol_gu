import 'package:changes_smol_gu/core/controllers/json_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/models/my_voices_model.dart';
import '../../../../core/models/user_model.dart';
import '../../../../data/entities/petition.dart';

enum ButtonState { init, done }

class VoiceButton extends StatefulWidget {
  const VoiceButton({super.key, required this.firstTitle, required this.secondTitle, required this.petition});
  final String firstTitle;
  final String secondTitle;
  final Petition petition;

  @override
  State<VoiceButton> createState() => _VoiceButtonState(firstTitle: firstTitle, secondTitle: secondTitle, petition: petition);
}


class _VoiceButtonState extends State<VoiceButton> {
  _VoiceButtonState({required this.firstTitle, required this.secondTitle, required this.petition});
  ButtonState state = ButtonState.init;
  bool _isAnimating = true;
  final Petition petition;
  final String firstTitle;
  final String secondTitle;

  @override
  Widget build(BuildContext context) {
    final isStretched = _isAnimating || state == ButtonState.init;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: state == ButtonState.init ? 200 : 50,
      onEnd: () => setState(() => _isAnimating = !_isAnimating),
      curve: Curves.ease,
      child: isStretched ? getDefaultButton() : getSmallButton(),
    );
  }


  Widget getDefaultButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: const BorderSide(
              color: Colors.grey
          ),
          minimumSize: const Size(200, 47),
          backgroundColor: context.watch<MyVoicesModel>()
              .isMyVoicesContainsPetition(petition.id)
              ? Colors.red : Colors.blue,
        ),
        onPressed: () async {
          setState(() {
            state = ButtonState.done;
          });

          bool isUserVoted;
          if(context.read<MyVoicesModel>().isMyVoicesContainsPetition(petition.id)) {
            isUserVoted = await JsonController().removePetitionFromMyVoices(petition);
          } else {
            isUserVoted = await JsonController().addPetitionToMyVoices(petition);
          }
          if(isUserVoted) {
            context.read<UserModel>().updateMyVoices();
          }

          await Future.delayed(Duration(milliseconds: 1200));
          setState(() {
            state = ButtonState.init;
          });
        },
        child: FittedBox(
          child: Text(
              context.watch<MyVoicesModel>()
                  .isMyVoicesContainsPetition(petition.id)
                  ? secondTitle : firstTitle,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white
              )
          ),
        )
    );
  }


  Widget getSmallButton() {
    return Container(
        height: 47,
        width: 47,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
            border: Border.all(
                color: Colors.grey
            )
        ),
        child: const Icon(
            Icons.done,
            size: 30,
            color: Colors.white
        )
    );
  }
}