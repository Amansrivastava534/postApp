import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String message, {bool isError = false}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(color: isError ? Colors.white : Colors.black),
    ),
    backgroundColor: isError ? Colors.red : Colors.green,
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: 3),
    action: SnackBarAction(
      label: 'Dismiss',
      textColor: isError ? Colors.white : Colors.black,
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
