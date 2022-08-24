import 'package:flutter/material.dart';

class AssetImageComponent extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;

  const AssetImageComponent(
      {Key? key, required this.path, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(path),
      height: height,
      width: width,
    );
  }
}
