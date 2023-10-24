import 'package:changes_smol_gu/constants/constants.dart';
import 'package:changes_smol_gu/core/models/current_sign_page_model.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/snack_bar/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}


enum ButtonState { init, loading, done , error}


class _SignInPageState extends State<SignInPage>
    with SingleTickerProviderStateMixin {
  final _inputPhoneNumberDataController = TextEditingController();
  final _inputPasswordDataController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  ButtonState state = ButtonState.init;
  bool _isAnimating = true;

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
    _inputPhoneNumberDataController.dispose();
    _inputPasswordDataController.dispose();
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

    return FadeTransition(
      opacity: fadeAnimation,
      child: Container(
          alignment: Alignment.center,
          child: getSingInWidget()
      ),
    );
  }


  Widget getSingInWidget() {
    final isStretched = _isAnimating || state == ButtonState.init;

    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: const Text(
              "Hello!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 70,
              ),
              textDirection: TextDirection.ltr,
            ),
          ),
          Form(
            key: _formKey,
            child: Container(
              child: getTextFormFieldPhoneNumberAndPassword(
                  context,
                  _inputPhoneNumberDataController,
                  _inputPasswordDataController,
                  _phoneNumberFocusNode,
                  _passwordFocusNode
              ),
            ),
          ),
          Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(top: 35, bottom: 15),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: state == ButtonState.init ? 200 : 50,
                onEnd: () => setState(() => _isAnimating = !_isAnimating),
                curve: Curves.ease,
                child: isStretched ? getDefaultButton() : getSmallButton(state),
              )
          ),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 7),
              child: GestureDetector(
                onTap: () {
                  context.read<CurrentSignPageModel>().changeValue(Constants.signUpPage);
                },
                child: const Text(
                    'Create new account?',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                    ),
                    textDirection: TextDirection.ltr
                ),
              )
          ),
        ],
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
          backgroundColor: Colors.blue,
        ),
        onPressed: () async {
          setState(() {
            _phoneNumberFocusNode.unfocus();
            _passwordFocusNode.unfocus();
            state = ButtonState.loading;
          });
          await Future.delayed(const Duration(milliseconds: 1600));
          if(_inputPhoneNumberDataController.value.text.isNotEmpty
          && _inputPasswordDataController.value.text.isNotEmpty
          && _formKey.currentState!.validate()) {
            setState(() {
              state = ButtonState.done;
              context.read<CurrentSignPageModel>().changeValue(Constants.signSuccessPage);
            });
          } else {
            setState(() {
              showSnackBar(context, 'Invalid data');
              state = ButtonState.error;
            });
            await Future.delayed(const Duration(milliseconds: 1600));
            setState(() {
              state = ButtonState.init;
            });
          }
        },
        child: const FittedBox(
          child: Text(
              'Sign In',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white
              )
          ),
        )
    );
  }


  Widget getSmallButton(ButtonState state) {
    Widget view = Container();
    if(state == ButtonState.loading) {
      view = Container(
          height: 48,
          width: 47,
          padding: const EdgeInsets.only(right: 9, left: 9, top: 8, bottom: 8),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              border: Border.all(
                  color: Colors.grey
              )
          ),
          child: const CircularProgressIndicator(
            color: Colors.white,
          )
      );
    } else if(state == ButtonState.done) {
      view =  Container(
          height: 48,
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
              size: 36,
              color: Colors.white
          )
      );
    } else if(state == ButtonState.error) {
      view = Container(
          alignment: Alignment.center,
          height: 48,
          width: 47,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
              border: Border.all(
                  color: Colors.grey
              )
          ),
          child: const Icon(
              Icons.error,
              size: 36,
              color: Colors.white
          )
      );
    }
    return view;
  }
}


Widget getTextFormFieldPhoneNumberAndPassword(BuildContext context,
    TextEditingController inputPhoneNumberDataController,
    TextEditingController inputPasswordDataController,
    FocusNode phoneNumberFocusNode,
    FocusNode passwordFocusNode,
    ) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 90,
        padding: const EdgeInsets.only(left: 65, right: 65),
        alignment: Alignment.center,
        child: TextFormField(
          focusNode: phoneNumberFocusNode,
          onEditingComplete: () {
            phoneNumberFocusNode.unfocus();
          },
          inputFormatters: [getPhoneNumberMaskFormatter()],
          controller: inputPhoneNumberDataController,
          keyboardType: TextInputType.phone,
          validator: (value) {
            if(value != null && value != '' && value.length < 15) {
              return 'Invalid phone number';
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.always,
          cursorOpacityAnimates: true,
          cursorColor: Colors.white,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 17
          ),
          decoration:  InputDecoration(
            counterText: '',
            labelText: 'Phone number',
            prefixIcon: const Icon(
              Icons.phone_android,
              color: Colors.white,
              size: 20,
            ),
            prefixText: '+7 ',
            prefixStyle: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
            floatingLabelAlignment: FloatingLabelAlignment.center,
            labelStyle: const TextStyle(color: Colors.grey),
            floatingLabelStyle: MaterialStateTextStyle
                .resolveWith((Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? Theme.of(context).colorScheme.error :
              Colors.white;
              return TextStyle(color: color, letterSpacing: 1);
            }),
            hintStyle: const TextStyle(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(20.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(20.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
      Container(
        height: 90,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 4, left: 65, right: 65),
        child: TextFormField(
          focusNode: passwordFocusNode,
          onEditingComplete: () {
            passwordFocusNode.unfocus();
          },
          keyboardType: TextInputType.text,
          controller: inputPasswordDataController,
          validator: (value) {
            if(value != null && value.contains(' ')) {
              return 'Invalid password';
            } else if(value != '' && value!.length < 6) {
              return 'Password min 6 characters';
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.always,
          textAlign: TextAlign.justify,
          cursorOpacityAnimates: true,
          cursorColor: Colors.white,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 17
          ),
          decoration:  InputDecoration(
            labelText: 'Password',
            floatingLabelAlignment: FloatingLabelAlignment.center,
            labelStyle: const TextStyle(color: Colors.grey),
            floatingLabelStyle: MaterialStateTextStyle
                .resolveWith((Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? Theme.of(context).colorScheme.error :
              Colors.white;
              return TextStyle(color: color, letterSpacing: 1);
            }),
            prefixIcon: const Icon(
              Icons.lock,
              color: Colors.white,
              size: 20,
            ),
            hintStyle: const TextStyle(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(20.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(20.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      )
    ],
  );
}


MaskTextInputFormatter getPhoneNumberMaskFormatter() {
  return MaskTextInputFormatter(
    mask: '(___) ___-__-__',
    filter: {'_': RegExp('[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
}