import 'package:flutter/material.dart';

import '../../../styles/constants.dart';

class SmallImage extends StatelessWidget {
  final String path;
  const SmallImage({required this.path, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 173,
      height: 173,
      decoration: BoxDecoration(
        color: kLoadingImageBackground,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(path),
        ),
      ),
    );
  }
}
