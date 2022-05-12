import 'package:flutter/material.dart';

pushScreen(BuildContext context, screen) async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
  return result;
}

pushReplaceScreen(BuildContext context, screen) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

Future<void> customDialog({required BuildContext context, required String title, required String description}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title:  Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children:  <Widget>[
              Text(description),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
