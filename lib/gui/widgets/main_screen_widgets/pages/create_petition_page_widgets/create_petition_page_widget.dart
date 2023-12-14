import 'dart:io';
import 'package:changes_smol_gu/core/controllers/device_storage_controller.dart';
import 'package:changes_smol_gu/core/controllers/shared_preferences_controller.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/snack_bar/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../../core/controllers/json_controller.dart';
import '../../../../../core/models/user_model.dart';
import '../../../../../data/entities/petition.dart';


class CreatePetitionPage extends StatefulWidget {
  const CreatePetitionPage({super.key});

  @override
  State<CreatePetitionPage> createState() => _CreatePetitionPageState();
}


enum ButtonState { init, loading, done , error}


class _CreatePetitionPageState extends State<CreatePetitionPage> {
  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _descriptionTextController = TextEditingController();
  final DeviceStorageController _deviceStorageController = DeviceStorageController();
  final _formKey = GlobalKey<FormState>();
  ButtonState state = ButtonState.init;
  bool _isAnimating = true;
  File? _pickedImage;


  @override
  void dispose() {
    _titleTextController.dispose();
    _descriptionTextController.dispose();
    super.dispose();
  }


  getImageFromDevice() async {
    XFile? imageFile = await _deviceStorageController.getGalleryData();
    if(imageFile != null) {
      setState(() {
        _pickedImage = File(imageFile.path);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final isStretched = _isAnimating || state == ButtonState.init;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black87,
      body: Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 75),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(187, 0, 0, 0),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: getPetitionFormCreation(isStretched),
                    )
                )
            ),
          )
      ),
    );
  }


  Widget getPetitionFormCreation(bool isStretched) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 13),
              child: const Text(
                  'Добавьте изображение',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                  )
              ),
            ),
            Container(
              margin: const EdgeInsets.all(13),
              child: Container(
                alignment: Alignment.center,
                child: AspectRatio(
                    aspectRatio: 16 / 14,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                          onTap: () {
                            getImageFromDevice();
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: _pickedImage == null ? Container(
                            decoration: const BoxDecoration(
                                color: Colors.white12
                            ),
                            child: const Center(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.grey,
                                  size: 30,
                                )
                            ),
                          ) :
                          Image.file(
                            File(_pickedImage!.path),
                            height: 700,
                            width: 383,
                            fit: BoxFit.cover,
                          )
                      ),
                    )
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.all(13),
                child: SingleChildScrollView(
                  child: TextFormField(
                    controller: _titleTextController,
                    keyboardType: TextInputType.multiline,
                    cursorOpacityAnimates: true,
                    maxLines: 2,
                    cursorColor: Colors.white,
                    onTapOutside: (value) {
                      FocusScope.of(context).unfocus();
                    },
                    autovalidateMode: AutovalidateMode.always,
                    validator: (value) {
                      if(value != null && !inputValidation(value) && value != '') {
                        return 'Invalid name';
                      } else if(value != '' && value!.length < 5) {
                        return 'Name min 5 characters';
                      }
                      return null;
                    },
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      fillColor: Colors.white12,
                      filled: true,
                      labelText: 'Название',
                      labelStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      floatingLabelStyle: MaterialStateTextStyle
                          .resolveWith((Set<MaterialState> states) {
                        final Color color = states.contains(MaterialState.error)
                            ? Theme.of(context).colorScheme.error :
                        Colors.white;
                        return TextStyle(color: color, fontSize: 20);
                      }),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                          const BorderSide(color: Colors.grey)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                          const BorderSide(color: Colors.grey)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                          const BorderSide(color: Colors.grey)
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                          const BorderSide(color: Colors.red)
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                          const BorderSide(color: Colors.red)
                      ),
                    ),
                  ),
                )
            ),
            Container(
              margin: const EdgeInsets.all(13),
              child: TextFormField(
                controller: _descriptionTextController,
                keyboardType: TextInputType.multiline,
                maxLines: 8,
                cursorOpacityAnimates: true,
                cursorColor: Colors.white,
                onTapOutside: (value) {
                  FocusScope.of(context).unfocus();
                },
                autovalidateMode: AutovalidateMode.always,
                validator: (value) {
                  if(value != null && !inputValidation(value) && value != '') {
                    return 'Invalid name';
                  } else if(value != '' && value!.length < 5) {
                    return 'Name min 5 characters';
                  }
                  return null;
                },
                style: const TextStyle(fontSize: 20, color: Colors.white),
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  fillColor: Colors.white12,
                  filled: true,
                  labelText: 'Описание',
                  labelStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  floatingLabelStyle: MaterialStateTextStyle
                      .resolveWith((Set<MaterialState> states) {
                    final Color color = states.contains(MaterialState.error)
                        ? Theme.of(context).colorScheme.error :
                    Colors.white;
                    return TextStyle(color: color, fontSize: 20);
                  }),
                  hoverColor: Colors.transparent,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                      const BorderSide(color: Colors.grey)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                      const BorderSide(color: Colors.grey)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                      const BorderSide(color: Colors.grey)
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                      const BorderSide(color: Colors.red)
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                      const BorderSide(color: Colors.red)
                  ),
                ),
              ),
            ),
            Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 15),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: state == ButtonState.init ? 200 : 50,
                  onEnd: () => setState(() => _isAnimating = !_isAnimating),
                  curve: Curves.ease,
                  child: isStretched ? getDefaultButton() : getSmallButton(state),
                )
            )
          ],
        )
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
            state = ButtonState.loading;
          });
          if(_titleTextController.value.text.isNotEmpty
          && _descriptionTextController.value.text.isNotEmpty
          && _formKey.currentState!.validate()
          && _pickedImage != null) {
            String userPhoneNumber = await SharedPreferencesController().getUserPhoneNumber();
            /*
            Каждой созданной петиции в приложении будет присваиваться индекс 0
            для удобства передачи данных в формате Peititon. Сервер уже будет
            определять нормальный индекс и при получении списка петиций пользователя
            сервер будет возвращать петиции с нормальными индексами.
            В общем это такяа затычка :))
             */
            bool isPetitionCreated = await JsonController().createPetition(
              Petition(
                id: 0,
                owner: userPhoneNumber,
                voices: 0,
                title: _titleTextController.value.text,
                image: "_pickedImage",
                description: _descriptionTextController.value.text,
              )
            );

            if(isPetitionCreated) {
              context.read<UserModel>().updateUserData();
              setState(() {
                showSnackBar(context, 'Петиция добавлена');
                state = ButtonState.done;
              });
            } else {
              setState(() {
                showSnackBar(context, 'Такая петиция уже существует...');
                state = ButtonState.done;
              });
            }
          } else {
            setState(() {
              showSnackBar(context, 'Заполните все поля правильно');
              state = ButtonState.error;
            });
          }
          await Future.delayed(const Duration(milliseconds: 1600));
          setState(() {
            state = ButtonState.init;
          });
        },
        child: const FittedBox(
          child: Text(
              'Добавить петицию',
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
          height: 47,
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
              size: 36,
              color: Colors.white
          )
      );
    } else if(state == ButtonState.error) {
      view = Container(
          alignment: Alignment.center,
          height: 47,
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


bool inputValidation(String value) {
  bool isStringValid = false;
  String ru = 'абвгдеёжзийклмнопрстуфхцчшщэюя';
  String en = 'abcdefghijklmnopqrstuwxvz';
  List<String> charList = value.toLowerCase().split('');
  for (String element in charList) {
    if(ru.contains(element) || en.contains(element)) {
      isStringValid = true;
      continue;
    }
  }
  return isStringValid;
}