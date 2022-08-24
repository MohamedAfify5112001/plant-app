import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plant_app/presentation/resources/colors.dart';
import 'package:plant_app/presentation/resources/fonts_manager.dart';
import 'package:plant_app/presentation/shared/components/elevated_buttom.dart';
import 'package:plant_app/presentation/shared/components/text_comp.dart';

import '../resources/assets_manager.dart';
import '../resources/values_manager.dart';
import '../shared/components/sized_box.dart';
import '../shared/components/svg_img.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Row(
            children: [
              getSizedBoxForWidth(width: AppSizes.s18),
              const SvgImageComponent(
                  path: AssetsManager.arrowBackBlack, width: 30),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.s22, vertical: AppSizes.s12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextComponent(
                  textStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: AppSizes.s20, color: ColorsManager.black),
                  text: "Verification Code"),
              getSizedBoxForHeight(height: AppSizes.s4),
              TextComponent(
                  textStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: AppSizes.s14,
                      fontWeight: FontsWeightManager.$RobotoRegular,
                      color: ColorsManager.thirdGreyColor),
                  text: "We have sent the code verification"),
              getSizedBoxForHeight(height: AppSizes.s35),
              Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 64,
                      height: 68,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "${AppSizes.s0.toInt()}",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: AppSizes.s18,
                                  color: ColorsManager.thirdGreyColor),
                        ),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: AppSizes.s18),
                        onChanged: (val) {
                          if (val.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        cursorColor: ColorsManager.primaryColor,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 64,
                      height: 68,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "${AppSizes.s0.toInt()}",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: AppSizes.s18,
                                  color: ColorsManager.thirdGreyColor),
                        ),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: AppSizes.s18),
                        onChanged: (val) {
                          if (val.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        cursorColor: ColorsManager.primaryColor,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 64,
                      height: 68,
                      child: TextFormField(
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: AppSizes.s18),
                        decoration: InputDecoration(
                          hintText: "${AppSizes.s0.toInt()}",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: AppSizes.s18,
                                  color: ColorsManager.thirdGreyColor),
                        ),
                        onChanged: (val) {
                          if (val.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        cursorColor: ColorsManager.primaryColor,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 64,
                      height: 68,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "${AppSizes.s0.toInt()}",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: AppSizes.s18,
                                  color: ColorsManager.thirdGreyColor),
                        ),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: AppSizes.s18),
                        onChanged: (val) {
                          if (val.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        cursorColor: ColorsManager.primaryColor,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppSizes.s10),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: TextComponent(
                        text: "Resend",
                        textStyle:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: ColorsManager.primaryColor,
                                  fontSize: AppSizes.s16,
                                  fontWeight: FontsWeightManager.$RobotoMed,
                                ),
                      ),
                    ),
                  ),
                  getSizedBoxForWidth(width: AppSizes.s10),
                  Expanded(
                    child: ElevatedButtonShared(
                      radius: AppSizes.s8,
                      text: 'Confirm',
                      onPressed: () {},
                      textStyle:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: ColorsManager.whiteColor,
                                fontSize: AppSizes.s16,
                                fontWeight: FontsWeightManager.$RobotoMed,
                              ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
