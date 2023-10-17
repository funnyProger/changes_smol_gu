import 'package:flutter/material.dart';

SnackBar getSnackBar(String snackBarMessage) {

  final snackBar = SnackBar(
    content: Center(
      child: Text(
          snackBarMessage,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, color: Colors.white),
          textDirection: TextDirection.ltr
      ),
    ),
    duration: const Duration(milliseconds: 1500),
    behavior: SnackBarBehavior.floating,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(100),
      ),
    ),
    backgroundColor: Colors.black54,
    margin: const EdgeInsets.only(left: 110, right: 110, bottom: 100),
  );

  return snackBar;
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
      .removeCurrentSnackBar();
  ScaffoldMessenger.of(context)
      .showSnackBar(
      getSnackBar(message));
}