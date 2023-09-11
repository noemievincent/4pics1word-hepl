import 'package:flutter/material.dart';

import '../../styles/constants.dart';
import 'full_image.dart';
import 'small_image.dart';

class ImagesGrid extends StatefulWidget {
  final List<dynamic> images;
  final bool isInteractive;

  const ImagesGrid({required this.images, this.isInteractive = false, Key? key})
      : super(key: key);

  @override
  State<ImagesGrid> createState() => _GridImagesState();
}

class _GridImagesState extends State<ImagesGrid> {
  late int _index = 0;
  late bool _showFullImage = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Wrap(
        runSpacing: kDefaultSize * 3,
        spacing: kDefaultSize * 3,
        children: [
          for (var i = 0; i < 4; ++i) ...[
            if (widget.isInteractive) ...[
              GestureDetector(
                onTap: () {
                  if (widget.images.isNotEmpty) {
                    setState(() {
                      _index = i;
                      _showFullImage = true;
                    });
                  }
                },
                child: SmallImage(
                    path: widget.images.isNotEmpty ? widget.images[i] : ''),
              )
            ] else ...[
              SmallImage(
                  path: widget.images.isNotEmpty ? widget.images[i] : ''),
            ],
          ],
        ],
      ),
      if (widget.isInteractive && _showFullImage) ...[
        GestureDetector(
            onTap: () {
              setState(() {
                _showFullImage = false;
              });
            },
            child: FullImage(path: widget.images[_index])),
      ],
    ]);
  }
}
