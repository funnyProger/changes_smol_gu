import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
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
  Widget build(BuildContext context) {
    return getDefaultCustomAppBar();
  }


  Widget getDefaultCustomAppBar() {
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
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Pacifico'
          ),
        ),
      ),
      actions: [
        ending == null ? Container() : Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(right: 13),
          child: Icon(
            ending! as IconData,
            color: Colors.white,
          ),
        ),
      ],
    );
  }


  @override
  Size get preferredSize => const Size(
      double.maxFinite,
      50
  );
}