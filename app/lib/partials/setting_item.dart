import 'package:flutter/material.dart';

import '../styles/constants.dart';

class SettingItem extends StatefulWidget {
  final String label;
  const SettingItem({required this.label, Key? key}) : super(key: key);

  @override
  State<SettingItem> createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> {
  late bool _value = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
            width: MediaQuery.of(context).size.width - kDefaultSize * 30,
            child: Text(widget.label, style: kSettingsStyle)),
        Switch.adaptive(
          value: _value,
          activeColor: kCTAColor,
          onChanged: (newValue) => setState(() => _value = newValue),
        )
      ]),
    );
  }
}
