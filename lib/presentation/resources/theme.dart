import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plant_app/presentation/resources/styles_manager.dart';
import 'package:plant_app/presentation/resources/values_manager.dart';

import 'colors.dart';
import 'fonts_manager.dart';

CardTheme _getCardTheme() => const CardTheme(
    color: ColorsManager.whiteColor,
    elevation: AppSizes.s4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.all(Radius.circular(AppSizes.s10)),
    ),
    shadowColor: ColorsManager.thirdGreyColor);

// AppBar Theme
AppBarTheme _getAppBarTheme() => AppBarTheme(
      color: ColorsManager.whiteColor,
      centerTitle: true,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: ColorsManager.whiteColor,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark),
      shadowColor: ColorsManager.thirdGreyColor,
      titleTextStyle: getRegularStyle(
          color: ColorsManager.whiteColor, fontSize: AppSizes.s14),
      elevation: 0,
    );

// ElevatedButton Theme
ElevatedButtonThemeData _getElevatedButtonThemeData() =>
    ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadiusDirectional.all(Radius.circular(AppSizes.s5)),
          ),
          primary: ColorsManager.primaryColor,
          textStyle: getRegularStyle(
              color: ColorsManager.whiteColor,
              fontSize: FontsSizesManager.s18)),
    );

// Text Theme
TextTheme _getTextTheme() => TextTheme(
      displayLarge: getBoldStyle(
          color: ColorsManager.primaryColor, fontSize: FontsSizesManager.s16),
      headlineLarge: getBlackStyle(
          color: ColorsManager.whiteColor, fontSize: FontsSizesManager.s16),
      titleMedium: getRegularStyle(
          color: ColorsManager.primaryColor, fontSize: FontsSizesManager.s14),
      bodyMedium: getRegularStyle(color: ColorsManager.primaryColor),
      titleSmall: getRegularStyle(color: ColorsManager.primaryColor),
    );

// Text Input Form Field Theme
OutlineInputBorder _getEnableBorderStyle() => const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppSizes.s5)),
      borderSide:
          BorderSide(width: AppSizes.s1, color: ColorsManager.colorBorder),
    );

OutlineInputBorder _getFocusBorderStyle() => const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppSizes.s5)),
      borderSide: BorderSide(
        width: AppSizes.s1,
        color: ColorsManager.colorBorder,
      ),
    );

OutlineInputBorder _getErrorBorderStyle() => const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppSizes.s5)),
      borderSide: BorderSide(
        width: AppSizes.s1,
        color: ColorsManager.error,
      ),
    );

OutlineInputBorder _getErrorFocusedBorderStyle() => const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppSizes.s5)),
      borderSide: BorderSide(
        width: AppSizes.s1,
        color: ColorsManager.secondGreyColor,
      ),
    );

InputDecorationTheme _getInputDecorationTheme() => InputDecorationTheme(
    isDense: true,
    contentPadding: const EdgeInsets.all(AppPadding.p16),
    hintStyle: getRegularStyle(
        color: ColorsManager.firstGreyColor, fontSize: FontsSizesManager.s16),
    labelStyle: getRegularStyle(
        color: ColorsManager.firstGreyColor, fontSize: FontsSizesManager.s14),
    errorStyle: getRegularStyle(
        color: ColorsManager.error, fontSize: FontsSizesManager.s14),
    enabledBorder: _getEnableBorderStyle(),
    focusedBorder: _getFocusBorderStyle(),
    errorBorder: _getErrorBorderStyle(),
    focusedErrorBorder: _getErrorFocusedBorderStyle());

// Attachment of Theme
final CardTheme _cardTheme = _getCardTheme();
final AppBarTheme _appBarTheme = _getAppBarTheme();
final ElevatedButtonThemeData _elevatedButtonThemeData =
    _getElevatedButtonThemeData();
final TextTheme _textTheme = _getTextTheme();
final InputDecorationTheme _inputDecorationTheme = _getInputDecorationTheme();

ThemeData getAppTheme() => ThemeData(
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: AppSizes.s0, backgroundColor: ColorsManager.primaryColor),
      scaffoldBackgroundColor: ColorsManager.whiteColor,
      fontFamily: FontFamily.$FontFamily,
      primaryColor: ColorsManager.primaryColor,
      splashColor: ColorsManager.fourthGreyColor,
      disabledColor: ColorsManager.secondGreyColor,
      cardTheme: _cardTheme,
      appBarTheme: _appBarTheme,
      elevatedButtonTheme: _elevatedButtonThemeData,
      textTheme: _textTheme,
      inputDecorationTheme: _inputDecorationTheme,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            side: BorderSide(
                color: ColorsManager.primaryColor, width: AppSizes.s4),
            borderRadius: BorderRadius.all(
              Radius.circular(AppSizes.s10),
            ),
          ),
        ),
      ),
    );
