import 'package:flutter/material.dart';

import '../../styles/constants.dart';

class MainButton extends StatelessWidget {
  final String label;
  final TextStyle style;
  final Color color;
  final VoidCallback? onPressed;

  const MainButton(
      {required this.label,
      required this.style,
      required this.color,
      this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: kVerticalSpacer / 2),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(kBorderRadiusFull),
          ),
          boxShadow: [
            BoxShadow(
              color: darken(color, .06),
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: style,
        ),
      ),
    );
  }
}
