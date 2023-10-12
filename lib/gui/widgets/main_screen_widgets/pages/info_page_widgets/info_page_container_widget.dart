import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:flutter/material.dart';

import 'info_page_widget.dart';

class InfoPageContainer extends StatefulWidget {
  const InfoPageContainer({super.key, required this.petition});
  final Petition petition;


  @override
  State<InfoPageContainer> createState() => _InfoPageContainerState(petition: petition);
}

enum ButtonState { init, done }

class _InfoPageContainerState extends State<InfoPageContainer> {
  _InfoPageContainerState({required this.petition});
  final Petition petition;
  ButtonState state = ButtonState.init;
  bool _isAnimating = true;
  bool _onPressed = false;

  @override
  Widget build(BuildContext context) {
    final isStretched = _isAnimating || state == ButtonState.init;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black87
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 103),
                child: InfoPage(petition: petition),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 60),
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: state == ButtonState.init ? 200 : 50,
                onEnd: () => setState(() => _isAnimating = !_isAnimating),
                curve: Curves.ease,
                child: isStretched ? getDefaultButton() : getSmallButton(),
              )
            )
          ],
        )
      ),
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
            _onPressed == true ? 'Удалить голос' : 'Голосовать',
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