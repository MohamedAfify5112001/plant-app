import 'package:flutter/material.dart';

import 'fonts_manager.dart';

TextStyle _makeTextStyle({
  required double fontSize,
  required Color color,
  required FontWeight fontWeight,
}) =>
    TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);

// Light Style
TextStyle getLightStyle(
    {double fontSize = FontsSizesManager.s12,
    FontWeight fontWeight = FontsWeightManager.$RobotoLight,
    required Color color}) {
  final TextStyle textStyle =
      _makeTextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight);
  return textStyle;
}

// Regular Style
TextStyle getRegularStyle(
    {double fontSize = FontsSizesManager.s12,
    FontWeight fontWeight = FontsWeightManager.$RobotoRegular,
    required Color color}) {
  final TextStyle textStyle =
      _makeTextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight);
  return textStyle;
}

// Bold 700 Style
TextStyle getBoldStyle(
    {double fontSize = FontsSizesManager.s12,
    FontWeight fontWeight = FontsWeightManager.$RobotoBold,
    required Color color}) {
  final TextStyle textStyle =
      _makeTextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight);
  return textStyle;
}

// Bold 900 Style
TextStyle getBlackStyle(
    {double fontSize = FontsSizesManager.s12,
    FontWeight fontWeight = FontsWeightManager.$RobotoBlack,
    required Color color}) {
  final TextStyle textStyle =
      _makeTextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight);
  return textStyle;
}
