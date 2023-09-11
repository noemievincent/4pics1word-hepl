import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../styles/constants.dart';

class AccountButton extends StatelessWidget {
  final Color color;
  final TextStyle textStyle;
  final Color iconColor;
  final String icon;
  final String label;

  const AccountButton({Key? key, required this.color, required this.textStyle, required this.icon, required this.label, required this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: kHorizontalSpacer,
            vertical: kVerticalSpacer / 1.5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(kBorderRadiusDefault),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon, width: kDefaultSize*10),
            const SizedBox(width: kDefaultSize * 4),
            Text("Connecter à $label",
                style: textStyle)
          ],
        ));
  }
}
