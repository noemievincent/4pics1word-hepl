import 'package:flutter/material.dart';

import '../../styles/constants.dart';

class FullImage extends StatelessWidget {
  final String path;

  const FullImage({required this.path, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358,
      height: 358,
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
