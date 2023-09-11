import 'package:flutter/material.dart';

@immutable
class Link extends StatelessWidget {
  final String text;
  final TextStyle style;
  final GestureTapCallback onTap;

  const Link({required this.text,  required this.style, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
