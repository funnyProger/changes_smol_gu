import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    this.ending,
    this.title = '',
    this.leading,
  });

  final String title;
  final Widget? leading;
  final Widget? ending;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.center,
              child: leading == null ? const SizedBox(width: 20, height: 10,): Center(child: leading),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
                textDirection: TextDirection.ltr
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: ending
            )
          ],
        ),
      ),
    );
  }


  @override
  Size get preferredSize => const Size(
      double.maxFinite,
      80
  );
}