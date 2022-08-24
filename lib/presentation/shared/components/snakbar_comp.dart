import 'package:flutter/material.dart';
import 'package:plant_app/presentation/shared/components/text_comp.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../resources/colors.dart';

void snakeBarSharedSuccess(
    {required String msg, required BuildContext context}) async {
  return showTopSnackBar(
    context,
    CustomSnackBar.success(
      backgroundColor: ColorsManager.primaryColor,
      message: msg,
    ),
  );
}

void snakeBarSharedError(
    {required String msg, required BuildContext context}) async {
  return showTopSnackBar(
    context,
    CustomSnackBar.error(
      message: msg,
    ),
  );
}
