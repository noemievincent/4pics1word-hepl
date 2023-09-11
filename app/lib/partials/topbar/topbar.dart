import 'package:flutter/material.dart';

import '../../styles/constants.dart';

class TopBar extends StatelessWidget {
  final Widget? leftItem;
  final Widget? rightItem;
  final Color? backgroundColor;
  final String? title;
  final TextStyle? titleStyle;

  const TopBar(
      {Key? key,
      this.leftItem,
      this.rightItem,
      this.backgroundColor,
      this.title,
      this.titleStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundColor != null
          ? BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(kBorderRadiusLarge),
              ),
            )
          : const BoxDecoration(
              color: Colors.transparent,
            ),
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kHorizontalSpacer, vertical: kDefaultSize * 4),
        child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
          if (title != null) ...[
            Text(title!, style: titleStyle ?? kLevelTitleStyle),
          ],
          Row(
            mainAxisAlignment: leftItem != null
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (leftItem != null) ...[leftItem!],
              if (rightItem != null) ...[rightItem!],
            ],
          ),
        ]),
      ),
    );
  }
}
