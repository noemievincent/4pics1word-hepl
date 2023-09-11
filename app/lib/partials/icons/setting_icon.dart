import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../styles/constants.dart';
import '../../routes/routes.dart';

class SettingIcon extends StatelessWidget {
  const SettingIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SvgPicture.asset('assets/icons/topbar/setting.svg',
          height: kDefaultSize * 7, color: kSecondaryTextColor),
      onTap: () {
        Navigator.pushNamed(context, kSettingsRoute);
      },
    );
  }
}
