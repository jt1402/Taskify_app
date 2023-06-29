import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String msg) {
  if (ScaffoldMessenger.of(context).mounted) {
    ScaffoldMessenger.of(context).clearSnackBars();
  }
  final snackBar = SnackBar(
    content: Text(msg),
    duration: Duration(seconds: 3),
  );

  // Find the ScaffoldMessenger and show the SnackBar
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

validateEmail(String email) {
  final emailReg = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  return emailReg.hasMatch(email);
}
