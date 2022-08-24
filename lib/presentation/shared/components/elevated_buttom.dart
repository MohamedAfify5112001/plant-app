import 'package:flutter/material.dart';
import 'package:plant_app/presentation/shared/components/text_comp.dart';

import '../../resources/values_manager.dart';

class ElevatedButtonShared extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final VoidCallback? onPressed;
  final double radius;

  const ElevatedButtonShared(
      {Key? key,
      required this.text,
      required this.textStyle,
      required this.onPressed,
      this.radius = AppSizes.s5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadiusDirectional.all(Radius.circular(radius))),
        ),
        child: TextComponent(
          text: text,
          textStyle: textStyle,
        ));
  }
}
