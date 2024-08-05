import 'package:flutter/material.dart';

class AppDialogs {
  static void showMyDialog(
          {required BuildContext context, required bool condition}) =>
      showDialog<void>(
        context: context,
        barrierColor: Colors.transparent,
        barrierDismissible: false,
        builder: (BuildContext context) {
          if (condition == true) {}

          return const AlertDialog();
        },
      );
}
