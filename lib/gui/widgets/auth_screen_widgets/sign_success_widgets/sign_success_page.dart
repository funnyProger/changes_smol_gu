import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/home_page_widgets/home_page_widget.dart';
import 'package:flutter/material.dart';


class SignSuccessPage extends StatefulWidget {
  const SignSuccessPage({super.key});

  @override
  State<SignSuccessPage> createState() => _SignSuccessPageState();
}

class _SignSuccessPageState extends State<SignSuccessPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );


  @override
  void initState() {
    _animationController.forward();
    super.initState();
  }


  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    late final Animation<double> fadeAnimation =
    CurvedAnimation(
      parent: _animationController,
      curve:  Curves.linear,
    );


    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 2700)).then((value) =>
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const HomePage()),
          )
      ),
      builder: (context, snapShot) {
        return FadeTransition(
          opacity: fadeAnimation,
          child: Container(
            alignment: Alignment.center,
            child: const Text(
              'Welcome!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.white
              ),
            ),
          ),
        );
      },
    );
  }
}