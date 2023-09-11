import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../styles/constants.dart';

class CloseIcon extends StatelessWidget {
  final Color? color;

  const CloseIcon({this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SvgPicture.asset('assets/icons/topbar/close.svg',
          color: color ?? kSecondaryTextColor),
      onTap: () {
        Navigator.of(context).popUntil((route) => route.isFirst);
      },
    );
  }
}
