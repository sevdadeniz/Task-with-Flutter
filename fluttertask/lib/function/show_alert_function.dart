import 'package:flutter/material.dart';

void showAlertDialog(
  BuildContext context,
  String title,
  String message,
  VoidCallback onPressed,
) {
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message, style: TextStyle(fontSize: 15)),
    actions: [
      TextButton(
        child: Text("Hayır", style: TextStyle(fontSize: 16)),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      TextButton(
        onPressed: onPressed,
        child: Text("Evet", style: TextStyle(fontSize: 16)),
      ),
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
