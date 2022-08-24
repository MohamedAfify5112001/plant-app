import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {
  final String text;
  final TextStyle textStyle;

  const TextComponent({Key? key, required this.textStyle, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
    );
  }
}
