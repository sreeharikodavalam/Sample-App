import 'package:flutter/material.dart';

pushScreen(BuildContext context, screen) async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
  return result;
}
