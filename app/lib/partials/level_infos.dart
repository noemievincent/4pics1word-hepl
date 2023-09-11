import 'package:flutter/material.dart';

import '../styles/constants.dart';

class LevelInfos extends StatelessWidget {
  final String label;
  final Color color;

  const LevelInfos({required this.label, required this.color, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(kBorderRadiusFull),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultSize * 8, vertical: kDefaultSize * 3),
          child: Text(label, style: kPillTitleStyle),
        ));
  }
}
