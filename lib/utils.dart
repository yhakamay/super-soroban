import 'package:flutter/material.dart';

class Utils {
  static void hideCurrentSnackBar(BuildContext context) =>
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

  static void showSnackBar(BuildContext context, String message) {
    hideCurrentSnackBar(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
