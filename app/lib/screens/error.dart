import 'package:flutter/material.dart';

import '../../styles/constants.dart';

class ErrorScreen extends StatelessWidget {
  final String title;
  const ErrorScreen({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
              child: Text(
        title,
        style: kTitleStyle,
      ))),
    );
  }
}
