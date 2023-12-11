import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/home_page_widgets/home_page_widget.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/settings_page_widgets/settings_page_widget.dart';
import 'package:flutter/material.dart';


class CustomAppbar extends StatefulWidget {
  const CustomAppbar({
    super.key,
    this.leading,
    this.title = '',
    this.ending,
  });
  final String title;
  final leading;
  final ending;


  @override
  State<CustomAppbar> createState() => _CustomAppbarState(
          leading: leading,
          title: title,
          ending: ending
      );
}


class _CustomAppbarState extends State<CustomAppbar> {
  _CustomAppbarState({
    this.leading,
    this.title = '',
    this.ending,
  });

  final TextEditingController _textEditingController = TextEditingController();

  final String title;
  final leading;
  final ending;


  @override
  Widget build(BuildContext context) {
    return customAppBar(context);
  }

  Widget customAppBar(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black87,
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
            ),
            color: Colors.black,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        leading: leading == null ? null : InkWell(
          onTap: () {
            Navigator.pushReplacement(
            context, 
            MaterialPageRoute(
              builder: (BuildContext context) => const HomePage())
            );
          },
          borderRadius: BorderRadius.circular(150),
          splashColor: Colors.white10,
          child: Icon(
            leading,
            size: 25,
            color: Colors.white24,
          ),
        ),
        title: Container(
          alignment: Alignment.center,
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Pacifico'
            ),
            softWrap: true,
          ),
        ),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const SettingsPage())
                );
              },
              borderRadius: BorderRadius.circular(150),
              splashColor: Colors.white10,
              child: SizedBox(
                height: 52,
                width: 52,
                child: Icon(
                  ending,
                  size: 25,
                  color: Colors.white24,
                ),
              )
          )
        ],
      ),
    );
  }
}