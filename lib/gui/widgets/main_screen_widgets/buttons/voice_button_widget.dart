import 'package:flutter/material.dart';

enum ButtonState { init, done }

class VoiceButton extends StatefulWidget {
  const VoiceButton({super.key, required this.firstTitle, required this.secondTitle});
  final String firstTitle;
  final String secondTitle;


  @override
  State<VoiceButton> createState() => _VoiceButtonState(firstTitle: firstTitle, secondTitle: secondTitle);
}


class _VoiceButtonState extends State<VoiceButton> {
  _VoiceButtonState({required this.firstTitle, required this.secondTitle});
  ButtonState state = ButtonState.init;
  bool _isAnimating = true;
  bool _onPressed = false;
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
          backgroundColor: _onPressed == true ? Colors.red : Colors.blue,
        ),
        onPressed: () async {
          setState(() {
            state = ButtonState.done;
          });
          await Future.delayed(const Duration(milliseconds: 1600));
          setState(() {
            _onPressed = !_onPressed;
            state = ButtonState.init;
          });
        },
        child: FittedBox(
          child: Text(
              _onPressed == true ? secondTitle : firstTitle,
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