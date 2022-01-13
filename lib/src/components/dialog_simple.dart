import 'package:flutter/material.dart';

Future<void> showMyDialogSimple(BuildContext context, String title,
    List<Widget> listBody, List<Widget> actions) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: listBody,
            ),
          ),
          actions: actions,
        );
      });
}
