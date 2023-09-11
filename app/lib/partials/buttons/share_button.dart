import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../styles/constants.dart';

class ShareButton extends StatelessWidget {
  final Color color;
  final String icon;

  const ShareButton({required this.color, required this.icon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kDefaultSize * 16,
      height: kDefaultSize * 16,
      padding: const EdgeInsets.all(kDefaultSize * 3),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: darken(color, .06),
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: SvgPicture.asset(icon),
    );
  }
}
