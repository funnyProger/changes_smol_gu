import 'package:changes_smol_gu/core/models/current_sign_page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SignInPageContainer extends StatelessWidget {
  const SignInPageContainer({super.key});


  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.asset(
            'assets/images/others/night_forest_vector.jpg',
          ).image,
          fit: BoxFit.fill,
        ),
      ),
      child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.transparent,
              body: Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: context.watch<CurrentSignPageModel>().getCurrentSignPage()
                ),
              )
          )
      ),
    );
  }
}
