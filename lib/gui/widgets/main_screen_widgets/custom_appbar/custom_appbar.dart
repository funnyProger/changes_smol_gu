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
  State<CustomAppbar> createState() =>
      _CustomAppbarState(
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

  final String title;
  final leading;
  final ending;


  @override
  Widget build(BuildContext context) {
    return getDefaultCustomAppBar(context);
  }


  Widget getDefaultCustomAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black54,
      elevation: 0.0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)
          ),
          color: Colors.black54,
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      leading: leading == null ? null : Container(
        alignment: Alignment.center,
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      title: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 50, right: 50),
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
    );
  }
}