import 'package:flutter/material.dart';
import '../../styles/constants.dart';

class Indicator extends StatelessWidget {
  const Indicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: const BoxDecoration(
        color: kCTAColor,
        borderRadius: BorderRadius.all(
          Radius.circular(kBorderRadiusFull),
        ),
      ),
      child: const Center(child: Text("3", style: kHintNumberStyle)),
    );
  }
}
