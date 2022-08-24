import 'package:flutter/material.dart';
import 'package:plant_app/presentation/resources/colors.dart';
import 'package:plant_app/presentation/resources/fonts_manager.dart';
import 'package:plant_app/presentation/resources/values_manager.dart';
import 'package:plant_app/presentation/shared/components/sized_box.dart';
import 'package:plant_app/presentation/shared/components/text_comp.dart';

class TextFormFieldComponent extends StatelessWidget {
  final String txt;
  final TextInputType keyboardType;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final bool isSecure;

  const TextFormFieldComponent(
      {Key? key,
      required this.txt,
      required this.textEditingController,
      this.validator,
      required this.keyboardType,
      this.isSecure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextComponent(
          text: txt,
          textStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontSize: AppSizes.s14,
              color: ColorsManager.secondGreyColor,
              fontWeight: FontsWeightManager.$RobotoRegular),
        ),
        getSizedBoxForHeight(height: AppSizes.s4),
        TextFormField(
          keyboardType: keyboardType,
          cursorColor: ColorsManager.primaryColor,
          obscureText: isSecure,
          controller: textEditingController,
          validator: validator,
          decoration: InputDecoration(
            enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
            focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
            focusedErrorBorder:
                Theme.of(context).inputDecorationTheme.focusedErrorBorder,
            errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
          ),
        ),
      ],
    );
  }
}
