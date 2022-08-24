import 'package:flutter/material.dart';
import 'package:plant_app/presentation/resources/routes_generators.dart';
import 'package:plant_app/presentation/resources/routes_manager.dart';
import 'package:plant_app/presentation/shared/strings/strings_manager.dart';

import '../../resources/assets_manager.dart';
import '../../resources/colors.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/values_manager.dart';
import '../../shared/components/elevated_buttom.dart';
import '../../shared/components/sized_box.dart';
import '../../shared/components/svg_img.dart';
import '../../shared/components/text_comp.dart';
import '../../shared/components/text_form_field.dart';
import '../../shared/constants/constants.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _textEmailEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _textEmailEditingController.dispose();
    super.dispose();
  }

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
        centerTitle: true,
        title: TextComponent(
          text: "Forget Password",
          textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontsWeightManager.$RobotoBold,
                fontSize: AppSizes.s20,
                color: ColorsManager.black,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.s18),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormFieldComponent(
                  keyboardType: TextInputType.emailAddress,
                  textEditingController: _textEmailEditingController,
                  txt: 'Enter Email Address',
                  validator: (val) {
                    if (val!.isEmpty) {
                      return StringsManager.validName;
                    }
                    return null;
                  },
                ),
                getSizedBoxForHeight(height: AppSizes.s12),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(AppRoutes.$AuthScreenRoute);
                  },
                  child: TextComponent(
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: AppSizes.s13,
                              color: ColorsManager.thirdGreyColor,
                            ),
                    text: StringsManager.backSignIn,
                  ),
                ),
                getSizedBoxForHeight(height: AppSizes.s24),
                SizedBox(
                  width: AppSizes.$300,
                  height: 45,
                  child: ElevatedButtonShared(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    text: AppConstants.send,
                    textStyle:
                        Theme.of(context).textTheme.displayMedium!.copyWith(
                              color: ColorsManager.whiteColor,
                              fontSize: AppSizes.s18,
                              fontWeight: FontsWeightManager.$RobotoMed,
                            ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
